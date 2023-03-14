import 'package:konselingapt/theme.dart';
import 'package:konselingapt/widgets/pilihDokter.dart';
import 'package:konselingapt/pages/detail_dokter.dart';
import 'package:konselingapt/pages/dokter_chat_page.dart';
import 'package:konselingapt/pages/main_page.dart';
import 'package:konselingapt/pages/metode_bayar.dart';
import 'package:konselingapt/pages/page_bayar.dart';
import 'package:konselingapt/pages/auth/sign_in_page.dart';
import 'package:konselingapt/helper/helper_function.dart';
import 'package:konselingapt/pages/profile_edit_page.dart';
import 'package:konselingapt/pages/profile_saya_page.dart';
import 'package:konselingapt/pages/profile_page.dart';
import 'package:konselingapt/service/auth_service.dart';
import 'package:konselingapt/service/database_service.dart';
import 'package:konselingapt/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  String userName = "";
  String email = "";
  AuthService authService = AuthService();
  Stream? groups;
  bool _isLoading = false;
  String groupName = "";

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
    await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
        .getUserGroups()
        .then((snapshot) {
      setState(() {
        groups = snapshot;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget bottomNav() {
      return BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 9,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          backgroundColor: containerInputColor,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              print(value);
              currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.fromLTRB(0, 18, 0, 0),
                  child: Image.asset('assets/icon_home.png',
                      width: 35,
                      color:
                          currentIndex == 0 ? primaryColor : Color(0xff808191)),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.fromLTRB(0, 18, 0, 0),
                  child: Image.asset('assets/icon_pesan.png',
                      width: 40,
                      color:
                          currentIndex == 1 ? primaryColor : Color(0xff808191)),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.fromLTRB(0, 18, 0, 0),
                  child: Image.asset('assets/icon_profile.png',
                      width: 30,
                      color:
                          currentIndex == 2 ? primaryColor : Color(0xff808191)),
                ),
                label: ''),
          ],
        ),
      );
    }

    Widget cariDokter() {
      return Container(
        height: 56,
        margin: EdgeInsets.only(top: 25),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
            color: containerInputColor, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                style: textStyleBlack,
                decoration: InputDecoration.collapsed(
                    hintText: 'Cari nama dokter atau spesialis',
                    hintStyle: textInputColorStyle.copyWith(
                        fontSize: 15, fontWeight: medium)),
              ),
            ),
            // Spacer(),
            Image.asset(
              'assets/icon_search.png',
              width: 25,
            ),
          ],
        ),
      );
    }

    Widget recomedTitle() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Text(
          'Rekomendasi Dokter',
          style: textStyleBlack.copyWith(fontSize: 19, fontWeight: semiBold),
        ),
      );
    }

    Widget recomendDokter() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: bgColor1,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            children: [
              PilihDokter(
                userName: userName,
                email: email,
              ),
              PilihDokter(
                userName: userName,
                email: email,
              ),
              PilihDokter(
                userName: userName,
                email: email,
              ),
            ],
          ),
        ),
      );
    }

    // return SafeArea(
    //   child: Container(
    //     margin: EdgeInsets.symmetric(
    //       horizontal: 15
    //     ),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         cariDokter(),
    //         recomedTitle(),
    //         recomendDokter()
    //       ],
    //     ),
    //   ),
    // );

    return Scaffold(
      backgroundColor: bgColor1,
      // bottomNavigationBar: bottomNav(),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cariDokter(),
              recomedTitle(),
              // if
              recomendDokter(),
            ],
          ),
        ),
      ),
    );
  }
}
