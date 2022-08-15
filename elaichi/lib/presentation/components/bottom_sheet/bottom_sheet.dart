import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    this.icon,
    required this.title,
    required this.body,
    required this.footer,
    this.description,
    Key? key,
  }) : super(key: key);
  final Widget? icon;
  final String title;
  final String? description;
  final Widget footer;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Row(
                children: <Widget>[
                  if (icon != null) icon!,
                  if (icon != null)
                    const SizedBox(
                      width: 16,
                    ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            title,
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.grey2,
                                    ),
                          ),
                          if (description != null)
                            Text(
                              description!,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: AppColors.grey,
              height: 1,
              thickness: 1,
            ),
            body,
            footer,
          ],
        ),
      ),
    );
  }
}
