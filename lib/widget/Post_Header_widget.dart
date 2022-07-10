import 'package:flutter/material.dart';

import '../models/post_model.dart';
import 'Profile_avatar.dart';

class PostHeaderWidget extends StatelessWidget {
  const PostHeaderWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imagerUrl: post.user.imageUrl, size: 40),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo}・',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
            onPressed: () => print('click more'), icon: Icon(Icons.more_horiz))
      ],
    );
  }
}
