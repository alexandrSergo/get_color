import 'package:get_color/viewer/view.dart';

Widget buttonGradient(String text, onPressed) {
  return Container(
    width: kButtonWidth,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      gradient: kLinearGradient
    ),
    child: TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(16),
      ),
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(fontSize: kTextSizeOnButtons, fontWeight: FontWeight.w400, color: Colors.white,)),
    ),
  );
}

Container buttonBorderColor(String text, onPressed) {
  return Container(
    width: kButtonWidth,
    decoration: BoxDecoration(
      gradient: kLinearGradient,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Padding(
      padding: const EdgeInsets.all(2.5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text, style: const TextStyle(fontSize: kTextSizeOnButtons, fontWeight: FontWeight.w400, color: Colors.black),),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}