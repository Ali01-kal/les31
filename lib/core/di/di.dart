import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/favorite/data/favorites_cache.dart';

final sl = GetIt.I;

Future<void> initDI() async {
  final prefs = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(prefs);

  sl.registerLazySingleton<FavoritesCache>(
    () => FavoritesCache(sl<SharedPreferences>()),
  );
}
