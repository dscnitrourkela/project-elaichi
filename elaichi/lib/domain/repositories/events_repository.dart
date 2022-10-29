import 'package:dartz/dartz.dart';
import 'package:elaichi/data/local/local_storage_service.dart';
import 'package:elaichi/data/remote/api_service.dart';
import 'package:elaichi/data/remote/graphql/graphql_service.dart';
import 'package:elaichi/domain/exceptions/custom_exception.dart';
import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/domain/models/mm_article/mm_article.dart';

class EventRepository {
  EventRepository({
    required LocalStorageService localStorageService,
    required APIService apiService,
    required GraphQLService graphQLService,
  })  : _apiService = apiService,
        _graphQLService = graphQLService,
        _localStorageService = localStorageService;

  final GraphQLService _graphQLService;
  final APIService _apiService;
  final LocalStorageService _localStorageService;

  late List<Event>? events;

  Future<void> fetchEvents() async {
    try {
      events = await _graphQLService.getEvents();
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<CustomException, List<MMArticle>>> fetchMMArticles() async {
    try {
      return Right(await _graphQLService.getArticles());
    } catch (e) {
      return Left(CustomException(e, message: "Couldn't fetch articles"));
    }
  }

  // void getEventByDateList() {
  //   List<List<Event>> fullEventList;

  //   final list = <Event>[];

  //   final groupList = groupBy(
  //     events!,
  //     (Event event) => DateTime(event.startTime.day),
  //   ).entries.toList();

  //   print(groupList);
  // }
}
