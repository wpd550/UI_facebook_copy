import 'package:copy_facebook_ui/models/models.dart';
import 'package:copy_facebook_ui/widget/widgets.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  const Stories({
    Key? key,
    required this.currentUser,
    required this.storyList,
  }) : super(key: key);
  final User currentUser;
  final List<Story> storyList;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: StoryCard(
                user: currentUser,
                isUser: true,
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: StoryCard(
              story: storyList[index - 1],
            ),
          );
        },
        itemCount: storyList.length + 1,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
