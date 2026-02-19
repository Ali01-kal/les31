import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/home/domain/entity/movie_entity.dart';


part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeStarted>(_onStarted);
  }

  Future<void> _onStarted(HomeStarted e, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));

    try {
      // MOCK DATA (жанр бойынша)
      const byGenre = <String, List<MovieEntity>>{
        'Action': [
          MovieEntity(
            id: 1,
            title: 'Action One',
            bannerUrl: 'https://picsum.photos/seed/a1/900/500',
            genre: 'Action',
            overview: 'Explosive action movie about heroes and villains.',
            rating: 7.8,
          ),
          MovieEntity(
            id: 2,
            title: 'Action Two',
            bannerUrl: 'https://picsum.photos/seed/a2/900/500',
            genre: 'Action',
            overview: 'Fast chase scenes and big fights.',
            rating: 7.2,
          ),
        ],
        'Comedy': [
          MovieEntity(
            id: 11,
            title: 'Comedy One',
            bannerUrl: 'https://picsum.photos/seed/c1/900/500',
            genre: 'Comedy',
            overview: 'A funny story that makes you smile.',
            rating: 7.1,
          ),
          MovieEntity(
            id: 12,
            title: 'Comedy Two',
            bannerUrl: 'https://picsum.photos/seed/c2/900/500',
            genre: 'Comedy',
            overview: 'More jokes, more chaos.',
            rating: 6.9,
          ),
        ],
        'Drama': [
          MovieEntity(
            id: 21,
            title: 'Drama One',
            bannerUrl: 'https://picsum.photos/seed/d1/900/500',
            genre: 'Drama',
            overview: 'Deep emotional drama with strong characters.',
            rating: 8.2,
          ),
          MovieEntity(
            id: 22,
            title: 'Drama Two',
            bannerUrl: 'https://picsum.photos/seed/d2/900/500',
            genre: 'Drama',
            overview: 'Life choices and consequences.',
            rating: 7.9,
          ),
        ],
      };

      emit(state.copyWith(
        status: HomeStatus.success,
        byGenre: byGenre,
      ));
    } catch (_) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}
