import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:twitter/shared_preferences.dart';
import 'package:twitter/utils/app_url.dart';
import 'user.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthProvider extends ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;

  set loggedInStatus(Status value) {
    _loggedInStatus = value;
  }

  Status get registeredInStatus => _registeredInStatus;

  set registeredInStatus(Status value) {
    _registeredInStatus = value;
  }

  Future<Map<String, dynamic>> register(
      String firstName,
      String lastName,
      String email,
      String userName,
      String password,
      String confirmPassword) async {
    final Map<String, dynamic> apiBodyData = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "userName": userName,
      "password": password,
      "confirmPassword": confirmPassword
    };

    return await http
        .post(Uri.parse(AppUrl.register),
            body: json.encode(apiBodyData),
            headers: {
              'accept': '*/*',
              'Content-Type': 'application/json',
              'origin': 'https://anyone.azurewebsites.net'
            })
        .then(onValue)
        .catchError(onError);
  }

  notify() {
    notifyListeners();
  }

  static Future<FutureOr> onValue(http.Response response) async {
    var result;

    final Map<String, dynamic> responseData = json.decode(response.body);
    print(responseData);
    if (response.statusCode == 200) {
      var userData = responseData['data'];

      User authUser = User.fromJson(userData);
      UserPreferences().saveUser(authUser);

      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': authUser
      };
    } else {
      result = {
        'status': false,
        'message': 'Successfully registered',
        'data': responseData
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    var result;

    final Map<String, dynamic> loginData = {
      'email': email,
      'password': password
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    var headers = {
      'Content-Type': 'application/json',
      'Cookie': '.AspNetCore.Identity.Application=CfDJ8FMTNDFhdZ1IhYrnkksdiL4FJKvIxAFRN2_et6_THV4jrsGumEUnoO14uFjB4DortpwT_AGy8Ft25ShBnbqEg954M_da7TXvp7IZxx4Jb70nQeYjX04ds31yauF8jhxHTG3Ux7gyXRKPwNM6t6ZiAH1nHU7OTucn3IKLgfH1W-kWmJcadr_fRKF5nYcn6l_6aBFkPiKMr64fi9_KKNUGXnb0UkL4LDUwdDYYotiCci9H6HqNwK38L1XNPdC62PpttWqQb73Lod_yjYlHGcG3IzVwZ-vuqJU_S5O-9maZSORIKwgLSm31V5JJE1XWKnckQQu50p60l3-aVhwh7pt5JPq9xK_BWj1Lcw-3ajbK8rAM4iL7xuHlU6IWSUfnv3AcQzmqG5wUc6qsgOoKVCoScC28078Wu7YjNsJ2eps_BgKGODs45kpcg3Z1d9NX0bLloaWqovwdujPyFmE2TqoJF9o9nuEvZYhve3oQb2Nw1gyniWii2jnSnF_mxYIJtt9c05y9rBPs3te-njtQzqfxVJIb_efdUGKW0JWB1so2KI0pU7_-olFrxtp4N8CpUTanu_pVkjV_GTUTGS_liEatNNo1ehnq8q4O7iQeSFOSB91KmV67LOp42tqYA30OnYQCLKNVg3S2RLjH0dsYN7AZsA5-mSerELP_QEofQZQc80QQJbScYsixHZT5yHNRBwkBWAu3fKPrHUHpNyyDuVhkBe4; ARRAffinity=79e06db539acb57119e709978d2cf1da299e8341753d6f6345007fcab3f69bc5; ARRAffinitySameSite=79e06db539acb57119e709978d2cf1da299e8341753d6f6345007fcab3f69bc5'
    };
    var request = http.Request('POST',
        Uri.parse('https://anyone.azurewebsites.net/api/Account/authenticate'));
    request.body = json.encode(loginData);
    request.headers.addAll(headers);

    http.StreamedResponse streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (streamedResponse.statusCode == 200) {
      print("geçti..");
      final Map<String, dynamic> responseData = json.decode(response.body);
      var userData = responseData["data"];

      print(userData["userName"]);

      User authUser = User.fromJson(userData);

      UserPreferences().saveUser(authUser);

      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'user': authUser};

      print("girdi");
    } else {
      print("error");
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['errors']
      };
    }
    return result;
  }

  static onError(error) {
    print(error);
    return {'status': false, 'message': 'Unsuccessfull request', 'data': error};
  }
}
