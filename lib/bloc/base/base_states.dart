import 'package:equatable/equatable.dart';

//created on 25/09/2021
//purpose : base states access to other state classes
abstract class BaseState extends Equatable {
  const BaseState();
}

class InitialState extends BaseState {
  @override
  List<Object> get props => [];
}

class LoadingState extends BaseState {
  final bool isLoading;

  const LoadingState({this.isLoading = true});

  @override
  List<Object> get props => [isLoading];
}

class SuccessState extends BaseState {
  const SuccessState({this.data});

  final dynamic data;

  @override
  List<Object> get props => <Object>[data];
}

class FailedState extends BaseState {
  const FailedState({this.msg});

  final String? msg;

  @override
  List<Object> get props => <Object>[msg!];
}
