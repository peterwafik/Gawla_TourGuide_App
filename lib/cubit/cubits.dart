import 'package:bloc/bloc.dart';
import 'package:gawla/models/user_model.dart';
import 'package:gawla/models/tour_model.dart';
import 'package:gawla/pages/navPages/home_page.dart';
import 'package:gawla/services/data_services.dart';

import 'cubit_states.dart';

class Cubits extends Cubit<CubitStates> {
  final DataServices data;
  late final tourCreators;
  late final tours;
  late final tourCreator;
  //what's written between "<>" is what will be listened to by the cubit
  Cubits({required this.data}) : super(InitialState()) {
    getData(); //once initial state is done, emit new state
  } //Cubits parameters declaration are those of the InitialState()
  void getData()async {
    try {
      emit(LoadingState());//show loading state
      tourCreators = await data.getTourguideInfo();//during this try to load data
      tours = await data.getTourInfo();
      emit(LoadedState(tourCreators,tours));//once data loaded, trigger the loaded state with the new updated data
    } catch (e) {}
  }
  void postTourData()async{
    try {
    data.postTourInfo(
      //1001,
      "Peter Wafik",
      "cultural",
      "https://i0.wp.com/codigoespagueti.com/wp-content/uploads/2021/02/Tom-Holland-unico-Peter-Parker-Spider-Man.jpg?fit=1280%2C720&quality=80&ssl=1",
      2000,
      "This is just a test to see whether the posting process would succeed or not",
      "Cairo",
      30,
    );
    } catch (e) {
      print(e);
    }
  }
  void postCheckpointData()async{
    try {
      data.postCheckpointInfo(
        //1001,
        "Peter Wafik",
        "cultural",
        "https://i0.wp.com/codigoespagueti.com/wp-content/uploads/2021/02/Tom-Holland-unico-Peter-Parker-Spider-Man.jpg?fit=1280%2C720&quality=80&ssl=1",
        2000,
        "This is just a test to see whether the posting process would succeed or not",
        "Cairo",
        30,
      );
    } catch (e) {
      print(e);
    }
  }

  void getAuthData()async {
    try {
      emit(LoadingState());//show loading state
      emit(LoginState());//once data loaded, trigger the loaded state with the new updated data
    } catch (e) {}
  }
  void goCreateTour()async {
    try {
      emit(LoadingState());//show loading state
      emit(CreateTourState());//once data loaded, trigger the loaded state with the new updated data
    } catch (e) {}
  }
  void goCreateCheckpoint()async {
    try {
      emit(CheckpointState());//once data loaded, trigger the loaded state with the new updated data
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
  goContact(){
    emit(ContactState());
  }
  goNotification(){
    emit(NotificationState());
  }

  goLogin(){
    emit(LoginState());
  }
  goSignup(){
    emit(SignUpState());
  }

  settingsPage(DataModel tourCreator){
    emit(SettingsState(tourCreator));
  }



}