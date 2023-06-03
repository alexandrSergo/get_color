import 'package:get_color/viewer/view.dart';

class LocaleProvider extends ChangeNotifier {
  String locale = 'en';

  void changeLocale() {
    locale =  locale == 'en' ? 'ru' : 'en';
    notifyListeners();
  }
}