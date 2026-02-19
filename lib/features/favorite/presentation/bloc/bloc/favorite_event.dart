part of 'favorite_bloc.dart';

sealed class FavoriteEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class FavoritesLoaded extends FavoriteEvent {}

final class FavoriteToggled extends FavoriteEvent {
  FavoriteToggled(this.movie);
  final MovieEntity movie;

  @override
  List<Object?> get props => [movie];
}

