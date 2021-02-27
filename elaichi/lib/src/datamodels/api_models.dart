// ignore_for_file: public_member_api_docs

import 'package:flutter/widgets.dart';

import 'user.dart';

class Club {
  Club({
    @required this.id,
    @required this.clubName,
    @required this.facAd,
    @required this.society,
    @required this.domain,
    @required this.theme,
    this.events,
  });

  final String id;
  final String clubName;
  final String facAd;
  final String society;
  final String domain;
  final ViewTheme theme;
  List<Event> events;
}

/// Defines the theme for a specific club
class ViewTheme {
  ViewTheme({
    @required this.name,
    @required this.logo,
    @required this.backgroundColor,
  });

  final String name;
  final String logo;
  final String backgroundColor;
}

/// Defines contact info for a club/event
class ContactInfo {
  ContactInfo(
      {@required this.name,
      @required this.designation,
      @required this.mobileNo,
      @required this.email});

  final String name;
  final String designation;
  final String mobileNo;
  final String email;
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
      @required this.picture,
      @required this.theme});

  final String id;
  final Club organizer;
  final String eventName;
  final DateTime startDateTime;
  final DateTime endDateTime;
  final int registrationPrice;
  final int registrationCount;
  final String otherDescription;
  final List<User> attendees;
  final String announcements;
  final String link;
  final String picture;
  final ViewTheme theme;
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
