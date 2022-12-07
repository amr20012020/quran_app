import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/provider/my_provider.dart';
import 'package:quran_app/styles/langauge_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quran_app/styles/my_theme.dart';
import 'package:quran_app/styles/theme_bottom_sheet.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:
        [
          Text(AppLocalizations.of(context)!.language, style: Theme.of(context).textTheme.subtitle1!.copyWith(color: MyThemeData.colorGold),),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: (){
              showLanguageBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: MyThemeData.colorGold),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(pro.languageCode == 'en'? AppLocalizations.of(context)!.english:AppLocalizations.of(context)!.arabic,style: Theme.of(context).textTheme.subtitle1,),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(AppLocalizations.of(context)!.theme, style: Theme.of(context).textTheme.subtitle1!.copyWith(color: MyThemeData.colorGold),),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: (){
              showThemeBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: MyThemeData.colorGold),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(pro.mode == ThemeMode.light? AppLocalizations.of(context)!.light:AppLocalizations.of(context)!.dark,style: Theme.of(context).textTheme.subtitle1,),
            ),
          ),

        ],
      ),
    );
  }

  void showLanguageBottomSheet(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (context){
          return LanguageBottomSheet();
        });
  }

  void showThemeBottomSheet(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (context){
          return ThemeBottomSheet();
        });
  }
}
