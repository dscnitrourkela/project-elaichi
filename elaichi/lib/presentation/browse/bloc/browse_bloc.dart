import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'browse_event.dart';
part 'browse_state.dart';
part 'browse_bloc.freezed.dart';

class BrowseBloc extends Bloc<BrowseEvent, BrowseState> {
  BrowseBloc() : super(_Loading()) {
    on<BrowseEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
