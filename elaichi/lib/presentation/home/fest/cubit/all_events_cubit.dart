import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_events_state.dart';
part 'all_events_cubit.freezed.dart';

class AllEventsCubit extends Cubit<AllEventsState> {
  AllEventsCubit() : super(const AllEventsState.initial());

  void selectChip(int index) =>
      emit(AllEventsState.initial(selectedIndex: index));
}
