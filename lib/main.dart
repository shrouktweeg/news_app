import 'package:flutter/material.dart';
import 'package:news_app/features/settings/setting_provider.dart';
import 'package:provider/provider.dart';
import 'core/config/app_router.dart';
import 'core/config/application_theme_manager.dart';
import 'core/config/page_routes_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider
    (create: (context)=>SettingsProvider()..getLanguage(),child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    var provider=Provider.of<SettingsProvider>(context);

    return MaterialApp(
      title: 'News App',
      locale: Locale(provider.currentLanguage),
      localizationsDelegates:AppLocalizations.localizationsDelegates,
      supportedLocales:AppLocalizations.supportedLocales,
      theme: ApplicationThemeManager.themeData,
      initialRoute: PageRoutesName.initial,
      onGenerateRoute: AppRouter.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
