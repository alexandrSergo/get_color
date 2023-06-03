import 'package:get_color/viewer/view.dart';

ShaderMask gradientIcon(Icon icon) {
  return ShaderMask(
    blendMode: BlendMode.srcIn,
    shaderCallback: (Rect bounds) {
      return kLinearGradient.createShader(bounds);
    },
    child: icon
  );
}