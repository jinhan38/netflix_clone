import 'package:flutter/material.dart';
import 'package:netflix_clone/cubits/app_bar/app_bar_cubit.dart';
import 'package:netflix_clone/data/data.dart';
import 'package:netflix_clone/widget/content_header.dart';
import 'package:netflix_clone/widget/content_list.dart';
import 'package:netflix_clone/widget/custom_app_bar.dart';
import 'package:netflix_clone/widget/previews.dart';

class HomeScreen extends StatefulWidget {
  //Key 파라미터에 PageStorageKey 클래스로 값을 받으면 BottomNav로 페이지를 변환해도
  //다시 렌더링을 하지 않는다(초기화를 하지 않는다)
  //그래서 스크롤한 위치 그대로의 화면을 다시 보여줄 수 있다
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // double _scrollOffset = 0.0;

  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
        context.bloc<AppBarCubit>();
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        child: const Icon(Icons.cast),
        onPressed: () {},
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50),
        child: CustomAppBar(
          scrollOffset: _scrollOffset,
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(featureContent: sintelContent),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 20),
            sliver: SliverToBoxAdapter(
              child: Previews(
                key: PageStorageKey('previews'),
                title: "Previews",
                contentList: previews,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: ContentList(
                  key: PageStorageKey('myList'),
                  title: "MyList",
                  contentList: myList)),
          SliverToBoxAdapter(
              child: ContentList(
                  key: PageStorageKey('originals'),
                  title: "Netflix Originals",
                  contentList: originals,
                  isOriginals: true)),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 20),
            sliver: SliverToBoxAdapter(
                child: ContentList(
                    key: PageStorageKey('trending'),title: "Trending", contentList: trending)),
          ),
        ],
      ),
    );
  }
}
