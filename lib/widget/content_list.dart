import 'package:flutter/material.dart';
import 'package:netflix_clone/models/content_model.dart';

class ContentList extends StatelessWidget {
  const ContentList(
      {Key? key,
      required this.title,
      required this.contentList,
      this.isOriginals = false})
      : super(key: key);

  final String title;
  final List<Content> contentList;
  final bool isOriginals;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            height: isOriginals ? 500 : 220,
            child: ListView.builder(
              itemCount: contentList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                final Content content = contentList[index];
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(
                        left: index == 0 ? 8 : 16,
                        right: index == contentList.length - 1 ? 16 : 0),
                    height: isOriginals ? 400 : 200,
                    width: isOriginals ? 200 : 130,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(content.imageUrl),
                          fit: BoxFit.cover),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
