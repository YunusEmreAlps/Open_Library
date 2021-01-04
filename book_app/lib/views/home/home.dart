// HomePage
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:book_app/util/consts.dart';
import 'package:book_app/util/router.dart';
import 'package:book_app/models/category.dart';
import 'package:book_app/views/genre/genre.dart';
import 'package:book_app/components/book_card.dart';
import 'package:book_app/components/body_builder.dart';
import 'package:book_app/components/book_list_item.dart';
import 'package:book_app/view_models/home_provider.dart';

import 'package:book_app/size_config.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  // By default our first item will be selected
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => Provider.of<HomeProvider>(context, listen: false).getFeeds(),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<HomeProvider>(
      builder: (BuildContext context, HomeProvider homeProvider, Widget child) {
        SizeConfig().init(context);
        return Scaffold(
          appBar: buildAppBar(),
          body: _buildBody(homeProvider),
        );
      },
    );
  }

  // App Bar
  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        '${Constants.appName}'.toUpperCase(),
        style: TextStyle(
          fontSize: SizeConfig.defaultSize * 2.4, // 24
          fontFamily: 'NexaLight',
          letterSpacing: 2,
        ),
      ),
    );
  }

  Widget _buildBody(HomeProvider homeProvider) {
    return BodyBuilder(
      apiRequestStatus: homeProvider.apiRequestStatus,
      child: _buildBodyList(homeProvider),
      reload: () => homeProvider.getFeeds(),
    );
  }

  Widget _buildBodyList(HomeProvider homeProvider) {
    return RefreshIndicator(
      onRefresh: () => homeProvider.getFeeds(),
      child: ListView(
        children: <Widget>[
          // Categories
          _buildGenreSection(homeProvider),
          SizedBox(height: 20.0),

          // Most Popular
          _buildSectionTitle('Most Popular'),
          SizedBox(height: 10.0),
          _buildFeaturedSection(homeProvider),
          SizedBox(height: 20.0),

          // New Releases
          _buildSectionTitle('New Releases'),
          SizedBox(height: 10.0),
          _buildNewSection(homeProvider),
        ],
      ),
    );
  }

  // style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500,),
  _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$title',
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  _buildFeaturedSection(HomeProvider homeProvider) {
    return Container(
      height: 200.0,
      child: Center(
        child: ListView.builder(
          primary: false,
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          scrollDirection: Axis.horizontal,
          itemCount: homeProvider?.top?.feed?.entry?.length ?? 0,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            Entry entry = homeProvider.top.feed.entry[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
              child: BookCard(
                img: entry.link[1].href,
                entry: entry,
              ),
            );
          },
        ),
      ),
    );
  }

  _buildGenreSection(HomeProvider homeProvider) {
    return Container(
      height: 50.0,
      child: Center(
        child: ListView.builder(
          primary: false,
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          scrollDirection: Axis.horizontal,
          itemCount: homeProvider?.top?.feed?.link?.length ?? 0,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            Link link = homeProvider.top.feed.link[index];

            // We don't need the tags from 0-9 because
            // they are not categories
            if (index < 10) {
              return SizedBox();
            }

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  onTap: () {
                    MyRouter.pushPage(
                      context,
                      Genre(
                        title: '${link.title}',
                        url: link.href,
                      ),
                    );
                  },
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        '${link.title}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _buildNewSection(HomeProvider homeProvider) {
    return ListView.builder(
      primary: false,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: homeProvider?.recent?.feed?.entry?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        Entry entry = homeProvider.recent.feed.entry[index];

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          child: BookListItem(
            img: entry.link[1].href,
            title: entry.title.t,
            author: entry.author.name.t,
            desc: entry.summary.t,
            entry: entry,
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
