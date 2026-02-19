part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.byGenre = const {},
  });

  final HomeStatus status;
  final Map<String, List<MovieEntity>> byGenre;

  HomeState copyWith({
    HomeStatus? status,
    Map<String, List<MovieEntity>>? byGenre,
  }) {
    return HomeState(
      status: status ?? this.status,
      byGenre: byGenre ?? this.byGenre,
    );
  }

  @override
  List<Object?> get props => [status, byGenre];
}
