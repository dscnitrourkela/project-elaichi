// ignore_for_file: avoid_dynamic_calls

import 'package:elaichi/data/constants/app_env.dart';
import 'package:elaichi/data/remote/graphql/queries.dart';
import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/domain/models/mm_article/mm_article.dart';
import 'package:elaichi/domain/models/user_model.dart';
import 'package:graphql/client.dart';

enum GQLClient { mondayMorning, avenue }

class GraphQLService {
  factory GraphQLService() {
    return _graphQLService;
  }

  GraphQLService._internal();

  late final GraphQLClient _client;
  late final GraphQLClient _mmClient;
  static final GraphQLService _graphQLService = GraphQLService._internal();

  void init() {
    // Avenue Config
    final _avenueHttpLink = HttpLink(Env.avenueServerUrl);

    final _avenueAuthLink = AuthLink(
      getToken: () async => 'Bearer ${Splash.instance().user!.getIdToken()}',
    );

    final _avenueLink = _avenueAuthLink.concat(_avenueHttpLink);

    _client = GraphQLClient(
      cache: GraphQLCache(),
      link: _avenueLink,
    );

    // MM Config
    final _mmLink = HttpLink(Env.mondayMorningUrl);

    _mmClient = GraphQLClient(
      link: _mmLink,
      cache: GraphQLCache(),
    );
  }

  // Helper Functions

  /// Helper function for performing a GraphQL query.
  Future<QueryResult> query({
    required String queryString,
    GQLClient gQLClient = GQLClient.avenue,
  }) async {
    late GraphQLClient client;
    if (gQLClient == GQLClient.avenue) {
      client = _client;
    } else {
      client = _mmClient;
    }

    try {
      final options = QueryOptions(document: gql(queryString));

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

  // Event Operations

  Future<List<Event>> getEvents() async {
    try {
      final result = await query(queryString: Queries.events);
      final events = (result.data!['events'] as List<dynamic>)
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList();

      return events;
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
