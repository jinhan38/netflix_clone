import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  late final double scrollOffset;

  CustomAppBar({this.scrollOffset = 0.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      color: Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Row(
          children: [                                                                                                 
            Image.asset("assets/images/netflix_logo0.png"),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _AppBarButton(title: "TV Show", onTap: () => print("앱바 클릭")),
                  _AppBarButton(title: "Movies", onTap: () => print("앱바 클릭")),
                  _AppBarButton(title: "My List", onTap: () => print("앱바 클릭")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  const _AppBarButton({required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
