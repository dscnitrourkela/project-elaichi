// ignore_for_file: public_member_api_docs

import 'package:flutter/widgets.dart';

class Club {
  ///
  Club(
      {@required this.id,
      @required this.clubName,
      @required this.facAd,
      @required this.logo,
      @required this.society,
      @required this.domain});

  final String id;
  final String clubName;
  final String facAd;
  final String logo;
  final String society;
  final String domain;
}

/// Defines the data model for a Story
class CurrentStory {
  ///
  CurrentStory(
      {@required this.id,
      @required this.club,
      @required this.event,
      @required this.asset,
      @required this.assetType,
      @required this.description,
      @required this.createdAt});

  final String id;
  final Club club;
  final Event event;
  final String asset;
  final String assetType;
  final String description;
  final DateTime createdAt;
}

///
class Event {
  ///
  Event(
      {@required this.id,
      @required this.organizer,
      @required this.eventName,
      @required this.startDateTime,
      @required this.endDateTime,
      @required this.registrationPrice,
      @required this.registrationCount,
      @required this.otherDescription,
      @required this.attendees,
      @required this.announcements,
      @required this.link,
      @required this.picture});

  final String id;
  final Club organizer;
  final String eventName;
  final String startDateTime;
  final String endDateTime;
  final int registrationPrice;
  final int registrationCount;
  final String otherDescription;
  final List<User> attendees;
  final String announcements;
  final String link;
  final String picture;
}

///
class ScheduleEvent {
  ///
  ScheduleEvent({
    @required this.identifier,
    @required this.title,
    @required this.contact,
    @required this.time,
  });

  final String time;
  final String identifier;
  final String title;
  final String contact;
}

class User {}
