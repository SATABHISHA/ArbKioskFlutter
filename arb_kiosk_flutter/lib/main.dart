import 'package:arb_kiosk_flutter/home/qr_code_scanner.dart';
import 'package:arb_kiosk_flutter/home/user_home.dart';
import 'package:flutter/material.dart';

import 'attendance/user_check_in_out.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
        ScanQRCode.id : (context) => ScanQRCode(),
      },
    );
  }
}


