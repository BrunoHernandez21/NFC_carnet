import 'package:alt_sms_autofill/alt_sms_autofill.dart';


class AutoFillSMS{

  static Future<String?> listenerSMS() async {
    try {
      return await AltSmsAutofill().listenForSms;
    } catch (e) {
      return null;
    }

  }
}