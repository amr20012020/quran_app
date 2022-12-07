import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/styles/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../provider/my_provider.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({Key? key}) : super(key: key);

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 40),
      child: Column(
        children:
        [
          Image.asset("assets/images/radio1.png"),
          SizedBox(
            height: 50,
          ),
          Text(
            AppLocalizations.of(context)!.quran_broadcast,
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              Icon(
               provider.languageCode == 'en'? Icons.skip_previous : Icons.skip_next_rounded,
                size: 40,
                color: MyThemeData.colorGold,
              ),
              SizedBox(
                width: 50,
              ),
              Icon(
                  Icons.play_arrow,
                  size: 40,
                color: MyThemeData.colorGold,
              ),
              SizedBox(
                width: 50,
              ),
              Icon(
                 provider.languageCode == 'en'? Icons.skip_next_rounded : Icons.skip_previous,
                  size: 40,
                color: MyThemeData.colorGold,
              ),

            ],
          ),


        ],
      ),

    );
  }
}
