import 'package:get_color/viewer/view.dart';

const String kFontFamily = 'Montserrat';
const double kTextSizeOnButtons = 17;
const double kButtonWidth = 320;
const double kAppBarHeight = 60;
const TextStyle kAppBarTextStyle = TextStyle(color: Colors.black);

const List<String> languages = <String>['RU', 'EN'];
const List<String> catalogColorList = [
  "purple",
  "blue",
  "green",
  "cyan",
  "dark",
  "golden",
  "lime",
  "mixed",
  "orange",
  "pastel",
  "pink",
  "red",
  "silver",
  "yellow",
];

const LinearGradient kLinearGradient = LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment(0.8, 1),
  colors: <Color>[
    kGradientColor1,
    kGradientColor2,
    kGradientColor3,
  ]
);

const Color kGradientColor1 = Color.fromRGBO(132, 85, 241, 1);
const Color kGradientColor2 = Color.fromRGBO(188, 48, 234, 1);
const Color kGradientColor3 = Color.fromRGBO(196, 89, 228, 1);

const Color shadow = Color.fromARGB(83, 167, 167, 167);
const TextStyle tabStyle = TextStyle(fontSize: 20, color: kGradientColor1);
const TextStyle tabViewStyle = TextStyle(fontSize: 15, color: kGradientColor1);
const TextStyle textStyleRGB = TextStyle(fontSize: 12, color: Colors.black);