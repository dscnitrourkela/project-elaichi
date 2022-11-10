class Mutations {
  static const createUser = r'''
    mutation CreateUser(
      $uid : String!
      $email : String!
      $name : String
      $photo : String
      $rollNumber: String
      $college: String
      $mobile: String!
    ) {
      createUser(user: {
        uid: $uid
        email: $email
        name: $name
        photo: $photo
        rollNumber: $rollNumber
        college: $college
        mobile: $mobile
      }) {
        id
        email
        uid
        name
        photo
        rollNumber
        college
        mobile
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
