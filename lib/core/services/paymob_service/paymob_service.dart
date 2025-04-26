import 'package:betna/constant_keys.dart';
import 'package:betna/core/services/api_service/api.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymobService {
  final Api _api = Api(Dio());

  Future<void> launchCheckOutUrl(
    double amount,
    String firstName,
    String lastName,
    String email,
    String street,
    String phoneNumber,
    String countryCode,
  ) async {
    final String clientSecretKey = await _getClientSecretkey(
      amount,
      firstName,
      lastName,
      email,
      street,
      phoneNumber,
      countryCode,
    );
    final Uri url = Uri.parse(
      'https://accept.paymob.com/unifiedcheckout/?publicKey=$kPaymobPublicKey&clientSecret=$clientSecretKey',
    );

    if (!await launchUrl(url)) { // mode: LaunchMode.inAppWebView 
      throw Exception('Could not launch $url');
    }
  }

  Future<String> _getClientSecretkey(
    double amount,
    String firstName,
    String lastName,
    String email,
    String street,
    String phoneNumber,
    String countryCode,
  ) async {
    final Response response = await _api.post(
      url: "https://accept.paymob.com/v1/intention/",
      token: kPaymobSecretKey,
      body: {
        "amount": amount,
        "currency": "EGP",
        "payment_methods": [
          12,
          "card",
          "you can add Integration id directly or your integration name",
        ],
        "items": [
          // {
          //   "name": "Item name 1",
          //   "amount": 10,
          //   "description": "Watch",
          //   "quantity": 1
          // }
        ],
        "billing_data": {
          "apartment": "",
          "first_name": firstName, //Must
          "last_name": lastName, //Must
          "street": street,
          "building": "",
          "phone_number": phoneNumber, //Must
          "country": countryCode, //Must
          "email": email, //Must
          "floor": "",
          "state": "",
        },
        "customer": {},
        "extras": {},
      },
    );

    return response.data["client_secret"];
  }
}
