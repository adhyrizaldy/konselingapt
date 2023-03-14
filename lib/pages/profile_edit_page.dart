import 'package:konselingapt/theme.dart';
import 'package:konselingapt/widgets/button_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/material/date_picker.dart';
import 'package:intl/intl.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  TextEditingController _date = TextEditingController();
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            'Ubah Data Pribadi',
            style: textWhiteStyle.copyWith(fontSize: 19, fontWeight: semiBold),
          ),
        ),
      );
    }

    Widget content() {
      return ListView(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            color: white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 56,
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: containerInputColor),
                  child: Center(
                    child: TextFormField(
                      style: textStyleBlack.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                      decoration: InputDecoration.collapsed(
                          hintText: 'Nama Lengkap',
                          hintStyle: textInputColorStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold)),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 56,
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: containerInputColor),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _date,
                          onTap: () async {
                            DateTime? pickeddate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2100));

                            if (pickeddate != null) {
                              setState(() {
                                _date.text =
                                    DateFormat('dd/MM/yyyy').format(pickeddate);
                              });
                            }
                          },
                          style: textStyleBlack.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                          decoration: InputDecoration.collapsed(
                              hintText: 'Date',
                              hintStyle: textInputColorStyle.copyWith(
                                  fontSize: 16, fontWeight: semiBold)),
                        ),
                      ),
                      Spacer(),
                      Image.asset('assets/calendar.png')
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Jenis Kelamin',
                  style: textStyleBlack.copyWith(fontSize: 16),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonRow(
                      text: 'Laki - Laki',
                      value: 1,
                      groupValue: _value,
                      onChanged: (int? value) {
                        setState(() {
                          _value = value!;
                        });
                      },
                    ),
                    SizedBox(width: 10),
                    ButtonRow(
                      text: 'Perempuan',
                      value: 2,
                      groupValue: _value,
                      onChanged: (int? value) {
                        setState(() {
                          _value = value!;
                        });
                      },
                    )
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  height: 56,
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: containerInputColor),
                  child: Center(
                    child: TextFormField(
                      style: textStyleBlack.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                      decoration: InputDecoration.collapsed(
                          hintText: 'Kota',
                          hintStyle: textInputColorStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold)),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 56,
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: containerInputColor),
                  child: Center(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                      ],
                      style: textStyleBlack.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                      decoration: InputDecoration.collapsed(
                          hintText: 'No. HP',
                          hintStyle: textInputColorStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(vertical: 19, horizontal: 155),
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text(
                      'Simpan',
                      style: textWhiteStyle.copyWith(
                          fontSize: 15, fontWeight: semiBold),
                    ))
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      appBar: header(),
      body: content(),
    );
  }
}
