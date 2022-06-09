class User {
  int userId;
  String firstName;
  String lastName;
  String username;
  String email;
  String password;
  String confirmPassword;

  User({
    this.userId,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.password,
    this.confirmPassword,
  });

  // now create converter

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
      userId: responseData['id'],
      firstName: responseData['firstName'],
      lastName: responseData['lastName'],
      username: responseData['username'],
      email: responseData['Email'],
      password: responseData['password'],
      confirmPassword: responseData['confirmPassword']
    );
  }
}
