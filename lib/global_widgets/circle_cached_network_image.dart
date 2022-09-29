import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:malina_app/global_widgets/loadingIndicator_widget.dart';

class CircleCachedNetworkImageWidget extends StatelessWidget {
  const CircleCachedNetworkImageWidget({
    Key? key,
    required this.imageUrl,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String? imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? 'https://avatars.mds.yandex.net/i?id=b6b0de530521e05e66a74e853aed96c6-5869993-images-thumbs&n=13',
      imageBuilder: (context, imageProvider) => SizedBox(
        width: width,
        height: height,
        child: CircleAvatar( 
          backgroundImage: imageProvider,
        ),
      ),
      placeholder: (context, url) => const LoadingIndicatorWidget(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
