import 'package:get_color/viewer/view.dart';

class FavouriteProvider extends ChangeNotifier {
  List<String>? favList;

  Future<void> getFavorList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getStringList("favList") == null ? prefs.setStringList("favList", []) : null;
    favList = prefs.getStringList("favList");
    notifyListeners();
  }

  Future<void> addToFavorList(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favList?.add(id);
    favList != null ? prefs.setStringList("favList", favList!) : null;
    favList = prefs.getStringList("favList");
    notifyListeners();
  }

  Future<void> removeFromFavorList(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favList?.remove(id);
    favList != null ? prefs.setStringList("favList", favList!) : null;
    favList = prefs.getStringList("favList");
    notifyListeners();
  }
}