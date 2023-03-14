import 'package:konselingapt/theme.dart';
import 'package:flutter/material.dart';

class DetailDokter extends StatelessWidget {
  const DetailDokter({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: primaryColor,
        ),
      );
    }

    Widget pictDokter() {
      return Container(
        height: 316,
        width: double.infinity,
        decoration: BoxDecoration(color: bgColor1, boxShadow: [
          BoxShadow(
              color: black.withOpacity(0.2),
              blurRadius: 2.0,
              offset: Offset(0.0, 1.0))
        ]),
        child: Column(
          children: [
            SizedBox(height: 13),
            Image.asset(
              'assets/dokter.png',
              width: 225,
              height: 225,
            ),
            SizedBox(height: 19),
            Text(
              'Dr. Ronald Richard',
              style:
                  textStyleBlack.copyWith(fontSize: 19, fontWeight: semiBold),
            ),
            SizedBox(height: 5),
            Text(
              'Dokter Spesialis Kulit',
              style: textStyleGrey.copyWith(fontSize: 16, fontWeight: semiBold),
            )
          ],
        ),
      );
    }

    Widget statusDokter() {
      return GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.only(top: 25, left: 15, right: 15),
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 1.5,
                          offset: Offset(0, 0))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Riwayat Pendidikan',
                      style: textStyleBlack.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Universitas Hasanuddin',
                      style: textStyleBlack.copyWith(fontSize: 15),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '2019',
                      style: textStyleBlack.copyWith(fontSize: 15),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 100,
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 1.5,
                          offset: Offset(0, 0))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tempat Praktik',
                      style: textStyleBlack.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Praktek Mandiri Dr. Ronald Richard, Makassar',
                      style: textStyleBlack.copyWith(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        height: 70,
        padding: EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
                color: textGreyColor, blurRadius: 2.0, offset: Offset(0.0, 1.0))
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Biaya Konsultasi',
                    style: textStyleBlack.copyWith(
                      fontSize: 11,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Rp 45.000',
                    style: textStyleOrange.copyWith(
                        fontSize: 19, fontWeight: semiBold),
                  )
                ],
              ),
            ),
            Container(
              height: 44,
              width: 150,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'metodeBayar');
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  backgroundColor: orangen,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(
                  'Chat Sekarang',
                  style: textWhiteStyle.copyWith(
                      fontSize: 15, fontWeight: semiBold),
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      appBar: header(),
      body: ListView(
        children: [
          pictDokter(),
          statusDokter(),
        ],
      ),
      bottomNavigationBar: footer(),
    );
  }
}
