import 'package:konselingapt/theme.dart';
import 'package:flutter/material.dart';

class MetodeBayar extends StatelessWidget {
  const MetodeBayar({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            'Pilih Metode Pembayaran',
            style: textWhiteStyle.copyWith(fontSize: 19, fontWeight: semiBold),
          ),
        ),
      );
    }

    Widget contentDokter() {
      return Container(
        height: 74,
        width: double.infinity,
        margin: EdgeInsets.only(top: 15, left: 15, right: 15),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: white,
            boxShadow: [
              BoxShadow(
                  color: black.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 1.5,
                  offset: Offset(0, 0))
            ]),
        child: Row(
          children: [
            Image.asset(
              'assets/dokter.png',
              width: 50,
              height: 50,
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr. Ronald Richard',
                  style: textStyleBlack.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Dokter Spesialis Kulit',
                  style:
                      textStyleGrey.copyWith(fontSize: 16, fontWeight: medium),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget detailBayar() {
      return Container(
        height: 100,
        width: double.infinity,
        margin: EdgeInsets.only(top: 13, left: 15, right: 15),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: white,
            boxShadow: [
              BoxShadow(
                color: black.withOpacity(0.2),
                blurRadius: 1.5,
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detail Pembayaran',
              style: textStyleBlack.copyWith(fontSize: 15),
            ),
            SizedBox(height: 7),
            Row(
              children: [
                Text(
                  'Biaya Konsultasi',
                  style: textStyleGrey.copyWith(fontSize: 13),
                ),
                Spacer(),
                Text(
                  'Rp 45.000',
                  style: textStyleOrange.copyWith(fontSize: 13),
                )
              ],
            ),
            Divider(
              thickness: 2,
              color: Color(0xff6A707C),
            ),
            Row(
              children: [
                Text(
                  'Total Bayar',
                  style:
                      textStyleBlack.copyWith(fontSize: 16, fontWeight: medium),
                ),
                Spacer(),
                Text(
                  'Rp.45.000',
                  style: textStyleOrange.copyWith(
                      fontSize: 16, fontWeight: medium),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget titleWallet() {
      return Container(
        margin: EdgeInsets.only(top: 15, left: 15, bottom: 13),
        child: Text(
          'E-Wallet',
          style: textStyleBlack.copyWith(fontSize: 16, fontWeight: medium),
        ),
      );
    }

    Widget contentBayar() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'bayarPage');
        },
        child: Container(
          height: 60,
          margin: EdgeInsets.symmetric(horizontal: 15),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: white,
              boxShadow: [
                BoxShadow(color: black.withOpacity(0.2), blurRadius: 1.5)
              ]),
          child: Row(
            children: [
              Image.asset(
                'assets/wallet.png',
                width: 50,
                height: 50,
              ),
              SizedBox(width: 15),
              Text(
                'OVO',
                style:
                    textStyleBlack.copyWith(fontSize: 19, fontWeight: semiBold),
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'bayarPage');
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: primaryColor,
                  ))
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      appBar: header(),
      body: ListView(
        children: [
          contentDokter(),
          detailBayar(),
          titleWallet(),
          contentBayar()
        ],
      ),
    );
  }
}
