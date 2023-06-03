part of 'collection_bloc.dart';

abstract class CollectionEvent extends Equatable{}

class LoadCollection extends CollectionEvent {
  LoadCollection(this.completer, {
    required this.collectionName
  });
  final Completer? completer;
  final String collectionName;
  
  @override
  List<Object?> get props => [completer];

}
