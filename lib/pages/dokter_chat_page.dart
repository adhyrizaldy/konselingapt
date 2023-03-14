import 'package:konselingapt/theme.dart';
import 'package:konselingapt/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatDokter extends StatelessWidget {
  const ChatDokter({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSize header() {
      return PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            backgroundColor: primaryColor,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  'assets/panah_kiri.png',
                  width: 30,
                  height: 30,
                )),
            title: Row(
              children: [
                ClipOval(
                  child: Container(
                    color: textGreyColor,
                    child: Image.asset(
                      'assets/dokter.png',
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Ronald',
                      style: textWhiteStyle.copyWith(
                          fontWeight: medium, fontSize: 14),
                    ),
                    Text(
                      'Online',
                      style: textStyleOrange.copyWith(
                          fontWeight: light, fontSize: 14),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/camera.png',
                      width: 28.13,
                      height: 18.75,
                    ))
              ],
            ),
          ));
    }

    Widget chatInput() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 45,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                    color: containerInputColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: TextFormField(
                    decoration:
                        InputDecoration.collapsed(hintText: 'Ketik Pesan....'),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            Image.asset(
              'assets/icon_send.png',
              width: 40,
              height: 40,
            )
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          ChatBubble(
            inSider: true,
            text: 'Hi, Dok',
            time: '09:30',
          ),
          ChatBubble(
            inSider: true,
            text: 'Ini Thomas mau coba aplikasi chat',
            time: '09:30',
          ),
          ChatBubble(
            inSider: false,
            text: 'Hi juga Thomas',
            time: '09:31',
          )
        ],
      );
    }

    return Scaffold(
      appBar: header(),
      body: content(),
      bottomNavigationBar: chatInput(),
    );
  }
}
