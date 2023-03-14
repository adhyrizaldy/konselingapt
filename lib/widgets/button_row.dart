import 'package:konselingapt/theme.dart';
import 'package:flutter/material.dart';

const Color containers = Color(0xffECF2FF);
const Color containerP = Color(0xff585CE5);

class ButtonRow extends StatefulWidget {
  final String text;
  final int value;
  final int groupValue;
  final Color container;
  final Color selectColor;
  void Function(int?)? onChanged;
  ButtonRow(
      {Key? key,
      required this.text,
      required this.value,
      required this.groupValue,
      this.container = containers,
      this.selectColor = containerP,
      this.onChanged})
      : super(key: key);

  @override
  State<ButtonRow> createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          bool selected = widget.value != widget.groupValue;
          if (selected) {
            widget.onChanged!(widget.value);
          }
        },
        style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 19, horizontal: 48),
            backgroundColor: widget.value == widget.groupValue
                ? widget.selectColor
                : widget.container,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: Text(
          widget.text,
          style: widget.value == widget.groupValue
              ? textWhiteStyle.copyWith(fontSize: 16, fontWeight: semiBold)
              : textStyleBlack.copyWith(fontSize: 16, fontWeight: semiBold),
        ));
  }
}
