import 'package:copy_facebook_ui/config/palette.dart';
import 'package:copy_facebook_ui/models/user_model.dart';
import 'package:copy_facebook_ui/widget/Profile_avatar.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  const Rooms({Key? key, required this.onlineUsers}) : super(key: key);
  final List<User> onlineUsers;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: BuildCreatRoomButton(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              child: ProfileAvatar(
                imagerUrl: onlineUsers[index - 1].imageUrl,
                size: 30,
                isActive: true,
              ),
            );
          }
        },
        itemCount: onlineUsers.length + 1,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  OutlinedButton BuildCreatRoomButton() {
    return OutlinedButton(
        onPressed: () => print("Create clicked"),
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          side: const BorderSide(
            width: 3,
            color: Colors.blueAccent,
          ),
        ),
        child: Row(
          children: [
            ShaderMask(
              shaderCallback: (rect) =>
                  Palette.createRoomGradient.createShader(rect),
              child: const Icon(
                Icons.video_call,
                color: Colors.red,
                size: 35,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            const Text(
              'Create\nRoom',
              style: TextStyle(color: Colors.blueAccent),
            ),
          ],
        ));
  }
}
