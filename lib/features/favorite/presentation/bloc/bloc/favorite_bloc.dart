import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/favorite/data/favorites_cache.dart';
import 'package:movie_app/features/home/domain/entity/movie_entity.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';


class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc(this._cache) : super(const FavoriteState()) {
    on<FavoritesLoaded>(_onLoad);
    on<FavoriteToggled>(_onToggle);
  }

  final FavoritesCache _cache;

  Future<void> _onLoad(FavoritesLoaded e, Emitter<FavoriteState> emit) async {
    emit(state.copyWith(status: FavoriteStatus.loading));
    try {
      final list = _cache.load();
      emit(state.copyWith(status: FavoriteStatus.success, movies: list));
    } catch (_) {
      emit(state.copyWith(status: FavoriteStatus.failure));
    }
  }

  Future<void> _onToggle(FavoriteToggled e, Emitter<FavoriteState> emit) async {
    await _cache.toggle(e.movie);
    add(FavoritesLoaded());
  }
}

