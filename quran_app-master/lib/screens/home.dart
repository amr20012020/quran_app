import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/screens/ahadithScreen.dart';
import 'package:quran_app/screens/quran/quranScreen.dart';
import 'package:quran_app/screens/radioScreen.dart';
import 'package:quran_app/screens/sebhaScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quran_app/screens/settings/settings.dart';
import 'package:quran_app/styles/my_theme.dart';

import '../provider/my_provider.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);

  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Image.asset(
           provider.mode == ThemeMode.light?
           'assets/images/main_background.png'
           : "assets/images/bg@3x.png",
          fit: BoxFit.fitWidth, width: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.appTitle,
              style: Theme.of(context).textTheme.headline1,),
          ),
          bottomNavigationBar: BottomNavigationBar(
            //selectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index){
              currentIndex = index;
              print(index);
              setState(() {

              });
            },
            items: [
              BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.radio,
                  backgroundColor: MyThemeData.colorGold,
                  icon: ImageIcon(AssetImage('assets/images/radio.png'),
              )),
              BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.rosary,
                  icon: ImageIcon(AssetImage('assets/images/sebha.png'),
                  )),
              BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.alahadyth,
                  icon: ImageIcon(AssetImage('assets/images/ahadeth.png'),
                  )),
              BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.quran,
                  icon: ImageIcon(AssetImage('assets/images/quran.png'),
                  )),
              BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.settings,
                  icon: Icon(Icons.settings)),
            ],
          ),
          body: screens[currentIndex],
        ),
      ],
    );
  }
  List<Widget> screens =[
    RadioScreen(),
    SebhaScreen(),
    AhadithScreen(),
    QuranScreen(),
    SettingsScreen(),
  ];
}

