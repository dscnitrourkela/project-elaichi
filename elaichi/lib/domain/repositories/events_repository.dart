import 'package:dartz/dartz.dart';
import 'package:elaichi/data/constants/global_enums.dart';
import 'package:elaichi/data/remote/graphql/graphql_service.dart';
import 'package:elaichi/domain/exceptions/custom_exception.dart';
import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/domain/models/event_registration/event_registration.dart';
import 'package:elaichi/domain/models/mm_article/mm_article.dart';
import 'package:elaichi/domain/models/org/org.dart';
import 'package:intl/intl.dart';

class EventRepository {
  final GraphQLService _graphQLService = GraphQLService();

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
      return Left(CustomException(e, message: "Coudn't fetch Fests"));
    }
  }

  Future<Either<CustomException, List<Event>>> getEvents({
    String? orgID,
    String? eventID,
  }) async {
    try {
      final events =
          await _graphQLService.getEvents(orgID: orgID, eventID: eventID);
      return Right(events);
    } catch (e) {
      return Left(CustomException(e));
    }
  }

  Future<Either<CustomException, EventRegistration>> createEventRegistration({
    required String eventID,
    required String userID,
  }) async {
    try {
      final eventRegistration = await _graphQLService.createEventRegistration(
        eventID: eventID,
        userID: userID,
      );

      return Right(eventRegistration);
    } catch (e) {
      return Left(CustomException(e, message: 'Event Registration Failed'));
    }
  }

  Future<Either<CustomException, List<EventRegistration>>>
      getEventRegistration({
    required String orgID,
    required String userID,
  }) async {
    try {
      final eventRegistrations = await _graphQLService.getEventRegistration(
        orgID: orgID,
        userID: userID,
      );

      return Right(eventRegistrations);
    } catch (e) {
      return Left(
        CustomException(
          e,
          message: 'Unknown error Occured',
        ),
      );
    }
  }

  Map<String, List<Event>> getCategorisedEvents(List<Event> events) {
    final map = <String, List<Event>>{
      'TECHNICAL': [],
      'PRO': [],
      'GUEST-LECTURES': [],
      'EXHIBITIONS': [],
      'FUN': [],
      'WORKSHOP': [],
    };

    for (final element in events) {
      if (map.keys.contains(element.type)) {
        map[element.type!]!.add(element);
      } else {
        map[element.type!] = [element];
      }
    }

    return map;
  }

  Map<String, List<Event>> getCalender(List<Event> events) {
    final map = <String, List<Event>>{};
    events.sort(
      (a, b) => a.startDate.compareTo(b.startDate),
    );

    final format = DateFormat('MMM');
    // TODO : Make this dynamic
    const startDate = 3;
    const endDate = 5;
    for (final element in events) {
      if (element.startDate.day < startDate) {
        continue;
      }
      if (element.startDate.day > endDate) {
        continue;
      }
      if (element.status == StatusType.EXPIRED) {
        continue;
      }
      if (map.keys.contains(
        '${element.startDate.day} ${format.format(element.startDate)}',
      )) {
        map['${element.startDate.day} ${format.format(element.startDate)}']!
            .add(element);
      } else {
        map['${element.startDate.day} ${format.format(element.startDate)}'] = [
          element,
        ];
      }
    }
    return map;
  }
}
