import 'package:equatable/equatable.dart';
import 'package:gawla/models/data_model.dart';
import 'package:gawla/models/tour_model.dart';

abstract class CubitStates extends Equatable{

}
class InitialState extends CubitStates{//every cubit app should have one initial state
  @override
  // TODO: implement props
  List<Object> get props => [];

}
class WelcomeState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];

}
class LoadingState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];

}class LoadedState extends CubitStates{
  LoadedState(this.tourCreators,this.tours);
  final List<DataModel> tourCreators;
  final List<TourModel> tours;

  @override
  // TODO: implement props
  List<Object> get props => [tourCreators,tours];

}class DetailState extends CubitStates{
  DetailState(this.tourCreator,this.tour);
  final DataModel tourCreator;
  final TourModel tour;

  @override
  // TODO: implement props
  List<Object> get props => [tourCreator,tour];

}