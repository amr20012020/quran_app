import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/screens/quran/aya.dart';

import '../../provider/my_provider.dart';
import '../../styles/my_theme.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "sura_Details";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    SuraDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    var provider = Provider.of<MyProvider>(context);
    if(ayat.isEmpty){
      loadFile(args.index);
    }
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
              args.suraName,
              style: Theme.of(context).textTheme.headline1,
            ),
            actions:
            [
              Icon(
                Icons.play_circle_fill,
                size: 25,
              ),

            ],
          ),
          body: ayat.length == 0
              ? Center(child: CircularProgressIndicator())
              : Container(
                 decoration: BoxDecoration(
                   color: Colors.white,
                   border: Border.all(color: MyThemeData.colorGold, width: 2),
                   borderRadius: BorderRadius.only(
                     topRight: Radius.circular(25),
                     bottomLeft: Radius.circular(25),
                   ),
                 ),
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: ListView.separated(
                   separatorBuilder: (context,index){
                     return Divider(
                       color: MyThemeData.colorGold,
                     );
                   },
                    itemCount: ayat.length,
                    itemBuilder: (context, index) {
                      return AyaItem(ayat[index],index + 1);
                    }),
              ),
        ),
      ],
    );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    print(lines);
    ayat = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String suraName;
  int index;
  SuraDetailsArgs(this.suraName, this.index);
}
