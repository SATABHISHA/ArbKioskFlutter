

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeGenerater extends StatefulWidget {
  // const QRCodeGenerater({Key? key}) : super(key: key);
  static String id = 'QRCodeGenerator';

  @override
  State<QRCodeGenerater> createState() => _QRCodeGeneraterState();
}

class _QRCodeGeneraterState extends State<QRCodeGenerater> {
  String _address = '';
  double _latitude = 0.0;
  double _longitude = 0.0;
  Timer? _timer;


  String formattedDate = "";
  String formattedTime = "";
  late DateTime customTimeLater;
  String formattedCustomTimeLater = "", validFromDateAndTime = "", validUptoDateAndTime = "";
  String jsonString = '';

  /*DateTime now = DateTime.now();
  String formattedDate = "${now.day}-${now.month}-${now.year}";
  String formattedTime = "${now.hour}:${now.minute}:${now.second}";
  DateTime customTimeLater = now.add(Duration(minutes: 1, seconds: 0));
  String formattedCustomTimeLater = "${customTimeLater.hour}:${customTimeLater.minute}:${customTimeLater.second}";
  String jsonString = '{"date": "${formattedDate}", "startTime": "${formattedTime}", "endTime": "${formattedCustomTimeLater}", "latitude": ${_latitude}, "longitude": ${_longitude}, "address": "${_address}" }';*/



  Future<void> _getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _latitude = position.latitude;
        _longitude = position.longitude;
      });

      // Fetch address
      List<Placemark> placemarks = await placemarkFromCoordinates(
        _latitude,
        _longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        setState(() {
          _address = "${placemark.subThoroughfare} ${placemark.thoroughfare}, "
              "${placemark.locality}, ${placemark.administrativeArea}, "
              "${placemark.country}";
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {

    // _jsonString = '{"date": "${formattedDate}", "startTime": "${formattedTime}", "endTime": "${formattedCustomTimeLater}", "latitude": ${_latitude}, "longitude": ${_longitude}, "address": "${_address}" }';
    _timer = Timer.periodic(Duration(minutes: 0, seconds: 2), (timer) {
      // Generate new QR data (you may fetch this from a source)
      setState(() {
        _getLocation();
        DateTime now = DateTime.now();
        formattedDate = "${now.day}-${now.month}-${now.year}";
        formattedTime = "${now.hour}:${now.minute}:${now.second}";
        customTimeLater = now.add(Duration(minutes: 1, seconds: 0));
        formattedCustomTimeLater = "${customTimeLater.hour}:${customTimeLater.minute}:${customTimeLater.second}";

        formattedDate = "${now.day}-${now.month}-${now.year}";
        formattedTime = "${now.hour}:${now.minute}:${now.second}";
        customTimeLater = now.add(Duration(minutes: 1, seconds: 0));
        formattedCustomTimeLater = "${customTimeLater.hour}:${customTimeLater.minute}:${customTimeLater.second}";

        validFromDateAndTime = "${now.year}-${now.month}-${now.day} ${formattedTime}";
        validUptoDateAndTime = "${now.year}-${now.month}-${now.day} ${formattedCustomTimeLater}";

        // jsonString = '{"date": "${formattedDate}", "startTime": "${formattedTime}", "endTime": "${formattedCustomTimeLater}", "latitude": ${_latitude}, "longitude": ${_longitude}, "address": "${_address}" }';
        jsonString = '{"validFrom": "${validFromDateAndTime}", "validUpto": "${validUptoDateAndTime}", "latitude": ${_latitude}, "longitude": ${_longitude} }';
        // jsonString = '1';
        print('QrData: ${jsonString}');
      });
    });

  }
  @override
  void initState() {
    super.initState();
    _getLocation();
    _startTimer();
  }
  @override
  Widget build(BuildContext context) {



    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Color.fromRGBO(252, 253, 253, 1.0),

        appBar: AppBar(
          backgroundColor: Color.fromRGBO(85, 99, 224, 1.0),
          automaticallyImplyLeading: false,
          title: Text('Wrkplan Kiosk', style: TextStyle(color: Colors.white, fontSize: 24),),
        ),
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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              // color: Colors.lightGreenAccent,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /*QrImage(
                      data: jsonString,
                      version: QrVersions.auto,
                      size: 200.0,
                    ),*/

                    QrImageView(data: jsonString, version: QrVersions.auto, size: 200.0,),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
