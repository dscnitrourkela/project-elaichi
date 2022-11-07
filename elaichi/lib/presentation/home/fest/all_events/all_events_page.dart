import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/presentation/components/buttons/back_button.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/event_type_map.dart';
import 'package:elaichi/presentation/core/utils/strings.dart';
import 'package:elaichi/presentation/home/fest/all_events/cubit/all_events_cubit.dart';
import 'package:elaichi/presentation/home/fest/widgets/low_priority_event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllEventsPage extends StatefulWidget {
  const AllEventsPage({Key? key, required this.events}) : super(key: key);

  final Map<String, Map<String, List<Event>>> events;

  @override
  State<AllEventsPage> createState() => _AllEventsPageState();
}

class _AllEventsPageState extends State<AllEventsPage> {
  late final AllEventsCubit _cubit;

  late final TextEditingController _controller;

  late List<Event> _allEvents;

  late int _length;

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.clear();
    _length = _controller.text.length;
    final events = widget.events['categorisedEvents']!['ALL']!;
    _controller.addListener(() {
      _length = _controller.text.length;

      _allEvents = events
          .where(
            (element) => element.name
                .toLowerCase()
                .contains(_controller.text.toLowerCase()),
          )
          .toList();
      setState(() {});
    });
    _cubit = AllEventsCubit();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => _cubit,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: BlocBuilder<AllEventsCubit, AllEventsState>(
              builder: (context, state) {
                return state.when(
                  initial: (selectedIndex) {
                    if (_length > 0) {
                      _cubit.selectChip(0);
                    }
                    final categorisedEvents =
                        widget.events['categorisedEvents'];
                    final list = _length == 0
                        ? categorisedEvents![
                            eventTypeMapping.keys.toList()[selectedIndex]]
                        : _allEvents;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomBackButton(),
                              const SizedBox(height: 16),
                              SizedBox(
                                height: 29,
                                child: Text(
                                  'All Events',
                                  style: interTextTheme.headline2,
                                ),
                              ),
                              const SizedBox(height: 16),
                              SearchBox(controller: _controller),
                              const SizedBox(height: 16),
                              SizedBox(
                                height: 34,
                                width: 358,
                                child: Filters(controller: _controller),
                              ),
                              const SizedBox(height: 32),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          height: 1,
                          color: AppColors.white2,
                        ),
                        const SizedBox(height: 32),
                        ...List.generate(
                          list!.length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                LowPriorityEventItem(
                                  fullWidth: true,
                                  event: list[index],
                                ),
                                const SizedBox(height: 16)
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class Filters extends StatelessWidget {
  const Filters({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final eventTypes = eventTypeMapping.values.toList();
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: eventTypes.length,
      itemBuilder: (context, index) {
        return BlocBuilder<AllEventsCubit, AllEventsState>(
          builder: (context, state) {
            return state.when(
              initial: (selectedIndex) => GestureDetector(
                onTap: () {
                  controller.clear();
                  context.read<AllEventsCubit>().selectChip(index);
                },
                child: CustomChip(
                  name: eventTypes[index],
                  enabled: selectedIndex == index ? true : false,
                ),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 16),
    );
  }
}

class CustomChip extends StatelessWidget {
  const CustomChip({
    Key? key,
    required this.name,
    required this.enabled,
  }) : super(key: key);

  final String name;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.4)),
        color: enabled ? Colors.white : Colors.black,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Text(
        name,
        style: interTextTheme.bodyText2!
            .copyWith(color: enabled ? Colors.black : Colors.white),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 358,
      color: AppColors.grey14,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        style: interTextTheme.bodyText2!.copyWith(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: AppColors.grey15,
          prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child:
                  SvgPicture.asset(Strings.searchIcon, height: 18, width: 18)),
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          hintText: 'Search for any event',
          hintStyle:
              interTextTheme.bodyText2!.copyWith(color: AppColors.grey15),
        ),
        controller: controller,
      ),
    );
  }
}
