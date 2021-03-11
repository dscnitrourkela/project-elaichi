import 'package:easy_localization/easy_localization.dart';
import 'package:elaichi/datamodels.dart';
import 'package:elaichi/src/ui/views/event/view_event_viewmodel.dart';
import 'package:elaichi/theme.dart';
import 'package:elaichi/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:stacked/stacked.dart';

/// View for a single event
class ViewEvent extends StatelessWidget {
  /// Constructor for ViewEvent
  const ViewEvent({Key key, this.event}) : super(key: key);

  /// Stores the event object passed from any screen
  final Event event;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewEventViewModel>.reactive(
      builder:
          (BuildContext context, ViewEventViewModel viewModel, Widget child) {
        return viewModel.isBusy
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                backgroundColor: AppColors.lightScaffoldBackground,
                appBar: AppBar(
                  automaticallyImplyLeading: true,
                  backgroundColor: AppColors.lightScaffoldBackground,
                  elevation: 0,
                  title: Text(
                    viewModel.event.eventName,
                    style:
                        TextStyles.heading1.copyWith(color: AppColors.bodyText),
                  ),
                  centerTitle: false,
                  actions: [
                    const Padding(
                      padding: EdgeInsets.only(right: 18.0),
                      child: Icon(
                        Icons.share,
                        color: AppColors.overlineText,
                      ),
                    )
                  ],
                ),
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 368 / 520,
                        child: Stack(
                          children: [
                            Center(child: Image.asset(viewModel.event.picture)),
                            Align(
                              child: PortalEntry(
                                child: InterestedButton(
                                  onTap: viewModel.toggleDialog,
                                ),
                                visible: viewModel.showDialog,
                                portalAnchor: Alignment.bottomCenter,
                                childAnchor: Alignment.topCenter,
                                portal: InterestedPopup(
                                    viewModel.event.startDateTime),
                              ),
                              alignment: Alignment.bottomCenter,
                            ),
                          ],
                        ),
                      ),
                      InfoCard(
                        title: 'Contact Details',
                        child: ContactCard(
                          contacts: viewModel.event.organizer.contactInfo,
                        ),
                      ),
                      EventDescription(viewModel.event)
                    ],
                  ),
                ),
              );
      },
      viewModelBuilder: () => ViewEventViewModel(),
      onModelReady: (ViewEventViewModel model) => model.init(event),
    );
  }
}
