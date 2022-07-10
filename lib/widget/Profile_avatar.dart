import 'package:cached_network_image/cached_network_image.dart';
import 'package:copy_facebook_ui/config/palette.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String? imagerUrl;
  final int size;
  final bool isActive;
  final bool isBorder;
  const ProfileAvatar(
      {Key? key,
      required this.imagerUrl,
      required this.size,
      this.isActive = false,
      this.isBorder = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CircleAvatar(
        radius: 20,
        backgroundColor: Colors.blueAccent,
        child: CircleAvatar(
          radius: isBorder ? 18 : 20,
          backgroundColor: Colors.grey[200],
          backgroundImage: CachedNetworkImageProvider(imagerUrl!),
        ),
      ),
      isActive
          ? Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Palette.online,
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : const SizedBox.shrink(),
    ]);
  }
}
