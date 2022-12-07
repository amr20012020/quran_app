import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/screens/quran/sura_name_item.dart';
import 'package:quran_app/styles/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {


  List<String> sura_name = ["الفاتحه","البقره","آل عمران","النساء","المائده"
  ,"الأنعام","الأعراف"," الأنفال","التوبة","يونس","هود","يوسف","الرعد"," إبراهيم","الحجر","النحل"
  ,"الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون","النور"
  ,"الفرقان","الشعراء","النمل","القصص","العنكبوت","الروم","لقمان","السجدة"
  ,"الأحزاب","سبأ","فاطر","يس","الصافات","ص","الزمر","غافر","فصلت","الشورى"
  ,"الزخرف","الدخان","الجاثية","الأحقاف","محمد","الفتح","الحجرات","ق"
  ,"الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
  ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك"
  ,"القلم","الحاقة","المعارج","نوح","الجن","المزّمِّل","المدّثر","القيامة"
  ,"الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار","المطففين","الانشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس"
  ,"الليل","الضحى","الشرح","التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة"
  ,"التكاثر","العصر","الهُمَزَة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر"
  ,"المسد","الإخلاص","الفلق","الناس"
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children:
        [
          Image.asset('assets/images/quran_main_bg.png'),
          Divider(
            color: MyThemeData.colorGold,
            thickness: 3,
            endIndent: 25,
            indent: 25,
          ),
          Text(
              AppLocalizations.of(context)!.sura_name,
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
          Divider(
            color: MyThemeData.colorGold,
            thickness: 3,
            endIndent: 25,
            indent: 25,
          ),
          Expanded(
            child: ListView.separated(
                 separatorBuilder: (context,index) => Divider(
                   color: MyThemeData.colorGold,
                   endIndent: 25,
                   thickness: 1,
                   indent: 25,
                 ),
                 shrinkWrap: true,
                itemCount: sura_name.length,
                itemBuilder: (_,index){
                  return SuraNameItem(sura_name[index],index);
            }),
          ),
        ],
      ),
    );
  }
}
