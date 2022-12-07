import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/provider/my_provider.dart';
import 'package:quran_app/styles/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.light,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: provider.mode == ThemeMode.light
                        ? MyThemeData.colorGold
                        : MyThemeData.yellowColor,
                  ),
                ),
                Icon(
                  Icons.done,
                  size: 30,
                  color: provider.mode == ThemeMode.light
                      ? MyThemeData.colorGold
                      : MyThemeData.yellowColor,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.dark,
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: provider.mode == ThemeMode.dark
                    ? MyThemeData.colorGold
                      : MyThemeData.yellowColor,
                    )),
                Icon(
                  Icons.done,
                  size: 30,
                  color: provider.mode == ThemeMode.dark
                      ? MyThemeData.colorGold
                      : MyThemeData.yellowColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
