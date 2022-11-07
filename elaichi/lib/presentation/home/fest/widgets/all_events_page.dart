import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/presentation/components/buttons/back_button.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/event_type_map.dart';
import 'package:elaichi/presentation/core/utils/strings.dart';
import 'package:elaichi/presentation/home/fest/cubit/all_events_cubit.dart';
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

  @override
  void initState() {
    _cubit = AllEventsCubit();
    super.initState();
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
                    final categorisedEvents =
                        widget.events['categorisedEvents'];
                    final list = categorisedEvents![
                        eventTypeMapping.keys.toList()[selectedIndex]];
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
                              const SearchBox(),
                              const SizedBox(height: 16),
                              const SizedBox(
                                height: 34,
                                width: 358,
                                child: Filters(),
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
                        const SizedBox(height: 56),
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

class Filters extends StatefulWidget {
  const Filters({
    Key? key,
  }) : super(key: key);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
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
                onTap: () => context.read<AllEventsCubit>().selectChip(index),
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
      height: 34,
      width: 100,
      child: Center(
        child: Text(
          name,
          style: interTextTheme.bodyText2!
              .copyWith(color: enabled ? Colors.black : Colors.white),
        ),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 358,
      color: AppColors.grey14,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      child: Row(
        children: [
          SvgPicture.asset(Strings.searchIcon, height: 18, width: 18),
          const SizedBox(width: 12),
          Text(
            'Search for any event',
            style: interTextTheme.bodyText2!.copyWith(color: AppColors.grey15),
          )
        ],
      ),
    );
  }
}
