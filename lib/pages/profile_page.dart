import 'package:konselingapt/theme.dart';
import 'package:flutter/material.dart';
import 'package:konselingapt/theme.dart';
import 'package:konselingapt/helper/helper_function.dart';
import 'package:konselingapt/service/auth_service.dart';
import 'package:konselingapt/service/database_service.dart';
import 'package:konselingapt/widgets/widgets.dart';
import 'package:konselingapt/pages/auth/sign_in_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:firebase_core/firebase_core.dart';

class ProfilePage extends StatefulWidget {
  String userName;
  String email;
  ProfilePage({Key? key, required this.email, required this.userName})
      : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = "";
  String email = "";
  AuthService authService = AuthService();
  bool _isLoading = false;
  // String groupName = "";

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
    // getting the list of snapshots in our stream
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        padding: EdgeInsets.all(20),
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(color: white, boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 1.0,
            spreadRadius: 1.0,
            offset: Offset(0.0, 1.0),
          ),
        ]),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/dokter.png',
                width: 80,
              ),
            ),
            SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Thomas Patrey',
                  style: textStyleBlack.copyWith(
                      fontSize: 19, fontWeight: semiBold),
                ),
                SizedBox(height: 5),
                Text(
                  '085-993-223-443',
                  style: textStyleGrey.copyWith(fontSize: 16),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget profileSaya() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'profileSaya');
        },
        child: Container(
          height: 60,
          margin: EdgeInsets.only(top: 20, left: 15, right: 15),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: white,
              boxShadow: [BoxShadow(blurRadius: 0.5, color: black)]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Profil Saya',
                style:
                    textStyleBlack.copyWith(fontSize: 15, fontWeight: medium),
              ),
              Image.asset(
                'assets/icon_panah.png',
                width: 50,
              )
            ],
          ),
        ),
      );
    }

    Widget ubahSandi() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'editSandi');
        },
        child: Container(
          height: 60,
          margin: EdgeInsets.only(top: 20, left: 15, right: 15),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: white,
              boxShadow: [BoxShadow(blurRadius: 0.5, color: black)]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ubah Kata Sandi',
                style:
                    textStyleBlack.copyWith(fontSize: 15, fontWeight: medium),
              ),
              Image.asset(
                'assets/icon_panah.png',
                width: 50,
              )
            ],
          ),
        ),
      );
    }

    Widget keluar() {
      return GestureDetector(
        onTap: () async {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Logout"),
                  content: const Text("Are you sure you want to logout?"),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await authService.signOut();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const SignInPage()),
                            (route) => false);
                      },
                      icon: const Icon(
                        Icons.done,
                        color: Colors.green,
                      ),
                    ),
                  ],
                );
              });
        },
        child: Container(
          height: 60,
          margin: EdgeInsets.only(top: 20, left: 15, right: 15),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: white,
              boxShadow: [BoxShadow(blurRadius: 0.5, color: black)]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Keluar',
                style:
                    textStyleBlack.copyWith(fontSize: 15, fontWeight: medium),
              ),
              Image.asset(
                'assets/keluar.png',
                width: 50,
              )
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: Column(
        children: [header(), profileSaya(), ubahSandi(), keluar()],
      ),
    );
  }
}
