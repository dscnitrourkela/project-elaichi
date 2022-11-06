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
      initialChildSize: 0.400,
      minChildSize: 0.400,
      builder: (context, scrollController) => SizedBox(
        width: SizeConfig.screenWidth,
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
