class Queries {
  static const events = '''
  query events{
  events {
    id
    name
    startTime
    category
    type
    description
    durationInMin
    image
    location
    locationDesc
  }
}
''';
}
