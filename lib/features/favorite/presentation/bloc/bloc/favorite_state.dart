part of 'favorite_bloc.dart';

enum FavoriteStatus { initial, loading, success, failure }

class FavoriteState extends Equatable {
  const FavoriteState({this.status = FavoriteStatus.initial, this.movies = const []});

  final FavoriteStatus status;
  final List<MovieEntity> movies;

  bool contains(int id) => movies.any((m) => m.id == id);

  FavoriteState copyWith({FavoriteStatus? status, List<MovieEntity>? movies}) {
    return FavoriteState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
    );
  }

  @override
  List<Object?> get props => [status, movies];
}
