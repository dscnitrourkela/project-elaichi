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

  static const mmArticleQuery = '''
    query getLatestIssues {
      getLatestIssues(onlyPublished: true, limit: 1) {
        articles {
          id
          coverMedia {
            rectangle {
              store
              storePath
              blurhash
            }
          }
          title
        }
      }
    }
''';
}
