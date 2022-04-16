import 'package:bloc/bloc.dart';
import 'package:gawla/models/data_model.dart';
import 'package:gawla/models/tour_model.dart';
import 'package:gawla/services/data_services.dart';

import 'cubit_states.dart';

class Cubits extends Cubit<CubitStates> {
  //what's written between "<>" is what will be listened to by the cubit
  Cubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState()); //once initail state is done, emit new state
  } //Cubits parameters declaration are those of the InitialState()

  final DataServices data;
  late final tourCreators;
  late final tours;
  late final tourCreator;

  void getData()async {
    try {
      emit(LoadingState());//show loading state
      tourCreators = await data.getTourguideInfo();//during this try to load data
      tours = await data.getTourInfo();
      emit(LoadedState(tourCreators,tours));//once data loaded, trigger the loaded state with the new updated data
    } catch (e) {}
  }
  detailPage(DataModel tourCreators,TourModel tour){
    emit(DetailState(tourCreators, tour));
  }
  goHome(){
    emit(LoadedState(tourCreators, tours));
  }

  profilePage(DataModel tourCreator){
    emit(ProfileState(tourCreator));
  }
  goProfile(){
    emit(ProfileState(tourCreator));
  }
  contactPage(DataModel tourCreator){
    emit(ContactState(tourCreator));
  }
  settingsPage(DataModel tourCreator){
    emit(SettingsState(tourCreator));
  }
}