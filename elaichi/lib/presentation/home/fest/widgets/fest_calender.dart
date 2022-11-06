// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/home/fest/widgets/speaker_widget.dart';
import 'package:flutter/material.dart';

class CalenderTabView extends StatelessWidget {
  const CalenderTabView({
    Key? key,
    required TabController tabController,
    required this.calender,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  final Map<String, List<Event>> calender;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          unselectedLabelStyle: robotoTextTheme.bodyText1!.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.grey11,
          ),
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.white,
          padding: const EdgeInsets.only(bottom: 8),
          isScrollable: calender.length > 3 ? true : false,
          tabs: List.generate(
            calender.keys.toList().length,
            (index) => Tab(
              child: Text(
                calender.keys.toList()[index],
                style: robotoTextTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 500,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TabBarView(
              controller: _tabController,
              children: List.generate(
                calender.length,
                (index) {
                  final list = calender.values.toList()[index];
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final itemList = list[index];
                      return Expanded(
                        child: CalenderItem(
                          name: json.decode(itemList.name)['heading'] as String,
                          endDate: itemList.endDate,
                          startDate: itemList.startDate,
                          type: itemList.type!,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CalenderItem extends StatelessWidget {
  const CalenderItem({
    Key? key,
    required this.name,
    required this.type,
    required this.startDate,
    required this.endDate,
    this.image,
    this.speakerName,
  }) : super(key: key);

  final String name;
  final String type;
  final DateTime startDate;
  final DateTime endDate;
  final String? image;
  final String? speakerName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      height: image != null ? 97 : 67,
      width: 326,
      decoration: BoxDecoration(
        color: AppColors.grey9.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type,
                style: robotoTextTheme.bodyText1!.copyWith(
                  color:
                      image != null ? AppColors.teal : AppColors.yellowButton,
                  fontSize: 11,
                  letterSpacing: 0.07,
                ),
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: 200,
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: robotoTextTheme.bodyText1!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (image != null) const SizedBox(height: 4),
              if (image != null && speakerName != null)
                SpeakerInfo(
                  imageUrl:
                      'https://res.cloudinary.com/dvkroz7wz/image/upload/v1667122918/SWW_1_vhkdpl.png',
                  name: speakerName!,
                  fontSize: 12,
                  height: 24,
                  width: 24,
                )
            ],
          ),
          Text(
            '${startDate.hour}:${startDate.minute.toString().padLeft(2, '0')} - ${endDate.hour}:${endDate.minute.toString().padLeft(2, '0')}',
            style: robotoTextTheme.overline!.copyWith(
              color: AppColors.grey10,
            ),
          )
        ],
      ),
    );
  }
}
