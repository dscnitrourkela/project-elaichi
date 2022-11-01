import 'package:elaichi/presentation/core/utils/sizeconfig.dart';
import 'package:flutter/material.dart';

class CustomDraggableSheet extends StatelessWidget {
  const CustomDraggableSheet({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.365,
      minChildSize: 0.365,
      builder: (context, scrollController) => SizedBox(
        width: SizeConfig.screenWidth,
        height: 300,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 17.5,
              vertical: 20,
            ),
            child: Column(
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
