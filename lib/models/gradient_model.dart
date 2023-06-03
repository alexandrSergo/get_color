import 'package:get_color/viewer/view.dart';


class GradientModel extends Equatable{
  const GradientModel(
    this.color1, 
    this.color2, 
    this.color3, 
    this.gradientID
  );

  final String gradientID;
  
  final Color color1;
  final Color color2;
  final Color color3;

  List<String> get getRGBO => [
    "${color1.red}, ${color1.green}, ${color1.blue}, 1", 
    "${color2.red}, ${color2.green}, ${color2.blue}, 1", 
    "${color3.red}, ${color3.green}, ${color3.blue}, 1"
  ];

  List<String> get getARGB => [
    "255, ${color1.red}, ${color1.green}, ${color1.blue}", 
    "255, ${color2.red}, ${color2.green}, ${color2.blue}", 
    "255, ${color3.red}, ${color3.green}, ${color3.blue}"
  ];

  List<String> get getHEX => [
    "#${color1.red.toRadixString(16).padLeft(2, '0')}${color1.green.toRadixString(16).padLeft(2, '0')}${color1.blue.toRadixString(16).padLeft(2, '0')}", 
    "#${color2.red.toRadixString(16).padLeft(2, '0')}${color2.green.toRadixString(16).padLeft(2, '0')}${color2.blue.toRadixString(16).padLeft(2, '0')}", 
    "#${color3.red.toRadixString(16).padLeft(2, '0')}${color3.green.toRadixString(16).padLeft(2, '0')}${color3.blue.toRadixString(16).padLeft(2, '0')}",
  ];
  
  @override
  List<Object?> get props => [color1, color2, color3];
  
}