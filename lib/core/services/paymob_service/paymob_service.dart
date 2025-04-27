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
    final String paymentKey = await _getPaymentkey(
      amount,
      firstName,
      lastName,
      email,
      street,
      phoneNumber,
      countryCode,
    );
    final Uri url = Uri.parse(
      'https://accept.paymob.com/api/acceptance/iframes/916408?payment_token=$paymentKey',
    );

    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<String> _getPaymentkey(
    double amount,
    String firstName,
    String lastName,
    String email,
    String street,
    String phoneNumber,
    String countryCode,
  ) async {
    try {
      final data = await _api.post(
        url: "https://accept.paymob.com/v1/intention/",
        token: kPaymobSecretKey,
        body: {
          "amount": amount * 100,
          "currency": "EGP",
          "payment_methods": [5066354],
          "items": [],
          "billing_data": {
            "apartment": "",
            "first_name": firstName, //Must
            "last_name": lastName, //Must
            "street": street,
            "building": "",
            "phone_number": phoneNumber, //Must
            "city": "",
            "country": countryCode, //Must
            "email": email, //Must
            "floor": "",
            "state": "",
          },
          "extras": {},
          "expiration": 3600,
        },
      );
      print("===========>");
      print("API Response: ${data}");
      return data["payment_keys"][0]["key"];
    } catch (e) {
      if (e is DioException) {
        // Access the error response
        if (e.response != null) {
          print('Error response: ${e.response?.data}');
        } else {
          print('Error: ${e.message}');
        }
      }
      throw Exception();
    }
  }
}
