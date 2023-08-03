import 'package:permission_handler/permission_handler.dart';

class AppPermission{

  static void checkAll() {
    [
      Permission.storage,
      Permission.sms,
    ].request();
  }
}
