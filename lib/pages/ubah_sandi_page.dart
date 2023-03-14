import 'package:konselingapt/theme.dart';
import 'package:flutter/material.dart';

class EditSandi extends StatelessWidget {
  const EditSandi({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
            backgroundColor: primaryColor,
            title: Text(
              'Ubah Kata Sandi',
              style:
                  textWhiteStyle.copyWith(fontSize: 19, fontWeight: semiBold),
            )),
      );
    }

    Widget content() {
      return Column(
        children: [
          Container(
            height: 56,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: containerInputColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [BoxShadow(blurRadius: 1.5, color: textGreyColor)]),
            child: TextFormField(
              style: textStyleBlack.copyWith(fontSize: 15, fontWeight: medium),
              obscureText: true,
              decoration: InputDecoration.collapsed(
                  hintText: 'Kata Sandi Lama',
                  hintStyle:
                      textStyleGrey.copyWith(fontSize: 15, fontWeight: medium)),
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 56,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: containerInputColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [BoxShadow(blurRadius: 1.5, color: textGreyColor)]),
            child: TextFormField(
              style: textStyleBlack.copyWith(fontSize: 15, fontWeight: medium),
              obscureText: true,
              decoration: InputDecoration.collapsed(
                  hintText: 'Kata Sandi Baru',
                  hintStyle:
                      textStyleGrey.copyWith(fontSize: 15, fontWeight: medium)),
            ),
          ),
          SizedBox(height: 30),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 19, horizontal: 163),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: Text(
                'Ubah',
                style:
                    textWhiteStyle.copyWith(fontSize: 15, fontWeight: medium),
              ))
        ],
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      appBar: header(),
      body: Container(
        padding: EdgeInsets.all(15),
        child: content(),
      ),
    );
  }
}
