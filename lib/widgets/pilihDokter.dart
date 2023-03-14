import 'package:konselingapt/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:konselingapt/service/database_service.dart';
import 'package:konselingapt/helper/helper_function.dart';
import 'package:konselingapt/pages/auth/sign_in_page.dart';
import 'package:konselingapt/service/auth_service.dart';

class PilihDokter extends StatefulWidget {
  String userName;
  String email;
  PilihDokter({Key? key, required this.email, required this.userName})
      : super(key: key);

  @override
  State<PilihDokter> createState() => _PilihDokterState();
}

class _PilihDokterState extends State<PilihDokter> {
  String userName = "";
  String email = "";
  AuthService authService = AuthService();
  // Stream? groups;
  // bool _isLoading = false;
  String Id = "";

  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  // string manipulation
  String getId(String res) {
    return res.substring(0, res.indexOf("_"));
  }

  String getName(String res) {
    return res.substring(res.indexOf("_") + 1);
  }

  gettingUserData() async {
    await HelperFunctions.getUserEmailFromSF().then((value) {
      setState(() {
        email = value!;
      });
    });
    await HelperFunctions.getUserNameFromSF().then((val) {
      setState(() {
        userName = val!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'detailDokter');
      },
      child: Container(
        margin: EdgeInsets.only(top: 17),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 1.5,
              offset: Offset(0, 0))
        ], borderRadius: BorderRadius.circular(8), color: white),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/dokter.png',
                width: 81,
                height: 80,
              ),
            ),
            SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Dr. Ronald Richard',
                  style: textStyleBlack.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                SizedBox(height: 10),
                Text(
                  'Spesialis Kulit',
                  style:
                      textStyleBlack.copyWith(fontSize: 11, fontWeight: medium),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Rp 45.000',
                      style: textStyleOrange.copyWith(
                          fontSize: 13, fontWeight: medium),
                    ),
                    Container(
                      width: 49.2,
                      height: 42.5,
                    ),
                    Container(
                      height: 37,
                      child: TextButton(
                        onPressed: () async {
                          DatabaseService(
                                      uid: FirebaseAuth
                                          .instance.currentUser!.uid)
                                  .createConsult(userName, Id,
                                      FirebaseAuth.instance.currentUser!.uid)
                              //     .whenComplete(() {
                              //   _isLoading = false;
                              // })
                              ;
                          Navigator.pushNamed(context, 'semuaChat');
                          // showSnackbar(context, Colors.green,
                          //     "Group created successfully.");
                        },
                        // Navigator.pushNamed(context, 'detailDokter');

                        style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 14),
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        child: Text(
                          'Mulai Chat',
                          style: textWhiteStyle.copyWith(
                              fontSize: 15, fontWeight: medium),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
