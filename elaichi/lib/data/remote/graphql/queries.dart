class Queries {
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

  static const getOrgs = '''
  query GetOrgs {
    getOrgs {
      id
      name
      description
      logo
      tagline
      coverImg
      theme
      registrationFee
      startDate
      endDate
      status
      orgSubType
      orgType
      locationID
      festID
    }
}
''';

  static const getUser = r'''
    query GetUser($uid: ID) {
      getUser(uid: $uid) {
        id
        email
        uid
        name
        photo
        rollNumber
        college
      }
    }
''';

  static const getEvents = r'''
    query GetEvents($orgId: ID) {
      getEvents(orgID: $orgId) {
        id
        name
        description
        poster
        startDate
        endDate
        orgType
        notes
        weekly
        repeatDay
        priority
        type
        status
        locationID
        pocID
        orgID
      }
    } ''';
}
