import 'package:cached_network_image/cached_network_image.dart';
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
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, FeedState>(
      bloc: context.read<FeedBloc>(),
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(
            right: 12,
          ),
          width: 240,
          height: 180,
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
            initial: (webMailState, data) {
              return GestureDetector(
                onTap: () => ThirdPartyServices().launchUrl(
                  '${Strings.mmArticleLink}${data[index].id}',
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
                              '${Strings.mmImageKit}${data[index].imageUrl}',
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
                        top: 90,
                        left: 20,
                        child: SizedBox(
                          width: 200,
                          child: Text(
                            data[index].title,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.titleLarge!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ),
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
