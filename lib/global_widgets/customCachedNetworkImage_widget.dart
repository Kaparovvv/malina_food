
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/loadingIndicator_widget.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;
  final BorderRadius? borderRadius;
  const CustomCachedNetworkImage({
    Key? key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? 'https://avatars.mds.yandex.net/i?id=b6b0de530521e05e66a74e853aed96c6-5869993-images-thumbs&n=13',
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
      placeholder: (context, url) => const Center(
        child: LoadingIndicatorWidget(),
      ),
      errorWidget: (context, url, error) => SizedBox(
        width: 20.w,
        height: 20.h,
        child: Icon(
          Icons.error,
          color: ThemeHelper.crimson,
        ),
      ),
    );
  }
}