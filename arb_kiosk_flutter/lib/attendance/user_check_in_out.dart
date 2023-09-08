

import 'package:arb_kiosk_flutter/home/qr_scanner.dart';
import 'package:flutter/material.dart';

class UserCheckInOut extends StatefulWidget {
  // const UserCheckInOut({Key? key}) : super(key: key);
  static String id = 'UserCheckInOut';
  @override
  State<UserCheckInOut> createState() => _UserCheckInOutState();
}

class _UserCheckInOutState extends State<UserCheckInOut> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Scanned Data=> ${QRScannerApp.ScannedQRCodeData}');
    print("Scanned Data=> ${QRScannerApp.ScannedQRCodeData['EmployeeCode']}");

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
              child: Padding(
                padding: EdgeInsets.fromLTRB(35, 20, 20, 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Color.fromRGBO(87, 87, 87, 1.0),
                          child: Center(child: Image.asset('images/usericon.png', width: 30, height: 36, fit: BoxFit.fill,)),
                        ),
                        SizedBox(height: 15,),
                        Text('Alex', style: TextStyle(fontSize: 21, color: Color.fromRGBO(
                            87, 87, 87, 1.0)),),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: Color.fromRGBO(117, 178, 83, 1.0),
                          child: Center(child: Image.asset('images/tick.png', width: 60, height: 50, fit: BoxFit.fill,)),
                        ),

                        SizedBox(height: 15,),
                        Text('You are Checked In', style: TextStyle(fontSize: 29, color: Color.fromRGBO(
                            87, 87, 87, 1.0), fontWeight: FontWeight.w600),),
                        SizedBox(height: 5,),
                        Text('06-Sep-2023', style: TextStyle(fontSize: 21, color: Color.fromRGBO(
                            87, 87, 87, 1.0)),),
                        SizedBox(height: 5,),
                        Text('10:00 AM', style: TextStyle(fontSize: 21, color: Color.fromRGBO(
                            87, 87, 87, 1.0)),),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
                      child: Center(child: Image.asset('images/wrkplanlogo.png')),
                    ),

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
