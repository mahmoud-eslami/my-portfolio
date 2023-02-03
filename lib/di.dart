import 'package:flutter_portfolio/features/home/bloc/bloc/home_bloc.dart';
import 'package:flutter_portfolio/features/home/data/data_source/home_data_source.dart';
import 'package:flutter_portfolio/features/home/repository/home_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class DependencyInjection {
  static initializer() async {
    getIt.registerSingleton(HomeDataSource());
    getIt.registerSingleton(HomeRepository(getIt()));

    getIt.registerFactory<HomeBloc>(() => HomeBloc(getIt()));
  }
}
