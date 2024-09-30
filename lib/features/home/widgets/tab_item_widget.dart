import 'package:flutter/material.dart';
import 'package:news_app/core/colors_palette.dart';
import 'package:news_app/data/models/source_model.dart';

class TabItemWidget extends StatelessWidget {
 final Source source;
 final bool isSelected;
  const TabItemWidget({super.key,required this.source,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return Container(
      padding:const EdgeInsets.symmetric(vertical: 6,horizontal: 20),
      decoration: BoxDecoration(
        color: isSelected?ColorsPalette.primaryColor:Colors.white,
        borderRadius: BorderRadius.circular(25),
        border:Border.all(color: ColorsPalette.primaryColor)
      ),
      child: Text(source.name,style: theme.textTheme.titleLarge!.copyWith(color: isSelected?Colors.white:ColorsPalette.primaryColor,fontSize: 14),),
    );
  }
}
