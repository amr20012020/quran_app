import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AyaItem extends StatelessWidget {
  String aya;
  int index;
  AyaItem(this.aya, this.index);

  @override
  Widget build(BuildContext context) {
    return Text(aya + '(' +'$index' + ')',style: Theme.of(context).textTheme.subtitle1,textAlign: TextAlign.center,);
  }
}
