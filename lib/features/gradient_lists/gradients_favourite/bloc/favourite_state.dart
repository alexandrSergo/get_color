part of 'favourite_bloc.dart';

abstract class FavouriteState extends Equatable {}

class FavouriteInitial extends FavouriteState {

  @override
  List<Object?> get props => [];
}

class FavouriteLoading extends FavouriteState {

  @override
  List<Object?> get props => [];
}

class FavouriteLoaded extends FavouriteState {
  FavouriteLoaded(
    this.favouriteList
  );
  final List<GradientModel> favouriteList;

  @override
  List<Object?> get props => [favouriteList];
}

class FavouriteLoadingFailure extends FavouriteState {
  FavouriteLoadingFailure(
    this.exception
  );
  final Object? exception;

  @override
  List<Object?> get props => [exception];
}