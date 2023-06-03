part of 'favourite_bloc.dart';

abstract class FavouriteEvent extends Equatable {}

class LoadFavourite extends FavouriteEvent {
  LoadFavourite(
    this.favList, 
    this.completer
  );

  final List<String> favList;
  final Completer? completer;

  @override
  List<Object?> get props => [favList, completer];
}
