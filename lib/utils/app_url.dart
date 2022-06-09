class AppUrl {

  static const String baseUrl = 'https://anyone.azurewebsites.net';

  static const String login =  baseUrl +'/api/Account/authenticate';
  static const String register = baseUrl + '/api/Account/register';
  static const String forgotPassword =  baseUrl +'/api/Account/forgot-password';
}