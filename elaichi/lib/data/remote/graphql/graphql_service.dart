import 'package:elaichi/data/remote/graphql/queries.dart';
import 'package:elaichi/domain/models/event.dart';
import 'package:graphql/client.dart';

class GraphQLService {
  factory GraphQLService() {
    return _graphQLService;
  }

  GraphQLService._internal();

  late final GraphQLClient _client;
  static final GraphQLService _graphQLService = GraphQLService._internal();

  void init() {
    final _httpLink = HttpLink(
      'https://test.dscnitrourkela.org/graphql',
    );

    // final _authLink = AuthLink(
    //   getToken: () async => 'Bearer $YOUR_PERSONAL_ACCESS_TOKEN',
    // );

    // final _link = _authLink.concat(_httpLink);

    _client = GraphQLClient(
      cache: GraphQLCache(),
      link: _httpLink,
    );
  }

  // Helper Functions

  /// Helper function for performing a GraphQL query.
  Future<QueryResult> query({required String queryString}) async {
    try {
      final options = QueryOptions(document: gql(queryString));

      final result = await _client.query(options);

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
}
