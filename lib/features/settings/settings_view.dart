import 'package:flutter/material.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:news_app/core/colors_palette.dart';
import 'package:news_app/features/settings/setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsView extends StatelessWidget {

  const SettingsView({super.key});
  final List _languages=const ['English','عربى'];
  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    var provider=Provider.of<SettingsProvider>(context);
    var lang=AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0,vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(lang.language,style: theme.textTheme.bodySmall,),
const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CustomDropdown(
              decoration: CustomDropdownDecoration(
expandedSuffixIcon: const Icon(Icons.arrow_drop_up_outlined,color: ColorsPalette.primaryColor,),
                closedSuffixIcon: const Icon(Icons.arrow_drop_down_outlined,color: ColorsPalette.primaryColor,),
                headerStyle: theme.textTheme.bodySmall!.copyWith(color: ColorsPalette.primaryColor,fontSize: 16,fontWeight: FontWeight.w500),
                closedBorder:  Border.all(
                    color: ColorsPalette.primaryColor,),
                expandedBorder: Border.all(
                    color: ColorsPalette.primaryColor,
                 ),
              ),
              initialItem: provider.currentLanguage=='en'?_languages[0]:_languages[1],
                items: _languages, onChanged: (value){
                if(value=='English'){
                  provider.changeLanguage('en');
                }
                if(value=='عربى'){
                  provider.changeLanguage('ar');
                }


            }),
          )
        ],
      ),
    );
  }
}
