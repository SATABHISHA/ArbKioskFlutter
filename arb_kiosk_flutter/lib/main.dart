

import 'package:arb_kiosk_flutter/home/qr_generate.dart';
import 'package:arb_kiosk_flutter/home/qr_scanner.dart';
import 'package:arb_kiosk_flutter/home/user_home.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'attendance/user_check_in_out.dart';
import 'home/camera_helper.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await getAvailableCameras();
  final firstCamera = cameras.first;
  runApp(MyApp(camera: firstCamera,));
}

class MyApp extends StatelessWidget {
  final camera;

  const MyApp({super.key, required this.camera});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    _requestLocationPermission();
    return MaterialApp(
      title: 'WrkPlan Payroll',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: UserHome(),
      initialRoute: UserHome.id,
      routes: {
        UserHome.id : (context) => UserHome(),
        UserCheckInOut.id : (context) => UserCheckInOut(),
        QRScannerApp.id : (context) => QRScannerApp(camera: camera),
        QRCodeGenerater.id : (context) => QRCodeGenerater(),

      },
    );
  }
}
Future<void> _requestLocationPermission() async {
  PermissionStatus status = await Permission.location.request();
  if(status == PermissionStatus.granted){

  }else{

  }
}


