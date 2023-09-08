import 'package:arb_kiosk_flutter/attendance/user_check_in_out.dart';
import 'package:arb_kiosk_flutter/home/qr_scanner.dart';
import 'package:arb_kiosk_flutter/widgets/rounded_button.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'camera_helper.dart';

class UserHome extends StatefulWidget {
  // const UserHome({Key? key}) : super(key: key);
  static String id = 'UserHome';

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  String _scanBarcode = 'Unknown';
  late CameraController controller;

  void initState() {
    super.initState();
  }
  Future<void> scanQR() async {
    WidgetsFlutterBinding.ensureInitialized();
    String barcodeScanRes;
    List<CameraDescription> _cameras = await availableCameras();
    final firstCamera = _cameras.first;
     controller = CameraController(_cameras.last, ResolutionPreset.max, imageFormatGroup: ImageFormatGroup.jpeg);
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {

      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
/*    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
      print('ORCode Value: ${_scanBarcode}');
      if(_scanBarcode.length > 20) {
        Navigator.pushNamed(context, UserCheckInOut.id);
      }

    });*/

    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() async {
        /*try {

          barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#ff6666', 'Cancel', true, ScanMode.QR);
          print(barcodeScanRes);
        } on PlatformException {
          barcodeScanRes = 'Failed to get platform version.';
        }
        _scanBarcode = barcodeScanRes;
        print('ORCode Value: ${_scanBarcode}');
        if(_scanBarcode.length > 20) {
          Navigator.pushNamed(context, UserCheckInOut.id);
        }*/
      });
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
          // Handle access errors here.
            break;
          default:
          // Handle other errors here.
            break;
        }
      }
    });
    CameraPreview(controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        // backgroundColor: Color.fromRGBO(2, 72, 254, 1.0),

        /*appBar: AppBar(
          // backgroundColor: Color.fromRGBO(71, 71, 71, 1.0),
          backgroundColor: Color.fromRGBO(2, 72, 254, 1.0),
          centerTitle: false,
          automaticallyImplyLeading: false,
          actions: [
            Builder(
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text('Hello ${EmployeeLogin.employeeJsonData['employee']['employee_full_name']} (${EmployeeLogin.employeeJsonData['user']['user_name']})', style: TextStyle(fontSize: 14, color: Colors.white),),
                        // MediaQuery.of(context).size.width > 950 ? Text('Hello nnnd nfnnfnnf fnnfnfnfnf', style: TextStyle(fontSize: 14, color: Colors.white),) : SizedBox(),

                        SizedBox(width: 10,),

                      ],
                    ),
                  );
                }
            ),
          ],

        ),*/
        body: Container(
          // color: Colors.lightGreenAccent,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  // Color.fromRGBO(2, 72, 254, 1.0),
                  /*Colors.blue,
                  Colors.yellow,
                  Colors.redAccent,*/
                  Color.fromRGBO(222, 235, 255, 1.0),

                  // Color.fromRGBO(222, 235, 255, 1.0),
                  Color.fromRGBO(222, 235, 255, 1.0),
                  Color.fromRGBO(23, 42, 70, 1.0),


                ],
              )
            // color: Color.fromRGBO(2, 72, 254, 1.0)
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(35, 20, 20, 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Color.fromRGBO(87, 87, 87, 1.0),
                  child: Center(child: Image.asset('images/usericon.png', width: 50, height: 56, fit: BoxFit.fill,)),
                ),
                SizedBox(height: 15,),

                InkWell(
                  onTap: ()  {
                    // Navigator.pushNamed(context, ScanQRCode.id);
                    // scanQR();

                    Navigator.pushNamed(context, QRScannerApp.id);
                    /*setState(() async {
                      final cameras = await getAvailableCameras();
                      final firstCamera = cameras.first;
                      Navigator.pushNamed(context, QRScannerApp.id);
                    });*/

                  },
                  child: Container(
                    /*width: 70,
                    height: 70,*/
                    decoration: BoxDecoration(color: Color.fromRGBO(
                        64, 78, 204, 1.0), borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('images/camera.png', width: 30, height: 30, fit: BoxFit.fill,),
                            SizedBox(height: 8,),
                            Text('Scan\nQR Code', style: TextStyle(color: Colors.white, fontSize: 16,), textAlign: TextAlign.center),
                      ]),
                    ),
                  ),
                ),

                SizedBox(height: 15,),

                Padding(
                  padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
                  child: Center(child: Image.asset('images/wrkplanlogo.png')),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
