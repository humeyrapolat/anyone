import 'package:shared_preferences/shared_preferences.dart';

import 'user.dart';

class UserPreferences {
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('userId', user.userId);
    prefs.setString('firstName', user.firstName);
    prefs.setString('lastName', user.lastName);
    prefs.setString('username', user.username);
    prefs.setString('email', user.email);
    prefs.setString('password', user.password);
    prefs.setString('confirmPassword', user.confirmPassword);

    return prefs.commit();
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int userId = prefs.getInt("userId");
    String firstName = prefs.getString("firstName");
    String lastName = prefs.getString("lastName");
    String username = prefs.getString("username");
    String email = prefs.getString("email");
    String password = prefs.getString("password");
    String confirmPassword = prefs.getString("confirmPassword");

    return User(
        userId: userId,
        firstName: firstName,
        lastName: lastName,
        username: username,
        email: email,
        password: password,
        confirmPassword: confirmPassword);
  }

}
