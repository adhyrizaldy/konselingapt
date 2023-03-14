import 'package:konselingapt/theme.dart';
import 'package:konselingapt/widgets/tab_chat_all.dart';
import 'package:konselingapt/widgets/tab_chat_finish.dart';
import 'package:konselingapt/widgets/tab_chat_on.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget tabSemua() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            SemuaChat(),
            SemuaChat(),
            SemuaChat(),
            SemuaChat(),
            SemuaChat(),
            SemuaChat(),
            SemuaChat(),
            SemuaChat(),
            SemuaChat(),
          ],
        ),
      );
    }

    Widget tabAktif() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            AktifChat(),
            AktifChat(),
            AktifChat(),
          ],
        ),
      );
    }

    Widget tabSelesai() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            ChatSelesai(),
            ChatSelesai(),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: white,
          bottom: TabBar(
            controller: controller,
            indicatorColor: primaryColor,
            labelColor: primaryColor,
            unselectedLabelColor: black,
            indicator: BoxDecoration(
                color: tabColor,
                border:
                    Border(bottom: BorderSide(color: primaryColor, width: 3))),
            labelStyle: textStylePrimaryColor.copyWith(
                fontSize: 16, fontWeight: semiBold),
            tabs: <Widget>[
              new Tab(
                text: 'Semua',
              ),
              new Tab(
                text: 'Aktif',
              ),
              new Tab(
                text: 'Selesai',
              ),
            ],
          ),
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[tabSemua(), tabAktif(), tabSelesai()],
      ),
    );
  }
}
