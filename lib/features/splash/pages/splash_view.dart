import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/core/config/page_routes_name.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}
class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5),()=>Navigator.pushReplacementNamed(context, PageRoutesName.home));

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage('assets/images/pattern.png'))
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(child: Image.asset('assets/icons/logo.png')),
      ),
    );
  }
}
