import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/styles/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../provider/my_provider.dart';


class SebhaScreen extends StatefulWidget {
  const SebhaScreen({Key? key}) : super(key: key);

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;
  int index = 0;
  String? selectedValue;
  List<String> azkar = [
    "سبحان الله",
    "الحمدلله",
    "لا اله الا الله",
    "الله اكبر",
    "لا حول ولا قوه الا بالله",
    "استغفر الله",
    "اللهم صل وسلم علي سيدنا محمد",
  ];


  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Image.asset("assets/images/tsbeh.png"),
          SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)!.tasbeh,
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: MyThemeData.colorGold,
              border: Border.all(color: MyThemeData.colorGold, width: 20),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: TextButton(
              onPressed: incrementCounter,
              child: Text(
                counter.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
         /* Container(
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: MyThemeData.colorGold,
              border: Border.all(color: MyThemeData.colorGold, width: 20),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: TextButton(
              onPressed: incrementCounter,
              child: Text(
                azkar[index],
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ), */
          DropdownButtonHideUnderline(
              child: DropdownButton2(
                items: azkar.map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: pro.mode == ThemeMode.light? Colors.black : Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                )).toList(),
                value: selectedValue,
                onChanged: (value){
                  setState(() {
                    selectedValue = value as String;
                  });
                },
              ),
          ),
        ],
      ),
    );
  }

  void incrementCounter() {
    setState(() {
      if (counter == 34 && index == 0) {
        index = 1;
        counter = 0;
      } else if (counter == 33 && index == 1) {
        index = 2;
        counter = 0;
      } else if (counter == 33 && index == 2) {
        index = 3;
        counter = 0;
      } else if (counter == 33 && index == 3) {
        index = 4;
        counter = 0;
      } else if (counter == 33 && index == 4) {
        index = 5;
        counter = 0;
      } else if (counter == 33 && index == 5) {
        index = 6;
        counter = 0;
      } else if (counter == 33 && index == 6) {
        index = 1;
        counter = 0;
      }
      counter++;
    });
  }
}
