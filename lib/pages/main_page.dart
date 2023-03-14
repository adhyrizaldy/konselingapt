import 'package:konselingapt/pages/chat_page.dart';
import 'package:konselingapt/pages/home_page.dart';
import 'package:konselingapt/pages/profile_page.dart';
import 'package:konselingapt/theme.dart';
import 'package:flutter/material.dart';

import 'package:konselingapt/pages/auth/sign_in_page.dart';
import 'package:konselingapt/helper/helper_function.dart';
import 'package:konselingapt/service/auth_service.dart';
import 'package:konselingapt/service/database_service.dart';
import 'package:konselingapt/widgets/widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  String userName = "";
  String email = "";
  AuthService authService = AuthService();
  // Stream? groups;
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

    body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return ChatPage();
          break;
        case 2:
          return ProfilePage(
            userName: userName,
            email: email,
          );
          break;
        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: bgColor1,
      bottomNavigationBar: bottomNav(),
      body: body(),
    );
  }
}
