import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/screens/ahadithScreen.dart';
import 'package:quran_app/styles/my_theme.dart';

import '../../provider/my_provider.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = 'hadeth-details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethData;
    var provider = Provider.of<MyProvider>(context);
    return Stack(children: [
      Image.asset(
        provider.mode == ThemeMode.light?
        'assets/images/main_background.png'
            : "assets/images/bg@3x.png",
        fit: BoxFit.fitWidth, width: double.infinity,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            args.title,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 25,vertical: 30),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            border: Border.all(color: Theme.of(context).colorScheme.primary,width: 2),
          ),
          child: ListView.separated(
            separatorBuilder: (context,index) => Divider(
              color: MyThemeData.colorGold,
              indent: 30,
              endIndent: 30,
            ),
              itemCount:args.content.length ,
              itemBuilder: (_, index) {
            return Text(
              args.content[index],
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            );
          }),
        ),
      ),
    ]);
  }
}
