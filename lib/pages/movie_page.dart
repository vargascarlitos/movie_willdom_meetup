import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_willdom_meetup/flavor/my_assets_flavor.dart';

final List<String> movieListBack = [
  'assets/images/bloodshot_back.jpg',
  'assets/images/dolittle_back.jpg',
  'assets/images/mulan_back.jpeg',
  'assets/images/sonic_back.jpg',
  'assets/images/the_call_of_the_wild_back.jpg',
];

final List<Map<String, dynamic>> movieList = [
  {
    'movie': 'Bloodshot',
    'poster': 'assets/images/bloodshot.jpg',
  },
  {
    'movie': 'Dolittle',
    'poster': 'assets/images/dolittle.jpg',
  },
  {
    'movie': 'Mulan',
    'poster': 'assets/images/mulan.jpg',
  },
  {
    'movie': 'Sonic',
    'poster': 'assets/images/sonic.jpg',
  },
  {
    'movie': 'The call of the wild',
    'poster': 'assets/images/the_call_of_the_wild.jpg',
  },
];

final List<Widget> imageSliders =
    movieList.map((item) => Container(child: movieCard(item))).toList();

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  MoviePageState createState() => MoviePageState();
}

class MoviePageState extends State<MoviePage> {
  CarouselController buttonCarouselController = CarouselController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView.builder(
              controller: _scrollController,
              reverse: true,
              scrollDirection: Axis.horizontal,
              itemCount: movieListBack.length,
              itemBuilder: (BuildContext context, int index) {
                return  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration:  BoxDecoration(
                      color: Colors.black12,
                      image:  DecorationImage(
                        image:  ExactAssetImage(
                            MyAssets.getImage(movieListBack[index])),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child:  Container(
                      decoration:  BoxDecoration(
                          color: Colors.black.withOpacity(0.6)),
                    ));
              }),
          CarouselSlider(
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              aspectRatio: 2,
              viewportFraction: 0.68,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              onScrolled: (data) {
                _scrollController.animateTo(
                  ((data! * 125 / imageSliders.length) / 100) *
                      _scrollController.position.maxScrollExtent,
                  curve: Curves.ease,
                  duration: const Duration(milliseconds: 100),
                );
              },
            ),
            items: imageSliders,
          ),
        ],
      ),
      floatingActionButton: ButtonTheme(
        height: 45,
        minWidth: 280,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.amber[700],
          textColor: Colors.black,
          onPressed: () {
            if (kDebugMode) {
              print(_scrollController.position.maxScrollExtent);
            }
          },
          child: Text("Book now".toUpperCase(),
              style: const TextStyle(fontSize: 14)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

Widget movieCard(item) {
  return Column(
    children: <Widget>[
      const SizedBox(
        height: 50,
      ),
      Container(
          height: 300,
          width: 200,
          decoration:  const BoxDecoration(),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            child: Image.asset(
              MyAssets.getImage(item['poster']),
              // Paso 2: Usa MyAssets.getImage
              fit: BoxFit.cover,
              width: 1000.0,
            ),
          )),
      const SizedBox(
        height: 15,
      ),
      Text(
        item['movie'],
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      const SizedBox(
        height: 5,
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Action ",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12),
          ),
          Icon(
            Icons.brightness_1,
            color: Colors.white,
            size: 4,
          ),
          Text(
            " Adventure",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12),
          ),
        ],
      ),
      const SizedBox(
        height: 5,
      ),
      const Text(
        "4.0",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
      ),
      const SizedBox(
        height: 5,
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.star,
            size: 12,
            color: Colors.white,
          ),
          Icon(
            Icons.star,
            size: 12,
            color: Colors.white,
          ),
          Icon(
            Icons.star,
            size: 12,
            color: Colors.white,
          ),
          Icon(
            Icons.star_border,
            size: 12,
            color: Colors.white,
          ),
          Icon(
            Icons.star_border,
            size: 12,
            color: Colors.white,
          ),
        ],
      )
    ],
  );
}
