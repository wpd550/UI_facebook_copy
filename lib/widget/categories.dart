import 'package:flutter/material.dart';

class LiveCategraies extends StatelessWidget {
  const LiveCategraies({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.videocam,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 8,
                ),
                Text('Live'),
              ],
            ),
          ),
          const VerticalDivider(
            width: 8.0,
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.photo_library,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 8,
                ),
                Text('Photo'),
              ],
            ),
          ),
          VerticalDivider(
            width: 8.0,
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.video_call,
                  color: Colors.purpleAccent,
                ),
                SizedBox(
                  width: 8,
                ),
                Text('Room'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
