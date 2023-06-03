import 'package:get_color/viewer/view.dart';

class TypeAppBar extends StatelessWidget {
  const TypeAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      title: Text(title, style: kAppBarTextStyle,),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: gradientIcon(const Icon(Icons.keyboard_arrow_down_outlined, size: 40,))
      ),
    );
  }
}