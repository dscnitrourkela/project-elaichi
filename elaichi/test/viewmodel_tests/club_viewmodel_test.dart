import 'package:dartz/dartz.dart';
import 'package:elaichi/app/locator.dart';
import 'package:elaichi/datamodels/datamodels.dart';
import 'package:elaichi/services/api.dart';
import 'package:elaichi/ui/views/club/club_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../setup/test_helpers.dart';

void main() {
  Club clubDetails;
  Event event;
  CurrentStory story_1, story_2, story_3, story_4;

  setUp(
    () async {
      await registerServices();
      clubDetails = Club(
        clubName: 'DesignTab',
        id: '1',
        facAd: 'Prof. ABC',
        society: 'Technical Society',
        domain: 'desgintab.com',
        theme: ViewTheme(
            backgroundColor: '2D3077',
            logo: 'assets/images/dt.png',
            name: 'DesignTab'),
      );
      event = Event(
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
        theme: ViewTheme(
          backgroundColor: '2D3E6F',
          logo: '',
          name: 'DesignTab',
        ),
      );
      story_1 = CurrentStory(
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
          ),
          event: null,
          assetType: 'image',
          createdAt: DateTime(2021, 1, 31),
          asset: 'assets/images/dt_1.png',
          description: 'Description');
      story_2 = CurrentStory(
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
          ),
          event: null,
          assetType: 'image',
          createdAt: DateTime(2021, 2, 21),
          asset: 'assets/images/dt_2.png',
          description: 'Description');
      story_3 = CurrentStory(
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
          ),
          event: null,
          assetType: 'image',
          createdAt: DateTime(2021, 3, 31),
          asset: 'assets/images/dt_3.png',
          description: 'Description');
      story_4 = CurrentStory(
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
          ),
          event: null,
          assetType: 'image',
          createdAt: DateTime(2021, 3, 31),
          asset: 'assets/images/dt_3.png',
          description: 'Description');
      clubDetails.events = List<Event>.generate(4, (index) => event);
    },
  );
  tearDown(unregisterServices);

  group(
    'ClubViewmodelTest -',
    () {
      test(
        'initialise',
        () async {
          final model = ClubViewModel();
          final mockApi = locator<Api>();
          when(mockApi.fetchClub(clubId: 23)).thenAnswer(
            (_) async => clubDetails,
          );
          when(mockApi.getStoriesByField(clubId: 23)).thenAnswer(
            (_) async => [story_1, story_3, story_2, story_4],
          );
          await model.initialise(23);
          expect(model.isBusy, false);
          expect(
            model.storiesArchive,
            Right([story_1, story_3, story_2, story_4]),
          );
        },
      );
    },
  );
}
