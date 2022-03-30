import 'package:bloc/bloc.dart';
import 'package:gawla/services/data_services.dart';

import 'cubit_states.dart';

class Cubits extends Cubit<CubitStates> {
  //what's written between "<>" is what will be listened to by the cubit
  Cubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState()); //once initail state is done, emit new state
  } //Cubits parameters declaration are those of the InitialState()

  final DataServices data;
  late final places;

  void getData()async {
    try {
      emit(LoadingState());//show loading state
      places = await data.getInfo();//during this try to load data
      emit(LoadedState(places));//once data loaded, trigger the loaded state with the new updated data
    } catch (e) {}
  }
}