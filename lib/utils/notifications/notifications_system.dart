import 'dart:convert';
import 'dart:developer';

import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;
import 'package:nectar/firebase_options.dart';
import 'package:nectar/utils/essentials.dart';

class NotificationsSystem {
  static Future<String> getAccessToken() async {
    List<String> scopes = [
      "https://www.googleapis.com/auth/firebase.messaging"
    ];

    http.Client client = await auth.clientViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(SecretEssential().serviceKey),
        scopes);

    //get access token
    auth.AccessCredentials credentials =
        await auth.obtainAccessCredentialsViaServiceAccount(
            auth.ServiceAccountCredentials.fromJson(
                SecretEssential().serviceKey),
            scopes,
            client);

    client.close();

    return credentials.accessToken.data;
  }

  static Future<bool> sendPushNotification(
      {required String receipentToken,
      required String title,
      required String message,
      required String orderId}) async {
    try {
      //server key
      String serverKey = await getAccessToken();

      String endPoint =
          'https://fcm.googleapis.com/v1/projects/${DefaultFirebaseOptions.android.projectId}/messages:send';

      //notification message
      final notificationMessage = {
        "message": {
          "token": receipentToken,
          "notification": {"body": message, "title": orderId}
        }
      };

      // send post request

      http.Response response = await http.post(Uri.parse(endPoint),
          headers: <String, String>{
            "Content-Type": "applicaton/json",
            "Authorization": "Bearer $serverKey"
          },
          body: jsonEncode(notificationMessage));

      // response
      if (response.statusCode == 200) {
        return true;
      } else {
        log(response.statusCode.toString());
        return false;
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
