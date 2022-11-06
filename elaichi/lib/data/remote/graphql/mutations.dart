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
}
