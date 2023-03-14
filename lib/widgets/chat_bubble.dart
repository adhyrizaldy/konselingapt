import 'package:konselingapt/theme.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final bool inSider;
  final String text;
  final String time;

  ChatBubble({this.inSider = false, this.text = '', this.time = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment:
            inSider ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                inSider ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(inSider ? 8 : 0),
                        bottomRight: Radius.circular(inSider ? 0 : 8)),
                  ),
                  child: Text(
                    text,
                    style: textWhiteStyle.copyWith(fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 2),
          Text(
            time,
            style: textStyleBlack.copyWith(fontSize: 11),
          )
        ],
      ),
    );
  }
}
