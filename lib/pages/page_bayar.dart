import 'package:konselingapt/pages/chat_page.dart';
import 'package:konselingapt/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BayarPage extends StatelessWidget {
  const BayarPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            'Bayar Dengan OVO',
            style: textWhiteStyle.copyWith(fontSize: 19, fontWeight: semiBold),
          ),
        ),
      );
    }

    Widget transaksiPage() {
      return Container(
        height: 140,
        width: double.infinity,
        margin: EdgeInsets.only(top: 13, left: 15, right: 15),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: white,
            boxShadow: [
              BoxShadow(color: black.withOpacity(0.2), blurRadius: 1.5)
            ]),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/dokter.png',
                  width: 50,
                  height: 50,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Ronald Richard',
                      style: textStyleBlack.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Dokter Spesialis Kulit',
                      style: textStyleGrey.copyWith(
                          fontSize: 16, fontWeight: medium),
                    )
                  ],
                ),
              ],
            ),
            Divider(
              thickness: 2,
              color: Color(0xff6A707C),
            ),
            SizedBox(height: 10),
            Text(
              'Biaya Konsultasi',
              style: textStyleGrey.copyWith(fontSize: 13, fontWeight: medium),
            ),
            SizedBox(height: 5),
            Text(
              'Rp.45.000',
              style: textStyleOrange.copyWith(fontSize: 16, fontWeight: medium),
            )
          ],
        ),
      );
    }

    Widget inputTransaksiPage() {
      return Container(
        height: 140,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10, left: 15, right: 15),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: white,
            boxShadow: [
              BoxShadow(color: black.withOpacity(0.2), blurRadius: 1.5)
            ]),
        child: Column(
          children: [
            Text(
              'Masukkan nomor ponsel yang terdaftar pada akun OVO',
              style: textStyleBlack.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(height: 16),
            Container(
              height: 56,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: containerInputColor),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                ],
                style: textStyleBlack.copyWith(fontSize: 16),
                decoration: InputDecoration.collapsed(
                    hintText: 'No OVO',
                    hintStyle: textInputColorStyle.copyWith(fontSize: 16)),
              ),
            )
          ],
        ),
      );
    }

    Widget footer() {
      return Container(
        height: 56,
        width: double.infinity,
        margin: EdgeInsets.all(15),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, 'home');
          },
          style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 17, horizontal: 141),
              backgroundColor: orangen,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: Text(
            'Bayar',
            style: textWhiteStyle.copyWith(fontSize: 19, fontWeight: semiBold),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      appBar: header(),
      body: ListView(
        children: [
          transaksiPage(),
          inputTransaksiPage(),
        ],
      ),
      bottomNavigationBar: footer(),
    );
  }
}
