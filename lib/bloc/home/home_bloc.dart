import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:greentickpracticaldemo/bloc/home/home_event.dart';
import 'package:greentickpracticaldemo/data/repositories/product_list_repo.dart';


import 'bloc.dart';

///created on 30/09/2021
///purpose : to manage SearchVendor bloc state
class HomeBloc extends Bloc<HomeEvent, BaseState> {
  final ProductListRepository  productListRepository;

  HomeBloc({required this.productListRepository}) : super(InitialState());


  @override
  Stream<BaseState> mapEventToState(HomeEvent event) async* {
    if (event is SearchProductInitialise) {
      try {

        yield SuccessState();
      } catch (error) {
        yield FailedState(msg: error.toString());
      }
    }
  }
}
