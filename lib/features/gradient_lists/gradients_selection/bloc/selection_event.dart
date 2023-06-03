part of 'selection_bloc.dart';

abstract class SelectionEvent extends Equatable {
}

class LoadSelection extends SelectionEvent {
  LoadSelection(
    this.completer
  );
  final Completer? completer;
  
  @override
  List<Object?> get props => [completer];
}
