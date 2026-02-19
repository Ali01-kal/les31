import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../home/domain/entity/movie_entity.dart';

class FavoritesCache {
  FavoritesCache(this._prefs);
  final SharedPreferences _prefs;

  static const _key = 'favorites_movies';

  List<MovieEntity> load() {
    final raw = _prefs.getString(_key);
    if (raw == null || raw.isEmpty) return [];
    final list = (jsonDecode(raw) as List).cast<Map<String, dynamic>>();
    return list.map(MovieEntity.fromJson).toList();
  }

  Future<void> save(List<MovieEntity> movies) async {
    final raw = jsonEncode(movies.map((e) => e.toJson()).toList());
    await _prefs.setString(_key, raw);
  }

  Future<bool> isFavorite(int id) async {
    final list = load();
    return list.any((m) => m.id == id);
  }

  Future<void> toggle(MovieEntity movie) async {
    final list = load();
    final exists = list.any((m) => m.id == movie.id);
    if (exists) {
      list.removeWhere((m) => m.id == movie.id);
    } else {
      list.add(movie);
    }
    await save(list);
  }
}
