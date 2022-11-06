import 'package:dartz/dartz.dart';
import 'package:elaichi/data/constants/global_enums.dart';
import 'package:elaichi/data/remote/graphql/graphql_service.dart';
import 'package:elaichi/domain/exceptions/custom_exception.dart';
import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/domain/models/mm_article/mm_article.dart';
import 'package:elaichi/domain/models/org/org.dart';

class EventRepository {
  final GraphQLService _graphQLService = GraphQLService.instance();

  late List<Event>? events;

  Future<Either<CustomException, List<MMArticle>>> fetchMMArticles() async {
    try {
      return Right(await _graphQLService.getArticles());
    } catch (e) {
      return Left(CustomException(e, message: "Couldn't fetch articles"));
    }
  }

  Future<Either<CustomException, List<Org>>> getFests() async {
    try {
      final orgs = await _graphQLService.getOrgs();
      final list =
          orgs.where((element) => element.status == StatusType.ACTIVE).toList();
      return Right(list);
    } catch (e) {
      return Left(CustomException(e, message: 'Unkown Error Occured'));
    }
  }

  Future<Either<CustomException, Unit>> getEvents(String orgID) async {
    try {
      events = await _graphQLService.getEvents(orgID);
      return const Right(unit);
    } catch (e) {
      return Left(CustomException(e));
    }
  }

  Map<String, List<Event>> getCategorisedEvents() {
    final map = <String, List<Event>>{};

    for (final element in events!) {
      if (map.keys.contains(element.type)) {
        map[element.type!]!.add(element);
      } else {
        map[element.type!] = [element];
      }
    }

    return map;
  }
}
