part of 'collection_bloc.dart';

abstract class CollectionState extends Equatable{}

class CollectionInitial extends CollectionState {

  @override
  List<Object?> get props => [];
}

class CollectionLoading extends CollectionState {

  @override
  List<Object?> get props => [];
}

class CollectionLoaded extends CollectionState {
  CollectionLoaded({
    required this.collectionList
  });

  final List<GradientModel> collectionList;
  
  @override
  List<Object?> get props => [collectionList];
}

class CollectionLoadingFailure extends CollectionState {
  CollectionLoadingFailure(
    this.exception
  );

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
