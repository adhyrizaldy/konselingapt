// import 'package:konselingapt/pages/detail_dokter.dart';
// import 'package:konselingapt/pages/dokter_chat_page.dart';
// import 'package:konselingapt/pages/metode_bayar.dart';
// import 'package:konselingapt/pages/page_bayar.dart';
// import 'package:konselingapt/pages/profile_edit_page.dart';
// import 'package:konselingapt/pages/profile_saya_page.dart';
import 'package:konselingapt/pages/auth/sign_in_page.dart';
import 'package:konselingapt/pages/auth/sign_up_page.dart';
import 'package:konselingapt/pages/auth/sign_in_apt.dart';
import 'package:konselingapt/pages/auth/sign_up_apt.dart';
// import 'package:konselingapt/pages/ubah_sandi_page.dart';
import 'package:konselingapt/helper/helper_function.dart';
import 'package:konselingapt/pages/main_page.dart';
import 'package:konselingapt/shared/constants.dart';
import 'package:konselingapt/pages/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //     options: FirebaseOptions(
  //         apiKey: Constants.apiKey,
  //         appId: "1:31731289730:web:f822954e39ad8575caae9b",
  //         messagingSenderId: "31731289730",
  //         projectId: "desaapp-v11"));
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constants.apiKey,
            appId: Constants.appId,
            messagingSenderId: Constants.messagingSenderId,
            projectId: Constants.projectId));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool _isSignedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'signin': (context) => const SignInPage(),
        'signup': (context) => const SignUpPage(),
        'signinapt': (context) => const SignInApt(),
        'signupapt': (context) => const SignUpAptPage(),
        // 'detailDokter':(context) => const DetailDokter(),
        // 'metodeBayar':(context) => const MetodeBayar(),
        // 'bayarPage':(context) => const BayarPage(),
        // 'chatDokter':(context) => const ChatDokter(),
        // 'profileSaya':(context) => const ProfileSaya(),
        // 'profilEdit':(context) => const ProfileEdit(),
        // 'editSandi':(context) => const EditSandi(),
      },
      home: _isSignedIn ? const MainPage() : const SignInPage(),
    );
  }
}
