import 'package:flutter/material.dart';
import 'package:flutter_portfolio/features/home/data/model/home_model.dart';

@immutable
class HomeState {
  final HomeData data;
  final bool isLoading;

  const HomeState({required this.data, this.isLoading = true});

  HomeState copyWith({HomeData? newData, bool? newLoadingState}) => HomeState(
        data: newData ?? data,
        isLoading: newLoadingState ?? isLoading,
      );
}
