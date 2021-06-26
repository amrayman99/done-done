import 'package:egycare/Screens/ScanCode/userQr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
 import 'package:intl/intl.dart';
//import 'my_qrcode.dart';
import '../../components/rounded_button.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:egycare/services/local_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../main.dart';

class UserScanScreen extends StatefulWidget {
  @override
  _UserScanScreenState createState() => _UserScanScreenState();
}

class _UserScanScreenState extends State<UserScanScreen> {
  String qrCode;
  var id ;

//newwwwwwwwwwwwwwwwwww
  void initState() {
    // getmyId();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    // generateID();
//newwwwwwwwwwww
    String myId="";
    getmyId()async {
      myId= await LocalHelper.getIdFromLocal();
    }
    getmyId();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        //newwwwwwwwwww

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            QrImage(
              data: prefs.getString('id')??"",
              version: QrVersions.auto,
              size: 300.0,
            ),

            SizedBox(height: 8),
            SizedBox(height: 72),
            RoundedButton(
              text: "أفحص الكود",
              press:  () => scanQRCode(),
            ),

          ],
        ),
        //child: Text('Scan'),
      ),
    );
  }
  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'إلغاء',
        true,
        ScanMode.QR,
      );
      if(qrCode !=-1||qrCode!="-1"||qrCode!=null){
        Navigator.push(context, MaterialPageRoute(builder: (context) => PatData(qrCode),));
      }

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }


}
