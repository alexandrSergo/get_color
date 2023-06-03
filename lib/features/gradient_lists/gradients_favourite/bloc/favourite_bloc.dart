import 'package:get_color/viewer/view.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteInitial()) {
    on<LoadFavourite>(_loadFavourite, transformer: restartable());
  }

  Future<void> _loadFavourite(LoadFavourite event, Emitter<FavouriteState> emit) async {
    try {
      final List<GradientModel> favList = [];
      for (var i = 0; i < catalogColorList.length; i++) {
        favList.addAll(
          await db.collection(catalogColorList[i]).get().then((value) {
            final dataList = value.docs.where(
              (element) => event.favList.contains(element.id)
            ).map((e) => GradientModel(
                Color.fromRGBO(e.data()["color1"][0], e.data()["color1"][1], e.data()["color1"][2], 1.0), 
                Color.fromRGBO(e.data()["color2"][0], e.data()["color2"][1], e.data()["color2"][2], 1.0),  
                Color.fromRGBO(e.data()["color3"][0], e.data()["color3"][1], e.data()["color3"][2], 1.0),
                e.id 
              )
            );
            return dataList.toList();
          })
        );
      }
      emit(FavouriteLoaded(favList));
    } catch (e) {
      emit(FavouriteLoadingFailure(e));
    } finally {
      event.completer?.complete();
    }
  }
}
