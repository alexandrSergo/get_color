import 'package:get_color/viewer/view.dart';

Widget collectionColorCard(String colorName, BuildContext context) {
  late final Color c1;
  late final Color c2;
  late final Color c3;
  late final String colorNameLocale;

  final AppLocalizations locale = AppLocalizations.of(context)!;

  switch (colorName) {
    case "purple":
    c1 = const Color.fromARGB(255, 211, 34, 255);
    c2 = const Color.fromARGB(255, 154, 14, 247);
    c3 = const Color.fromARGB(255, 138, 0, 218);
    colorNameLocale = locale.purple;
    break;
    // case "purple": //* dev
    //   c1 = Color.fromARGB(255, 110, 110, 110);
    //   c2 = Color.fromARGB(255, 165, 165, 165);
    //   c3 = Color.fromARGB(255, 221, 221, 221);
    //   colorNameLocale = locale.purple;
    //   break;
    case "blue":
      c1 = const Color.fromARGB(255, 17, 62, 187);
      c2 = const Color.fromARGB(255, 51, 91, 199);
      c3 = const Color.fromARGB(255, 71, 108, 212);
      colorNameLocale = locale.blue;
      break;
    case "green":
      c1 = const Color.fromARGB(255, 12, 163, 12);
      c2 = const Color.fromARGB(255, 62, 224, 62);
      c3 = const Color.fromARGB(255, 16, 150, 16);
      colorNameLocale = locale.green;
      break;
    case "cyan":
      c1 = const Color.fromARGB(255, 17, 190, 212);
      c2 = const Color.fromARGB(255, 104, 237, 255);
      c3 = const Color.fromARGB(255, 108, 202, 214);
      colorNameLocale = locale.cyan;
      break;
    case "dark":
      c1 = const Color.fromARGB(255, 36, 23, 39);
      c2 = const Color.fromARGB(255, 59, 59, 59);
      c3 = const Color.fromARGB(255, 97, 100, 100);
      colorNameLocale = locale.dark;
      break;
    case "golden":
      c1 = const Color.fromARGB(255, 255, 244, 182);
      c2 = const Color.fromARGB(255, 255, 236, 129);
      c3 = const Color.fromARGB(255, 255, 243, 176);
      colorNameLocale = locale.golden;
      break;
    case "lime":
      c1 = const Color.fromARGB(255, 99, 250, 11);
      c2 = const Color.fromARGB(255, 138, 247, 75);
      c3 = const Color.fromARGB(255, 3, 209, 82);
      colorNameLocale = locale.lime;
      break;
    case "mixed":
      c1 = const Color.fromARGB(255, 255, 105, 94);
      c2 = const Color.fromARGB(255, 168, 92, 187);
      c3 = const Color.fromARGB(255, 118, 49, 248);
      colorNameLocale = locale.mixed;
      break;
    case "orange":
      c1 = const Color.fromARGB(255, 255, 134, 35);
      c2 = const Color.fromARGB(255, 255, 162, 86);
      c3 = const Color.fromARGB(255, 255, 120, 80);
      colorNameLocale = locale.orange;
      break;
    case "pastel":
      c1 = const Color.fromARGB(255, 217, 167, 199);
      c2 = const Color.fromARGB(255, 253, 192, 231);
      c3 = const Color.fromARGB(255, 255, 252, 220);
      colorNameLocale = locale.pastel;
      break;
    case "pink":
      c1 = const Color.fromARGB(255, 196, 89, 228);
      c2 = const Color.fromARGB(255, 223, 119, 255);
      c3 = const Color.fromARGB(255, 255, 69, 255);
      colorNameLocale = locale.pink;
      break;
    case "red":
      c1 = const Color.fromARGB(255, 250, 45, 45);
      c2 = const Color.fromARGB(255, 197, 0, 0);
      c3 = const Color.fromARGB(255, 153, 12, 12);
      colorNameLocale = locale.red;
      break;
    case "silver":
      c1 = const Color.fromARGB(255, 243, 243, 243);
      c2 = const Color.fromARGB(255, 204, 196, 196);
      c3 = const Color.fromARGB(255, 179, 179, 179);
      colorNameLocale = locale.silver;
      break;
    case "yellow":
      c1 = const Color.fromARGB(255, 255, 220, 21);
      c2 = const Color.fromARGB(255, 255, 229, 79);
      c3 = const Color.fromARGB(255, 255, 221, 31);
      colorNameLocale = locale.yellow;
      break;
  }
  const Color shadow =Color.fromARGB(83, 167, 167, 167);
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          routeUp(context, CatalogCollectionScreen(collectionName: colorName, collectionNameLocale: colorNameLocale,));
        },
        child: Stack(
          children: [
            Container(
              width: 160,
              height: 100,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(color: shadow, offset: Offset(0, 2)),
                  BoxShadow(color: shadow, offset: Offset(1.5, 2.5)),
                  BoxShadow(color: shadow, offset: Offset(-1.5, 2.5)),
                ],
                borderRadius: BorderRadius.circular(6),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: const Alignment(0.8, 1),
                  colors: <Color>[
                    c1,
                    c2,
                    c3,
                  ]
                )
              ),
            ),
            const Positioned(
              top: 5,
              right: 5,
              child: Icon(Icons.ads_click_outlined, color: Colors.white24,)
            ),
          ]
        ),
      ),
      const SizedBox(height: 3,),
      Text(colorNameLocale),
    ],
  );
}