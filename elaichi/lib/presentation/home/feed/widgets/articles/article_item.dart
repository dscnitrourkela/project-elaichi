import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaichi/presentation/core/utils/sizeconfig.dart';
import 'package:elaichi/presentation/core/utils/strings.dart';
import 'package:elaichi/presentation/core/utils/third_party_services.dart';
import 'package:elaichi/presentation/home/feed/bloc/feed_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

/// MM Article Card
class MMArticleCard extends StatelessWidget {
  /// Default Constructor
  const MMArticleCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, FeedState>(
      bloc: context.read<FeedBloc>(),
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(
            right: SizeConfig.safeBlockHorizontal! * 4,
          ),
          width: SizeConfig.screenWidth! * 0.7,
          child: state.maybeWhen(
            orElse: () {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              );
            },
            success: (webMailState, data) {
              return GestureDetector(
                onTap: () => ThirdPartyServices().launchUrl(
                  'https://mondaymorning.nitrkl.ac.in/article/${data[index].id}',
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Opacity(
                        opacity: 0.9,
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://ik.imagekit.io/adamantiumA${data[index].imageUrl}',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => Image.asset(
                            Strings.kNitrImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: SizeConfig.safeBlockVertical! * 13,
                        left: SizeConfig.safeBlockHorizontal! * 4,
                        child: SizedBox(
                          width: SizeConfig.safeBlockHorizontal! * 50,
                          child: Text(
                            data[index].title,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
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
            },
          ),
        );
      },
    );
  }
}
