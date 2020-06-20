import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:marvel_app/presentation/home/appbar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.grey[50],
        title: SvgPicture.asset('assets/icons/marvel_gradient.svg', color: Color(0xFFED1D24), height: 30),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: WelcomeSection(),
            ),
            CategoriesSection(),
            Container(height: 200, color: Colors.black),
            Container(height: 200, color: Colors.white),
            Container(height: 200, color: Colors.black),
            Container(height: 200, color: Colors.white),
            Container(height: 200, color: Colors.black),
            Container(height: 200, color: Colors.white),
            Container(height: 200, color: Colors.black),
            Container(height: 200, color: Colors.white),
            Container(height: 200, color: Colors.black),
            Container(height: 200, color: Colors.white),
            Container(height: 200, color: Colors.black),
            Container(height: 200, color: Colors.white),
            Container(height: 200, color: Colors.black),
            Container(height: 200, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    final spaceBetween = (screenSize - (4.5 * 60) - 24) / 4;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(right: spaceBetween),
              child: const CategoryIcon(
                colors: [Color(0xFF005BEA), Color(0xFF00C6FB)],
                svgPath: 'assets/icons/hero.svg',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: spaceBetween),
              child: const CategoryIcon(
                colors: [Color(0xFFED1D24), Color(0xFFED1F69)],
                svgPath: 'assets/icons/villain.svg',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: spaceBetween),
              child: const CategoryIcon(
                colors: [Color(0xFFB224EF), Color(0xFF7579FF)],
                svgPath: 'assets/icons/antihero.svg',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: spaceBetween),
              child: const CategoryIcon(
                colors: [Color(0xFF0BA360), Color(0xFF3CBA92)],
                svgPath: 'assets/icons/alien.svg',
              ),
            ),
            const CategoryIcon(
              colors: [Color(0xFFFF7EB3), Color(0xFFFF758C)],
              svgPath: 'assets/icons/human.svg',
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final List<Color> colors;
  final String svgPath;

  const CategoryIcon({Key key, this.colors, this.svgPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 60,
          width: 60,
          child: SvgPicture.asset(svgPath, fit: BoxFit.none, color: Colors.white),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: colors, begin: Alignment.topCenter, end: Alignment.bottomCenter),
            boxShadow: [BoxShadow(color: colors.first.withOpacity(0.15), offset: const Offset(0, 12), blurRadius: 12)],
          ),
        ),
        Positioned.fill(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.white38,
                highlightColor: Colors.transparent,
                onTap: () {}, // TODO: Add handler
              ),
            ),
          ),
        )
      ],
    );
  }
}

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Bem-vindo ao Marvel Heroes",
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        SizedBox(height: 8),
        Text("Escolha o seu personagem", style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w900)),
      ],
    );
  }
}
