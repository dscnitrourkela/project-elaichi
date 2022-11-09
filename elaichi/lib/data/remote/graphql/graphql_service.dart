// ignore_for_file: avoid_dynamic_calls

import 'package:elaichi/data/constants/app_env.dart';
import 'package:elaichi/data/remote/graphql/mutations.dart';
import 'package:elaichi/data/remote/graphql/queries.dart';
import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/domain/models/event_registration/event_registration.dart';
import 'package:elaichi/domain/models/mm_article/mm_article.dart';
import 'package:elaichi/domain/models/org/org.dart';
import 'package:elaichi/domain/models/user/user.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';

enum GQLClient { mondayMorning, avenue }

class GraphQLService {
  factory GraphQLService() => _graphQLService;

  GraphQLService._internal();

  late GraphQLClient _client;
  late GraphQLClient _mmClient;
  static final GraphQLService _graphQLService = GraphQLService._internal();

  Future<void> init(String token) async {
    // Avenue Config
    final avenueHttpLink = HttpLink(Env.avenueServerUrl);

    final avenueAuthLink = AuthLink(getToken: () async => 'Bearer $token');

    final avenueLink = avenueAuthLink.concat(avenueHttpLink);

    _client = GraphQLClient(
      cache: GraphQLCache(),
      link: avenueLink,
    );

    // MM Config
    final mmLink = HttpLink(Env.mondayMorningUrl);

    _mmClient = GraphQLClient(
      link: mmLink,
      cache: GraphQLCache(),
    );
  }

  // Helper Functions

  /// Helper function for performing a GraphQL query.
  Future<QueryResult> query({
    required String queryString,
    GQLClient gQLClient = GQLClient.avenue,
    Map<String, dynamic> variables = const {},
  }) async {
    late GraphQLClient client;
    if (gQLClient == GQLClient.avenue) {
      client = _client;
    } else {
      client = _mmClient;
    }

    try {
      final options =
          QueryOptions(document: gql(queryString), variables: variables);

      final result = await client.query(options);

      if (result.data != null) {
        return result;
      } else if (result.hasException) {
        throw Exception(result.exception);
      } else {
        throw Exception('Something went wrong');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<QueryResult> mutation({
    required String mutationString,
    required Map<String, dynamic> variables,
  }) async {
    try {
      final options =
          MutationOptions(document: gql(mutationString), variables: variables);

      final result = await _client.mutate(options);

      if (result.data != null) {
        return result;
      } else if (result.hasException) {
        throw Exception(result.exception);
      } else {
        throw Exception('Something went wrong');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // Event Operations

  Future<List<Event>> getEvents(String orgID) async {
    try {
      final result = await query(
        queryString: Queries.getEvents,
        variables: {'orgId': orgID},
      );

      final events = (result.data!['event'] as List<dynamic>)
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList();

      return events;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Org>> getOrgs() async {
    try {
      final result = await query(queryString: Queries.getOrgs);

      final orgsList = (result.data!['org'] as List<dynamic>)
          .map((e) => Org.fromJson(e as Map<String, dynamic>))
          .toList();
      return orgsList;
    } catch (e) {
      rethrow;
    }
  }

  Future<User> getUser(String uid) async {
    try {
      final result =
          await query(queryString: Queries.getUser, variables: {'uid': uid});

      final userList = (result.data!['user'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList();

      return userList[0];
    } catch (e) {
      rethrow;
    }
  }

  Future<User> createUser({
    required String uid,
    required String email,
    required String name,
    required String rollNumber,
    required String college,
    String? photo,
  }) async {
    try {
      final result = await mutation(
        mutationString: Mutations.createUser,
        variables: {
          'uid': uid,
          'email': email,
          'name': name,
          'photo': photo,
          'rollNumber': rollNumber,
          'college': college
        },
      );

      final user =
          User.fromJson(result.data!['createUser'] as Map<String, dynamic>);

      return user;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<EventRegistration> createEventRegistration({
    required String eventID,
    required String userID,
  }) async {
    try {
      final result = await mutation(
        mutationString: Mutations.createEventRegistration,
        variables: {
          'userId': userID,
          'eventId': eventID,
        },
      );

      final eventRegistration = EventRegistration.fromJson(
        result.data!['createEventRegistration'] as Map<String, dynamic>,
      );
      return eventRegistration;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<EventRegistration>> getEventRegistration({
    required String orgID,
    required String userID,
  }) async {
    try {
      final result = await query(
        queryString: Queries.eventRegistrations,
        variables: {'userId': userID, 'orgID': orgID},
      );

      final eventRegistrations =
          (result.data!['eventRegistration'] as List<dynamic>)
              .map((e) => EventRegistration.fromJson(e as Map<String, dynamic>))
              .toList();

      return eventRegistrations;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MMArticle>> getArticles() async {
    try {
      final result = await query(
        queryString: Queries.mmArticleQuery,
        gQLClient: GQLClient.mondayMorning,
      );

      final articleList = <MMArticle>[];

      final articles = result.data!['getLatestIssues'][0]['articles'] as List;

      for (final element in articles) {
        articleList.add(
          MMArticle(
            id: element['id'] as String,
            title: element['title'] as String,
            imageUrl: element['coverMedia']['rectangle']['storePath'] as String,
          ),
        );
      }

      return articleList;
    } catch (e) {
      rethrow;
    }
  }
}

enum GQlClient { mondayMorning, avenue }
