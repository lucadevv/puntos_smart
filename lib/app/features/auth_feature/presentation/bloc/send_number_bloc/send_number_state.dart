part of 'send_number_bloc.dart';

sealed class SendNumberState extends Equatable {
  const SendNumberState();
  
  @override
  List<Object> get props => [];
}

final class SendNumberInitial extends SendNumberState {}
