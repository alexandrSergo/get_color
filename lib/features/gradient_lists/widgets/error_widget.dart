import 'package:get_color/viewer/view.dart';

class ConnectionErrorWidget extends StatelessWidget {
  const ConnectionErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppLocalizations.of(context)!.error, textAlign: TextAlign.center,),
    );
  }
}