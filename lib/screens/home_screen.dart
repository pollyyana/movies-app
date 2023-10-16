import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/widgets/movies_sections.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_selecaoGuias);
    super.initState();
  }

  _selecaoGuias() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title:
              Text('Movies Streaming', style: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: 230,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: AssetImage('assets/upcoming1.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: AssetImage('assets/upcoming2.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: AssetImage('assets/upcoming3.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: AssetImage('assets/upcoming4.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            TabBar(
              controller: _tabController,
              unselectedLabelColor: Colors.white.withOpacity(0.5),
              isScrollable: true,
              indicator: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              labelStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              labelPadding: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.only(left: 10),
              labelColor: Colors.white,
              dividerColor: Colors.transparent,
              tabs: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Tab(text: 'Tudo'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Tab(text: 'Acao'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Tab(text: 'Aventura'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Tab(text: 'Comedia'),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: [
               MoviesSections(),
                Container(),
                Container(),
                Container(),
              ][_tabController.index],
            ),
          ],
        ));
  }
}
