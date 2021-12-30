// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:book_app/components/body_builder.dart';
import 'package:book_app/components/book.dart';
import 'package:book_app/components/book_card.dart';
import 'package:book_app/components/book_list_item.dart';
import 'package:book_app/components/loading_widget.dart';
import 'package:book_app/models/category.dart';
import 'package:book_app/size_config.dart';
import 'package:book_app/util/api.dart';
import 'package:book_app/util/router.dart';
import 'package:book_app/view_models/home_provider.dart';
import 'package:book_app/views/genre/genre.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  Api api = Api();

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (BuildContext context, HomeProvider homeProvider, Widget child) {
        SizeConfig().init(context);
        return Scaffold(
          appBar: buildAppBar(),
          body: BodyBuilder(
            apiRequestStatus: homeProvider.apiRequestStatus,
            child: _buildBodyList(homeProvider),
            reload: () => homeProvider.getFeeds(),
          ),
        );
      },
    );
  }

  // App Bar
  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Explore'.toUpperCase(),
        style: TextStyle(
          fontSize: SizeConfig.defaultSize * 2.4, // 24
          fontFamily: 'NexaLight',
          letterSpacing: 2,
        ),
      ),
    );
  }

  _buildBodyList(HomeProvider homeProvider) {
    return ListView.builder(
      itemCount: homeProvider?.top?.feed?.link?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        Link link = homeProvider.top.feed.link[index];

        if (index < 10) {
          return SizedBox();
        }

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: <Widget>[
              _buildSectionHeader(link),
              SizedBox(height: 10.0),
              _buildSectionBookList(link),
            ],
          ),
        );
      },
    );
  }

  _buildSectionHeader(Link link) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Text(
              '${link.title}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GestureDetector(
            onTap: () {
              MyRouter.pushPage(
                context,
                Genre(
                  title: '${link.title}',
                  url: link.href,
                ),
              );
            },
            child: Text(
              'See All',
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildSectionBookList(Link link) {
    return FutureBuilder<CategoryFeed>(
      future: api.getCategory(link.href),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          CategoryFeed category = snapshot.data;

          return Container(
            height: 200.0,
            child: Center(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                scrollDirection: Axis.horizontal,
                itemCount: category.feed.entry.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  Entry entry = category.feed.entry[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.0,
                      vertical: 10.0,
                    ),
                    child: BookCard(
                      img: entry.link[1].href,
                      entry: entry,
                    ),
                  );
                },
              ),
            ),
          );
        } else {
          return Container(
            height: 200.0,
            child: LoadingWidget(),
          );
        }
      },
    );
  }
}
