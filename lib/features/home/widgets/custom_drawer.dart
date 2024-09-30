import 'package:flutter/material.dart';
import 'package:news_app/core/colors_palette.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomDrawer extends StatelessWidget {
 final void Function() onCategoriesChangedClicked;
 final void Function() onSettingsClicked;
  const CustomDrawer({super.key,required this.onCategoriesChangedClicked,required this.onSettingsClicked});

  @override
  Widget build(BuildContext context) {
    var mediaQuery=MediaQuery.of(context).size;
    var theme=Theme.of(context);
    var lang=AppLocalizations.of(context)!;
    return Container(
      width: mediaQuery.width*0.7,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: ColorsPalette.primaryColor,
            height: mediaQuery.height*0.2,
            child: Center(child: Text('${lang.news_app} !',style: theme.textTheme.bodyLarge!.copyWith(color: Colors.white),)),
          ),
          InkWell(
            onTap: (){
              onCategoriesChangedClicked();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.list,color: Color(0XFF303030),size: 40,),
                  SizedBox(width: 10,),
                  Text(lang.categories,style: theme.textTheme.bodyLarge,)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              onSettingsClicked();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.settings,color: Color(0XFF303030),size: 40,),
                  SizedBox(width: 10,),
                  Text(lang.settings,style: theme.textTheme.bodyLarge,)
                ],
              ),
            ),
          ),

        ],
      ),

    );
  }
}
