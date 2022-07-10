import 'package:cached_network_image/cached_network_image.dart';
import 'package:copy_facebook_ui/NetWork/http_client.dart';
import 'package:copy_facebook_ui/config/palette.dart';
import 'package:copy_facebook_ui/data/data.dart';
import 'package:copy_facebook_ui/models/post_model.dart';
import 'package:copy_facebook_ui/widget/rooms.dart';
import 'package:copy_facebook_ui/widget/widgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            backgroundColor: Colors.white,
            title: const Text(
              'Facebook',
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              CircleButton(
                data: Icons.search,
                iconSize: 30.0,
                press: () {
                  print('Click Search');
                  // Response response;
                  // response =
                  //     await Http.instance.dio.get("http://127.0.0.1:3000/");
                  // print(response.data.toString());
                },
              ),
              CircleButton(
                data: MdiIcons.facebookMessenger,
                iconSize: 30.0,
                press: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: PostContainer(currentUser: currentUser),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            sliver: SliverToBoxAdapter(
              child: Rooms(
                onlineUsers: onlineUsers,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            sliver: SliverToBoxAdapter(
              child: Stories(
                currentUser: currentUser,
                storyList: stories,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final Post post = posts[index];
              return PostWidget(
                post: post,
              );
            }, childCount: posts.length),
          ),
        ],
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
    required this.post,
  }) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PostHeaderWidget(post: post),
                const SizedBox(height: 4.0),
                Text(post.caption),
                post.imageUrl != null
                    ? const SizedBox.shrink()
                    : const SizedBox(
                        height: 6.0,
                      ),
              ],
            ),
          ),
          post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: CachedNetworkImage(imageUrl: post.imageUrl!),
                )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: _PostState(
              post: post,
            ),
          ),
        ],
      ),
    );
  }
}

class _PostState extends StatelessWidget {
  const _PostState({
    Key? key,
    required this.post,
  }) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Palette.facebookBlue,
              ),
              child: const Icon(
                Icons.thumb_up,
                color: Colors.white,
                size: 10,
              ),
            ),
            Expanded(child: Text('${post.likes}')),
            Text('${post.comments} comments'),
            const SizedBox(
              width: 8,
            ),
            Text('${post.shares} shares'),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _postButtom(
              onpress: () => print('click statesButtom'),
              label: 'likes',
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey[600],
                size: 20,
              ),
            ),
            _postButtom(
              onpress: () => print('click Comments'),
              label: 'Comments',
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
                size: 20,
              ),
            ),
            _postButtom(
              onpress: () => print('click shares'),
              label: 'shares',
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
                size: 25,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _postButtom extends StatelessWidget {
  const _postButtom(
      {Key? key,
      required this.onpress,
      required this.label,
      required this.icon})
      : super(key: key);

  final GestureTapCallback onpress;
  final String label;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onpress,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(
                  width: 8,
                ),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
