import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Place Recommendation';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              ImageSection(
                image: 'images/penida.jpg',
              ),
              TitleSection(name: 'Nusa Penida', location: 'Bali, Indonesia'),
              ButtonSection(),
              TextSection(
                description:
                    'An island located near the southeastern Indonesian island of Bali'
                    ' and a district of Klungkung Regency that includes the neighbouring small island of Nusa'
                    'Lembongan and twelve even smaller islands'
                    'Penida Island and Bali Island are separated by the Badung Strait'
                    'The island is full of mountains. And has the highest point at 524 meters above sea level ',
              ),
              Padding(
                padding: EdgeInsets.only(top: 70),
                child: BottomPart(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
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
                    ),
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(color: Colors.grey[500]),
                )
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(
            color: color,
            icon: Icons.call,
            label: 'Call',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.near_me,
            label: 'Route',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.share,
            label: 'Share',
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
      children: [
        Icon(
          icon,
          color: color,
        ),
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

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.description,
  });

  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}

class BottomPart extends StatelessWidget {
  const BottomPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 40, 0, 30),
        height: 600,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 300,
                child: leftColumn,
              ),
              Image.network(
                'https://awsimages.detik.net.id/community/media/visual/2021/08/27/resep-ayam-betutu-gilimanuk_43.jpeg?w=1200',
                width: 500,
                height: 240,
              )
            ],
          ),
        ),
      ),
    );
  }
}

final leftColumn = Container(
  padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
  child: Column(children: [
    titleText,
    subTitle,
    ratings,
    iconList,
  ]),
);

const titleText = Padding(
  padding: EdgeInsets.all(20),
  child: Text(
    'Betutu Chicken',
    style: TextStyle(
      fontWeight: FontWeight.w800,
      letterSpacing: 0.5,
      fontSize: 30,
    ),
  ),
);

const subTitle = Text(
  "Betutu is a Balinese dish that includes steamed or grilled chicken or"
  "duck in rich bambu betutu. This seasoned and spiced dish is a popular dish"
  "in Bali and Lombok. Indonesia A spicier version is available using a special"
  "hot sauce made from uncooked onions mixed with red chilies and coconut oil",
  textAlign: TextAlign.center,
  style: TextStyle(
    fontFamily: 'Georgia',
    fontSize: 16,
  ),
);

final stars = Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(
      Icons.star,
      color: Colors.green[500],
    ),
    Icon(
      Icons.star,
      color: Colors.green[500],
    ),
    Icon(
      Icons.star,
      color: Colors.green[500],
    ),
    Icon(
      Icons.star,
      color: Colors.green[500],
    ),
    const Icon(
      Icons.star,
      color: Colors.black,
    ),
  ],
);

final ratings = Container(
  padding: const EdgeInsets.all(20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      stars,
      const Text(
        '170 Reviews',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w800,
          fontFamily: 'Roboto',
          letterSpacing: 0.5,
          fontSize: 16,
        ),
      )
    ],
  ),
);

const descTextstyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w800,
  fontFamily: 'Roboto',
  letterSpacing: 0.5,
  fontSize: 13,
  height: 2,
);

final iconList = DefaultTextStyle(
  style: descTextstyle,
  child: Container(
    padding: const EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Icon(
              Icons.soup_kitchen_sharp,
              color: Colors.green[500],
            ),
            const Text('Prep: '),
            const Text('25 Min'),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.timer,
              color: Colors.green[500],
            ),
            const Text('Cook: '),
            const Text('1 hr'),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.restaurant,
              color: Colors.green[500],
            ),
            const Text('Feeds: '),
            const Text('2 - 4'),
          ],
        )
      ],
    ),
  ),
);
