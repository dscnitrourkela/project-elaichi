import 'package:elaichi/core.dart';
import 'package:elaichi/datamodels.dart';
import 'package:elaichi/services.dart';
import 'package:injectable/injectable.dart';

/// An implementation of Api class to feed fake data to the app.
/// Use this for development during internet outages, server downtime,
/// or API unavailability. Helps in rapid prototyping of the app.

@LazySingleton(as: Api, env: [Env.dev])
class FakeApi implements Api {
  @override
  Future<List<CurrentStory>> getCurrentStories() {
    final story = CurrentStory(
        id: '1',
        club: Club(
            logo: 'logo',
            clubName: 'DesignTab',
            id: '1',
            facAd: 'Prof. ABC',
            society: 'Technical Society',
            domain: 'desgintab.com'),
        event: null,
        assetType: 'image',
        createdAt: DateTime(2021, 1, 31),
        asset: 'assetUrl',
        description: 'Description');
    return Future.value(List<CurrentStory>.generate(10, (index) => story));
  }

  @override
  Future<List<ScheduleEvent>> fetchSchedule() {
    final scheduleEvent = ScheduleEvent(
        time: '4.30 PM',
        identifier: 'MA-3002',
        title: 'Computational Mathematics',
        contact: 'Prof. Nihar Patra');
    return Future.value(
        List<ScheduleEvent>.generate(6, (index) => scheduleEvent));
  }
}
