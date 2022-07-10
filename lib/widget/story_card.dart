import 'package:cached_network_image/cached_network_image.dart';
import 'package:copy_facebook_ui/models/models.dart';
import 'package:copy_facebook_ui/widget/Profile_avatar.dart';
import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  StoryCard({
    Key? key,
    this.user,
    this.story,
    this.isUser = false,
  }) : super(key: key);
  final bool isUser;
  final User? user;
  final Story? story;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: isUser ? user!.imageUrl : story!.imageUrl,
            height: double.infinity,
            width: 110,
            fit: BoxFit.fill,
          ),
          Positioned(
            left: 8.0,
            top: 8.0,
            child: isUser
                ? Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => print("click add"),
                    ),
                  )
                : ProfileAvatar(
                    imagerUrl: story?.user.imageUrl,
                    size: 40,
                    isBorder: !story!.isViewed,
                  ),
          ),
          Positioned(
            left: 8.0,
            right: 8.0,
            bottom: 8.0,
            child: Text(
              isUser ? "Add to Story" : story!.user.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
