import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel_app/core/models/character.dart';
import 'package:marvel_app/core/repositories/heroes.repository.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final repository = HeroesRepository();

  List<Character> heroes = [];
  List<Character> villains = [];
  List<Character> antiHeroes = [];
  List<Character> aliens = [];
  List<Character> humans = [];

  @override
  void initState() {
    super.initState();

    repository.fetchAliens().then((value) => setState(() => aliens = value));
    repository.fetchAntiHeroes().then((value) => setState(() => antiHeroes = value));
    repository.fetchHeroes().then((value) => setState(() => heroes = value));
    repository.fetchHumans().then((value) => setState(() => humans = value));
    repository.fetchVillains().then((value) => setState(() => villains = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.grey[50],
        title: SvgPicture.asset('assets/icons/marvel_gradient.svg', height: 30),
        actions: [
          Padding(padding: const EdgeInsets.only(right: 24.0), child: SvgPicture.asset('assets/icons/search.svg'))
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.all(24), child: WelcomeSection()),
            const CategoriesSection(),
            const SectionHeader(title: "Heróis"),
            listCharacters(heroes),
            const SectionHeader(title: "Vilões"),
            listCharacters(villains),
            const SectionHeader(title: "Anti-heróis"),
            listCharacters(antiHeroes),
            const SectionHeader(title: "Alienígenas"),
            listCharacters(aliens),
            const SectionHeader(title: "Humanos"),
            listCharacters(humans),
            SizedBox(height: 42)
          ],
        ),
      ),
    );
  }

  Widget listCharacters(List<Character> characters) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        itemCount: characters.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        separatorBuilder: (ctx, idx) => SizedBox(width: 20),
        itemBuilder: (ctx, idx) {
          final character = characters[idx];

          return ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Stack(
              children: [
                Image.asset(
                  character.imagePath,
                  width: 200,
                  height: 300,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  filterQuality: FilterQuality.low,
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Colors.black],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.2, 1.0],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 24,
                  bottom: 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(character.alterEgo, style: const TextStyle(color: Colors.white, fontSize: 12)),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: 162,
                        child: Text(
                          character.name,
                          style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.white30,
                      onTap: () {}, // TODO: add handler
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
        title,
        style: const TextStyle(color: Color(0xFFF2264B), fontSize: 18, fontWeight: FontWeight.w900),
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
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
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
        Text(
          "Escolha o seu personagem",
          style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w900),
        ),
      ],
    );
  }
}
