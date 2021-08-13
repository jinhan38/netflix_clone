import 'package:flutter/material.dart';
import 'package:netflix_clone/models/content_model.dart';
import 'package:netflix_clone/widget/vertical_icon_button.dart';

class ContentHeader extends StatelessWidget {
  late final Content? featureContent;

  ContentHeader({required this.featureContent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(featureContent!.imageUrl),
                  fit: BoxFit.cover)),
        ),
        Container(
          height: 500,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
          ),
        ),
        Positioned(
          bottom: 110,
          child: SizedBox(
            width: 200.0,
            child: Image.asset(featureContent!.titleImageUrl!),
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                icon: Icons.add,
                title: 'List',
                onTap: () => print("List"),
              ),
              _PlayButton(),
              VerticalIconButton(
                icon: Icons.info_outline,
                title: 'Info',
                onTap: () => print("Info"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {
          print("play");
        },
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(15, 5, 20, 5)),
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        label: const Text(
          "Play",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        icon: Icon(Icons.play_arrow, size: 30));
  }
}
