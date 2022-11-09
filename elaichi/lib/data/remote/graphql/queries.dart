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
  query Org {
    org {
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
    query User($uid: ID) {
      user(uid: $uid) {
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
    query Events($orgId: ID) {
      event(orgID: $orgId) {
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
    }
    ''';

  static const eventRegistrations = r'''
    query EventRegistration($orgId: ID, $userId: ID) {
      eventRegistration(orgID: $orgId, userID: $userId) {
        eventID
      }
    }
  ''';
}
