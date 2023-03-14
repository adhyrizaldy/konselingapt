import 'package:konselingapt/theme.dart';
import 'package:flutter/material.dart';

class ChatSelesai extends StatelessWidget {
  const ChatSelesai({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'chatDokter');
      },
      child: Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.all(11),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: containerInputColor),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset(
              'assets/dokter.png',
              width: 80,
              height: 80,
            ),
            SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4),
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
                SizedBox(height: 10),
                Text(
                  '3 Februari 2023',
                  style:
                      textStyleGrey.copyWith(fontSize: 11, fontWeight: medium),
                )
              ],
            ),
            Spacer(),
            Text(
              'Aktif',
              style: textStylePrimaryColor.copyWith(
                  fontSize: 11, fontWeight: medium),
            )
          ],
        ),
      ),
    );
  }
}
