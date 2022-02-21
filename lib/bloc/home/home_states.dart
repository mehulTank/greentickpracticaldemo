import 'package:greentickpracticaldemo/bloc/base/base_states.dart';

//created on 30/09/2021
//purpose : base states access to other state classes
abstract class HomeState extends BaseState {
  const HomeState();
}

class HomeSuccess extends HomeState {
  const HomeSuccess();

  @override
  List<Object> get props => <Object>[];
}
