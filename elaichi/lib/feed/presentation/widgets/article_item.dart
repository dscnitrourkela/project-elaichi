import 'package:elaichi/app/utils/sizeconfig.dart';
import 'package:flutter/material.dart';

/// MM Article Card
class MMArticleCard extends StatelessWidget {
  /// Default Constructor
  const MMArticleCard({Key? key, this.title, this.imageUrl, this.onTapped})
      : super(key: key);

  /// Title of the news article
  final String? title;

  /// Image URL of the news article
  final String? imageUrl;

  /// Callback when the card is tapped
  final void Function()? onTapped;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal! * 4,
      ),
      width: SizeConfig.screenWidth! * 0.7,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Opacity(
              opacity: 0.9,
              child: Image.network(
                imageUrl.toString(),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Image.asset('assets/images/nitr.png', fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: SizeConfig.safeBlockVertical! * 13,
              left: SizeConfig.safeBlockHorizontal! * 4,
              child: SizedBox(
                width: SizeConfig.safeBlockHorizontal! * 50,
                child: Text(
                  title.toString(),
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
