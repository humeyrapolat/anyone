import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/auth_provider.dart';
import 'package:twitter/user_provider.dart';
import 'package:twitter/utils/validateEmail.dart';
import 'package:twitter/utils/widget.dart';

import 'user.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  String firstName, lastName, username, email, password, confirmPassword;

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Registering ... Please wait")
      ],
    );

    var doRegister = () {
      print("on doRegister");

      final form = formKey.currentState;
      if (form.validate()) {
        form.save();

        print(firstName);
        print(lastName);
        print(username);
        print(email);
        print(password);
        print(confirmPassword);

        if (password.endsWith(confirmPassword)) {
          auth
              .register(firstName, lastName, email, username, password,
                  confirmPassword)
              .then((response) {
            if (response['status']) {
              User user = response['data'];
              Provider.of<UserProvider>(context,listen: false).setUser(user);
              if(response.containsValue("Confirmed ")){
                Navigator.pushReplacementNamed(context, '/login');
              }
            } else {
              Flushbar(
                title: "Registration fail",
                message: response.toString(),
                duration: Duration(seconds: 20),
              ).show(context);
              Navigator.pushReplacementNamed(context, '/login');
            }
          });
        } else {
          Flushbar(
            title: "Mismatch password",
            message: "Please valid confirm password",
            duration: Duration(seconds: 10),
          ).show(context);
        }
      } else {
        Flushbar(
          title: "Invalid form",
          message: "Please complete the form properly",
          duration: Duration(seconds: 10),
        ).show(context);
      }
    };

    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.0),
                Text("First name"),
                TextFormField(
                  cursorColor: Colors.blue,
                  autofocus: false,
                  validator: (value) =>
                      value.isEmpty ? 'Please enter your name' : null,
                  onSaved: (value) => firstName = value,
                  decoration: buildInputDecoration("Enter name", Icons.person),
                ),
                SizedBox(height: 15.0),
                Text("Last name"),
                TextFormField(
                  autofocus: false,
                  validator: (value) =>
                      value.isEmpty ? 'Please enter your surname' : null,
                  onSaved: (value) => lastName = value,
                  decoration:
                      buildInputDecoration("Enter surname", Icons.person),
                ),
                SizedBox(height: 15.0),
                Text("Username"),
                TextFormField(
                  autofocus: false,
                  validator: (value) =>
                      value.isEmpty ? 'Username is required ' : null,
                  onSaved: (value) => username = value,
                  decoration:
                      buildInputDecoration("Enter username", Icons.drive_file_rename_outline),
                ),
                SizedBox(height: 15.0),
                Text("Email"),
                TextFormField(
                  autofocus: false,
                  validator: validateEmail,
                  onSaved: (value) => email = value,
                  decoration: buildInputDecoration("Enter e-mail", Icons.email),
                ),
                SizedBox(height: 15.0),
                Text("Password"),
                TextFormField(
                  autofocus: false,
                  obscureText: true,
                  validator: (value) =>
                      value.isEmpty ? 'Please enter your password' : null,
                  onSaved: (value) => password = value.toString(),
                  decoration:
                      buildInputDecoration("Enter password", Icons.lock),
                ),
                SizedBox(height: 15.0),
                Text("Confirm Password"),
                TextFormField(
                  autofocus: false,
                  obscureText: true,
                  validator: (value) =>
                      value.isEmpty ? 'Password is required ' : null,
                  onSaved: (value) => confirmPassword = value.toString(),
                  decoration: buildInputDecoration(
                      "Enter confirm password", Icons.lock),
                ),
                SizedBox(
                  height: 20.0,
                ),
                auth.loggedInStatus == Status.Authenticating
                    ? loading
                    : longButtons("Register", doRegister)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
