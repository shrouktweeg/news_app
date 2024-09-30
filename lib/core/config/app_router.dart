

import 'package:flutter/material.dart';
import 'package:news_app/core/config/page_routes_name.dart';
import 'package:news_app/features/home/views/home_view.dart';
import 'package:news_app/features/home/views/news_view.dart';
import '../../features/splash/pages/splash_view.dart';

class AppRouter{
static Route<dynamic> onGenerateRoute(RouteSettings settings){
  switch (settings.name){
    case PageRoutesName.initial:
      return MaterialPageRoute(builder: (context)=>const SplashView(),settings: settings);
    case PageRoutesName.home:
      return MaterialPageRoute(builder: (context)=> HomeView(),settings: settings);
    case PageRoutesName.news:
      return MaterialPageRoute(builder: (context)=>const NewsView(),settings: settings);
    default:
      return MaterialPageRoute(builder: (context)=>const SplashView(),settings: settings);
  }
}
}