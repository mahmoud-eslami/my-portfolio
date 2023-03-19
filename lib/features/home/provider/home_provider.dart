import 'package:flutter_portfolio/features/home/data/model/home_state.dart';
import 'package:flutter_portfolio/features/home/data/repository/home_repository.dart';
import 'package:flutter_portfolio/features/home/provider/home_state_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/api/home_api.dart';

final homeApiProvider = Provider<HomeApi>(
  (ref) => HomeApi(),
);

final homeRepositoryProvider = Provider<HomeRepository>(
  (ref) => HomeRepository(
    ref.read(homeApiProvider),
  ),
);

final homeDataProvider = StateNotifierProvider<HomeDataNotifier, HomeState>(
  (ref) => HomeDataNotifier(
    ref.read(homeRepositoryProvider),
  ),
);
