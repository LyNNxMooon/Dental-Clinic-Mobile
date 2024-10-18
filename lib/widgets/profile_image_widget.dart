import 'package:cached_network_image/cached_network_image.dart';
import 'package:dental_clinic_mobile/constants/images.dart';
import 'package:dental_clinic_mobile/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(90)),
        child: CachedNetworkImage(
          imageUrl: img.isEmpty ? kPlaceHolderImage : img,
          fit: BoxFit.cover,
          placeholder: (context, url) => const LoadingWidget(),
          errorWidget: (context, url, error) => const Center(
            child: Icon(Icons.error),
          ),
        ));
  }
}
