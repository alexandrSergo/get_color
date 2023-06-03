import 'package:get_color/viewer/view.dart';

part 'selection_event.dart';
part 'selection_state.dart';

class SelectionBloc extends Bloc<SelectionEvent, SelectionState> {
  SelectionBloc() : super(SelectionInitial()) {
    on<LoadSelection>(_loadSelection, transformer: restartable());
  }

  Future<void> _loadSelection(LoadSelection event, Emitter<SelectionState> emit) async {
    try {
      final List<GradientModel> selectionList = [];
      for (var i = 0; i < catalogColorList.length; i++) {
        selectionList.addAll(
          await db.collection(catalogColorList[i]).get().then(
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
          )
        );
      }
      selectionList.shuffle();
      emit(SelectionLoaded(selectionList));
    } catch (e) {
      emit(SelectionLoadingFailure(e));
    } finally {
      event.completer?.complete();
    }
  }
}
