import 'package:flutter/material.dart';
import 'package:netflix_clone/models/content_model.dart';

class Previews extends StatelessWidget {
  const Previews({Key? key, required this.title, required this.contentList})
      : super(key: key);

  final String title;
  final List<Content> contentList;

  @override
  Widget build(BuildContext context) {
    print("contentList.length : ${contentList.length}");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 165,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            scrollDirection: Axis.horizontal,
            itemCount: contentList.length,
            itemBuilder: (BuildContext context, int index) {
              Content content = contentList[index];
              return GestureDetector(
                onTap: () => print(content.name),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: index == 0 ? 8 : 16,
                          right: index == contentList.length - 1 ? 16 : 0),
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(content.imageUrl),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(color: content.color!, width: 4)),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: index == 0 ? 8 : 16,
                          right: index == contentList.length - 1 ? 16 : 0),
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black87,
                              Colors.black54,
                              Colors.transparent
                            ],
                            stops: [0, 0.25, 1],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(color: content.color!, width: 4)),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      left: 0,
                      child: SizedBox(
                        height: 60,
                        child: Image.asset(content.titleImageUrl!),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
