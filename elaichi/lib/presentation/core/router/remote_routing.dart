import 'package:elaichi/data/remote/graphql/graphql_service.dart';
import 'package:elaichi/presentation/core/router/app_router.dart';
import 'package:elaichi/presentation/core/router/navigation_service.dart';

class NotificationEnum {
  static const Event = 'event';
}

class RemoteRouting {
  final NavigationService navigationService = NavigationService();

  Future<void> navigate(Map<String, dynamic> payload) async {
    if (payload['notification_id'] == NotificationEnum.Event) {
      print(payload['notification_id']);
      try {
        final event = await GraphQLService()
            .getEvents(eventID: payload['notification_id'] as String);
        print(event);
        await navigationService
            .pushNamed(AppRouter.eventDetails, arguments: {'event': event[0]});
      } catch (e) {
        await navigationService.pushNamed(AppRouter.splash);
      }
    }
  }
}
