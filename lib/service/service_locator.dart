
import 'package:get_it/get_it.dart';
import 'package:greentickpracticaldemo/bloc/base/base_repo.dart';
import 'package:greentickpracticaldemo/bloc/home/home_bloc.dart';
import 'package:greentickpracticaldemo/data/api/api_service.dart';
import 'package:greentickpracticaldemo/data/cache/cache_manager.dart';
import 'package:greentickpracticaldemo/data/repositories/product_list_repo.dart';
import 'package:greentickpracticaldemo/ui/router/app_router.dart';



GetIt locator = GetIt.instance;

void setupLocator() {

  locator.registerLazySingleton(() => AppRouter());



  // Repos
  locator.registerLazySingleton(() => BaseRepository());
  locator.registerLazySingleton(() => CacheManager());

  locator
      .registerLazySingleton(() => ProductListRepository(apiService: locator(),cacheManager: locator()));

  // Services
  locator.registerLazySingleton(() => APIService());

  // // Blocs
  locator.registerLazySingleton(
          () => HomeBloc(productListRepository: locator()));

}
