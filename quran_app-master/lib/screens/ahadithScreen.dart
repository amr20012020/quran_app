import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/screens/ahadith_details/hadeth_details.dart';
import 'package:quran_app/styles/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AhadithScreen extends StatefulWidget {
  const AhadithScreen({Key? key}) : super(key: key);

  @override
  State<AhadithScreen> createState() => _AhadithScreenState();
}

class _AhadithScreenState extends State<AhadithScreen> {
  List<HadethData> Ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (Ahadeth.isEmpty) HadethFile();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/hadith.png'),
        Divider(
          color: MyThemeData.colorGold,
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.ahadeth,
          style: Theme
              .of(context)
              .textTheme
              .subtitle1,
          textAlign: TextAlign.center,
        ),
        Divider(
          color: MyThemeData.colorGold,
          thickness: 3,
        ),
        Ahadeth.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Expanded(
          child: ListView.separated(
              separatorBuilder: (context, index) =>
                  Divider(
                    color: MyThemeData.colorGold,
                  ),
              itemCount: Ahadeth.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context,
                          HadethDetails.routeName,
                          arguments: Ahadeth[index]);
                    },
                    child: Text(
                      Ahadeth[index].title,
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle1,
                      textAlign: TextAlign.center,
                    ));
              }),
        )
      ],
    );
  }

  /* void loadHadethFile() async {
    String content = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> AllAhadeth = content.trim().split('#\r\n');
    // for loop
    for (int i = 0; i < AllAhadeth.length; i++) {
      String hadeth = AllAhadeth[i];
      print(hadeth);
      List<String> hadethLines = hadeth.split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      HadethData hadethData = HadethData(title, hadethLines);
      Ahadeth.add(hadethData);
    }
    setState(() {});
  } */


  void HadethFile() async {
    String content = await rootBundle.loadString('assets/ahadeth.txt');
    List<String> AllAhadeth = content.trim().split('#\r\n');
    // for loop
    for (int i = 0; i < AllAhadeth.length; i++) {
      String hadeth = AllAhadeth[i];
      print(hadeth);
      List<String> hadethLines = hadeth.split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      HadethData hadethData = HadethData(title, hadethLines);
      Ahadeth.add(hadethData);
    }
    setState(() {});
  }
}

class HadethData {
  String title;
  List<String> content;
  HadethData(this.title, this.content);
}
