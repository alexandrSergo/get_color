import 'package:get_color/viewer/view.dart';

part 'collection_event.dart';
part 'collection_state.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  CollectionBloc() : super(CollectionInitial()) {
    on<LoadCollection>(_loadColllection, transformer: restartable());
  }

  Future<void> _loadColllection(LoadCollection event, Emitter<CollectionState> emit) async {
    try {
      final collectionList = await db.collection(event.collectionName).get().then(
        (value) {
          final gradientsList = value.docs.map((e) => GradientModel(
              Color.fromRGBO(e.data()["color1"][0], e.data()["color1"][1], e.data()["color1"][2], 1.0), 
              Color.fromRGBO(e.data()["color2"][0], e.data()["color2"][1], e.data()["color2"][2], 1.0),  
              Color.fromRGBO(e.data()["color3"][0], e.data()["color3"][1], e.data()["color3"][2], 1.0),
              e.id 
            )
          );
          return gradientsList.toList();
        }
      );
      collectionList.shuffle();
      emit(CollectionLoaded(collectionList: collectionList));
    } catch (e) {
      emit(CollectionLoadingFailure(e));
    } finally {
      event.completer?.complete();
    }
  }
}
