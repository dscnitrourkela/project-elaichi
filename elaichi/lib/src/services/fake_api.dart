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
          clubName: 'DesignTab',
          id: '1',
          facAd: 'Prof. ABC',
          society: 'Technical Society',
          domain: 'desgintab.com',
          theme: ViewTheme(
              backgroundColor: '2D3077',
              logo: 'assets/images/dt.png',
              name: 'DesignTab'),
          contactInfo: [],
          description: null,
          members: [],
        ),
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

  @override
  Future<Club> fetchClub({int clubId}) {
    final clubDetails = Club(
      clubName: 'DesignTab',
      id: '1',
      facAd: 'Prof. ABC',
      society: 'Technical Society',
      description:
          '''DesignTab aims to bring together all aspects of designing under a single hood and create a productive environment for young designers. ''',
      domain: 'desgintab.com',
      theme: ViewTheme(
          backgroundColor: '2D3077',
          logo: 'assets/images/dt.png',
          name: 'DesignTab'),
      contactInfo: [
        ContactInfo(
            designation: 'President',
            email: null,
            mobileNo: null,
            name: 'Saumyaa Suneja'),
        ContactInfo(
            designation: 'Vice President',
            email: null,
            mobileNo: null,
            name: 'Reuben Abraham'),
      ],
      members: [
        AccessLevel(
          club: null,
          level: 4,
          id: null,
          name: 'Chinmay Kabi',
          relation: 'President',
          user: null,
        ),
        AccessLevel(
          club: null,
          level: 4,
          id: null,
          name: 'Smarak Das',
          relation: 'Vice President',
          user: null,
        ),
        AccessLevel(
          club: null,
          level: 2,
          id: null,
          name: 'Oonga Bunga',
          relation: 'No one',
          user: null,
        ),
      ],
    );
    final event = Event(
      id: '42',
      organizer: clubDetails,
      eventName: 'Orientation',
      startDateTime: DateTime(2020, 8, 20),
      endDateTime: DateTime(2020, 8, 20),
      registrationPrice: 0,
      registrationCount: 42,
      otherDescription: 'Get to know everything about '
          'DesignTab and why you should be a '
          'part of it.',
      attendees: null,
      announcements: 'None',
      link: 'google.com',
      picture: 'assets/images/dt_1.png',
      location: 'LA-117',
    );
    clubDetails.events = List<Event>.generate(4, (index) => event);
    return Future.delayed(const Duration(seconds: 0), () => clubDetails);
  }

  @override
  Future<List<CurrentStory>> getStoriesByField({int clubId}) {
    final story_1 = CurrentStory(
        id: '1',
        club: Club(
          clubName: 'DesignTab',
          id: '1',
          facAd: 'Prof. ABC',
          society: 'Technical Society',
          domain: 'desgintab.com',
          theme: ViewTheme(
              backgroundColor: '2D3077',
              logo: 'assets/images/dt.png',
              name: 'DesignTab'),
          contactInfo: [],
          description: null,
          members: [],
        ),
        event: null,
        assetType: 'image',
        createdAt: DateTime(2021, 1, 31),
        asset: 'assets/images/dt_1.png',
        description: 'Description');
    final story_2 = CurrentStory(
        id: '1',
        club: Club(
          clubName: 'DesignTab',
          id: '1',
          facAd: 'Prof. ABC',
          society: 'Technical Society',
          domain: 'desgintab.com',
          theme: ViewTheme(
              backgroundColor: '2D3077',
              logo: 'assets/images/dt.png',
              name: 'DesignTab'),
          contactInfo: [],
          description: null,
          members: [],
        ),
        event: null,
        assetType: 'image',
        createdAt: DateTime(2021, 2, 21),
        asset: 'assets/images/dt_2.png',
        description: 'Description');
    final story_3 = CurrentStory(
        id: '1',
        club: Club(
          clubName: 'DesignTab',
          id: '1',
          facAd: 'Prof. ABC',
          society: 'Technical Society',
          domain: 'desgintab.com',
          theme: ViewTheme(
              backgroundColor: '2D3077',
              logo: 'assets/images/dt.png',
              name: 'DesignTab'),
          contactInfo: [],
          description: null,
          members: [],
        ),
        event: null,
        assetType: 'image',
        createdAt: DateTime(2021, 3, 31),
        asset: 'assets/images/dt_3.png',
        description: 'Description');
    final story_4 = CurrentStory(
        id: '1',
        club: Club(
          clubName: 'DesignTab',
          id: '1',
          facAd: 'Prof. ABC',
          society: 'Technical Society',
          domain: 'desgintab.com',
          theme: ViewTheme(
              backgroundColor: '2D3077',
              logo: 'assets/images/dt.png',
              name: 'DesignTab'),
          contactInfo: [],
          description: null,
          members: [],
        ),
        event: null,
        assetType: 'image',
        createdAt: DateTime(2021, 3, 31),
        asset: 'assets/images/dt_3.png',
        description: 'Description');

    return Future.delayed(
      const Duration(seconds: 0),
      () => [story_1, story_3, story_2, story_4],
    );
  }
}
