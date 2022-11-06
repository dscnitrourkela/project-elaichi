import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'browse_bloc.freezed.dart';
part 'browse_event.dart';
part 'browse_state.dart';

class BrowseBloc extends Bloc<BrowseEvent, BrowseState> {
  BrowseBloc() : super(const _Loading()) {
    on<BrowseEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
