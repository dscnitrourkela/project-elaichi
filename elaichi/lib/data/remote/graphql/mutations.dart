class Mutations {
  static const createUser = r'''
    mutation CreateUser(
      $uid : String!
      $email : String!
      $name : String
      $photo : String
      $rollNumber: String
      $college: String
    ) {
      createUser(user: {
        uid: $uid
        email: $email
        name: $name
        photo: $photo
        rollNumber: $rollNumber
        college: $college
      }) {
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

  static const createEventRegistration = r'''
    mutation CreateEventRegistration($userId: ID!, $eventId: ID!) {
      createEventRegistration(eventRegistration: {userID: $userId, eventID: $eventId}) {
        id
        userID
        eventID
      }
    }
  ''';
}
