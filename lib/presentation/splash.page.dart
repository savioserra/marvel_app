import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel_app/core/repositories/heroes.repository.dart';
import 'package:marvel_app/presentation/home/home.page.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  Future<void> loadProcess;

  @override
  void initState() {
    loadProcess = HeroesRepository().cache;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Future.wait([Future.delayed(Duration(seconds: 1)), loadProcess]).whenComplete(
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => HomePage()),
      ),
    );

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0XFFF0141E),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(seconds: 1),
          child: SvgPicture.asset(
            'assets/icons/marvel.svg',
            width: screenWidth * 0.8,
            color: Colors.white,
          ),
          builder: (ctx, opacity, child) => Opacity(
            opacity: opacity,
            child: child,
          ),
        ),
      ),
    );
  }
}
