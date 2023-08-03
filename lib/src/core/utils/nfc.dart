import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

class UtilsNFC{


  static Future<String?> searchNFC() async {
    try{
      if (await FlutterNfcKit.nfcAvailability != NFCAvailability.available){
        return null;
      }
      final nfcState = await FlutterNfcKit.poll(
        timeout: const Duration(seconds: 10),
        iosMultipleTagMessage: "Multiple tags found!", 
        iosAlertMessage: "Scan your tag"
      );
      if (!(nfcState.ndefAvailable??false)){
        return null;
      }
      final tags = await FlutterNfcKit.readNDEFRecords();
      return tags.first.toString().split(" ").last.replaceAll("text=", "");

    }catch(e){
      return null;
    }
  }
}