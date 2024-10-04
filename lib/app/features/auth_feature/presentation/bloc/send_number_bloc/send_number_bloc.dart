import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'send_number_event.dart';
part 'send_number_state.dart';

class SendNumberBloc extends Bloc<SendNumberEvent, SendNumberState> {
  SendNumberBloc() : super(SendNumberInitial()) {
    on<SendNumberEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
