import 'package:konselingapt/theme.dart';
import 'package:flutter/material.dart';
import 'package:konselingapt/helper/helper_function.dart';
import 'package:konselingapt/pages/auth/sign_in_page.dart';
import 'package:konselingapt/pages/home_page.dart';
import 'package:konselingapt/service/auth_service.dart';
import 'package:konselingapt/widgets/widgets.dart';
import 'package:flutter/gestures.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String fullName = "";
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    Widget fullNameInput() {
      return Container(
        height: 56,
        width: double.infinity,
        margin: EdgeInsets.only(top: 159),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: containerInputColor),
        child: Center(
          child: TextFormField(
            style: textStyleBlack,
            decoration: InputDecoration.collapsed(
                hintText: 'Nama Lengkap',
                hintStyle: textInputColorStyle.copyWith(
                    fontSize: 15, fontWeight: medium)),
            onChanged: (val) {
              setState(() {
                fullName = val;
              });
            },
            validator: (val) {
              if (val!.isNotEmpty) {
                return null;
              } else {
                return "Name cannot be empty";
              }
            },
          ),
        ),
      );
    }

    //Username Off kan dulu
    // Widget usernameInput(){
    //   return Container(
    //     margin: EdgeInsets.only(top: 20),
    //     padding: EdgeInsets.symmetric(
    //       horizontal: 20
    //     ),
    //     height: 56,
    //     width: double.infinity,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(8),
    //       color: containerInputColor
    //     ),
    //     child: Center(
    //       child: TextFormField(
    //         style: textStyleBlack,
    //         decoration: InputDecoration.collapsed(
    //           hintText: 'Username',
    //           hintStyle: textInputColorStyle.copyWith(
    //             fontSize: 15,
    //             fontWeight: medium
    //           )
    //         ),
    //       ),
    //     ),
    //   );
    // }

    Widget noTelpInput() {
      return Container(
        height: 56,
        width: double.infinity,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: containerInputColor),
        child: Center(
          child: TextFormField(
            style: textStyleBlack,
            decoration: InputDecoration.collapsed(
                hintText: 'Nomor Telepon',
                hintStyle: textInputColorStyle.copyWith(
                    fontSize: 15, fontWeight: medium)),
          ),
        ),
      );
    }

    Widget emailInput() {
      return Container(
        height: 56,
        width: double.infinity,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: containerInputColor),
        child: Center(
          child: TextFormField(
            style: textStyleBlack,
            decoration: InputDecoration.collapsed(
                hintText: 'Email',
                hintStyle: textInputColorStyle.copyWith(
                    fontSize: 15, fontWeight: medium)),
            onChanged: (val) {
              setState(() {
                email = val;
              });
            },

            // check tha validation
            validator: (val) {
              return RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(val!)
                  ? null
                  : "Please enter a valid email";
            },
          ),
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        height: 56,
        width: double.infinity,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: containerInputColor),
        child: Center(
          child: TextFormField(
            style: textStyleBlack,
            obscureText: true,
            decoration: InputDecoration.collapsed(
                hintText: 'Password',
                hintStyle: textInputColorStyle.copyWith(
                    fontSize: 15, fontWeight: medium)),
            validator: (val) {
              if (val!.length < 6) {
                return "Password must be at least 6 characters";
              } else {
                return null;
              }
            },
            onChanged: (val) {
              setState(() {
                password = val;
              });
            },
          ),
        ),
      );
    }

    Widget buttonDaftar() {
      return Container(
        height: 56,
        width: double.infinity,
        margin: EdgeInsets.only(top: 55),
        child: TextButton(
          onPressed: () {
            register();
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Text('Daftar',
              style:
                  textWhiteStyle.copyWith(fontSize: 19, fontWeight: semiBold)),
        ),
      );
    }

    Widget backMasuk() {
      return Container(
        margin: EdgeInsets.only(top: 31),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sudah punya akun? ',
              style: textStyleGrey.copyWith(fontSize: 15, fontWeight: semiBold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'signin');
              },
              child: Text(
                'Masuk',
                style: textStylePrimaryColor.copyWith(
                    fontSize: 15, fontWeight: semiBold),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      resizeToAvoidBottomInset: false,
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor))
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      fullNameInput(),
                      noTelpInput(),
                      emailInput(),
                      passwordInput(),
                      buttonDaftar(),
                      backMasuk()
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .registerPatientWithEmailandPassword(fullName, email, password)
          .then((value) async {
        if (value == true) {
          // saving the shared preference state
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(fullName);
          nextScreenReplace(context, const SignInPage());
        } else {
          showSnackbar(context, Colors.red, value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
