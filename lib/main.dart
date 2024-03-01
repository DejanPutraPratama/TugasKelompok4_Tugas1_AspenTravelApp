import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
      body: const SingleChildScrollView(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            ImageSection(
              image: 'assets/image.png',
            ),
            TitleSection(
              name: 'Coeurdes Alpes',
              location: 'Show Map',
            ),
            TextSection(
              description:
                  'Aspen is as close as one can get to a storybook alpine town in America. The choose-your-own-adventure possibilities—skiing, hiking, dining shopping and ....',
              read: 'Read More',
            ),
            ButtonSection(),
            BottomSection(price: 199)
          ],
        ),
      ),
    ));
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    Key? key,
    required this.name,
    required this.location,
  }) : super(key: key);

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Color(0xfff49536),
                    ),
                    const SizedBox(
                        width: 6), // Add spacing between star and rating
                    const Text('4.6 (366 Reviews)'),
                  ],
                ),
              ],
            ),
          ),
          // New child for "Show Map"
          TextButton(
            onPressed: () {
              // Handle "Show Map" button press
            },
            child: Text(
              'Show Map',
              style: TextStyle(
                color: Colors.blue, // Set your desired text color
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({
    Key? key,
    required this.description,
    required this.read,
  }) : super(key: key);

  final String description, read;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 5, bottom: 5),

            child: Text(
              description,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color(0xFF3A544F),
                fontSize: 14,
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                Text(
                  read,
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const
                  Icon(Icons.keyboard_arrow_down_rounded, color: Colors.blue), onPressed: (){}, iconSize: 24,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Facilities',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  containerWithIconAndText(Icons.wifi, "WiFi"),
                  containerWithIconAndText(Icons.dinner_dining, "Dinner"),
                  containerWithIconAndText(Icons.bathtub, "1 Tub"),
                  containerWithIconAndText(Icons.pool, "Pool"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget containerWithIconAndText(IconData icon, String text) {
    return Container(
      width: 80, // Adjust container size
      height: 80,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 204, 204, 204),
        borderRadius: BorderRadius.circular(10), // Round the corners
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: const Color.fromARGB(255, 143, 142, 142),
            size: 24.0,
          ),
          const SizedBox(height: 4), // Add some spacing between icon and text
          Text(
            text,
            style: TextStyle(
              color: const Color.fromARGB(255, 143, 142, 142),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
// #docregion ImageSection
class ImageSection extends StatelessWidget {
  const ImageSection({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      height: 365,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              width: 335,
              height: 340,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
                size: 10,
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(50, 40),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(360),
                ),
                padding: const EdgeInsets.only(
                  top: 15,
                  bottom: 15,
                ),
              ),
              onPressed: () {},
              child: const Icon(
                Icons.favorite,
                weight: 30,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// #enddocregion ImageSection

// #docregion FavoriteWidget
class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}
// #enddocregion FavoriteWidget

// #docregion _FavoriteWidgetState, _FavoriteWidgetState-fields, _FavoriteWidgetState-build
class _FavoriteWidgetState extends State<FavoriteWidget> {
  // #enddocregion _FavoriteWidgetState-build
  bool _isFavorited = true;
  int _favoriteCount = 41;

  // #enddocregion _FavoriteWidgetState-fields

  // #docregion _toggleFavorite
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
  // #enddocregion _toggleFavorite
  // #docregion _FavoriteWidgetState-build
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
// #docregion _FavoriteWidgetState-fields
}

class BottomSection extends StatelessWidget {
  const BottomSection({super.key, required this.price});

  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Price",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              Text("${String.fromCharCodes(Runes('\u0024'))}$price",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color.fromRGBO(45, 215, 164, 1))),
            ],
          ),
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
                  backgroundColor: const MaterialStatePropertyAll(
                      Color.fromRGBO(23, 111, 242, 1)),
                  foregroundColor: const MaterialStatePropertyAll(Colors.white),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
                  elevation: const MaterialStatePropertyAll(10),
                  shadowColor: const MaterialStatePropertyAll(
                      Color.fromRGBO(0, 56, 255, 0.5))),
              child: const Row(
                children: [
                  Text("Book Now"),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.arrow_forward_rounded)
                ],
              ))
        ],
      ),
    );
  }
}
