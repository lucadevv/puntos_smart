part of 'module_bloc.dart';

sealed class ModuleEvent extends Equatable {
  const ModuleEvent();

  @override
  List<Object> get props => [];
}

class GetAllGeoPromotions extends ModuleEvent {}

class GetCategoriesPromotions extends ModuleEvent {
  final int idModule;

  const GetCategoriesPromotions({required this.idModule});
  @override
  List<Object> get props => [idModule];
}

class GetAllFlasPromotions extends ModuleEvent {}

class GetAllSurvers extends ModuleEvent {}
