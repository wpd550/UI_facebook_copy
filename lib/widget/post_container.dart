import 'package:cached_network_image/cached_network_image.dart';
import 'package:copy_facebook_ui/models/user_model.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';

class PostContainer extends StatelessWidget {
  PostContainer({
    Key? key,
    required this.currentUser,
  }) : super(key: key);
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[200],
                backgroundImage:
                    CachedNetworkImageProvider(currentUser.imageUrl),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(child: Text("what\'s on your name?")),
            ],
          ),
          const Divider(
            height: 10,
            thickness: 0.5,
          ),
          const LiveCategraies(),
        ],
      ),
    );
  }
}
