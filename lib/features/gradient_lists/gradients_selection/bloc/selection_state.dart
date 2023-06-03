part of 'selection_bloc.dart';

abstract class SelectionState extends Equatable {
}

class SelectionInitial extends SelectionState {

  @override
  List<Object?> get props => [];
}

class SelectionLoading extends SelectionState {

  @override
  List<Object?> get props => [];
}

class SelectionLoaded extends SelectionState {
  SelectionLoaded(
    this.selectionList
  );
  final List<GradientModel> selectionList;

  @override
  List<Object?> get props => [selectionList];
}

class SelectionLoadingFailure extends SelectionState {
  SelectionLoadingFailure(
    this.exception
  );
  final Object? exception;

  @override
  List<Object?> get props => [exception];
}