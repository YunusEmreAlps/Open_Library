// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

// Project imports:
import 'package:book_app/components/download_alert.dart';
import 'package:book_app/database/download_helper.dart';
import 'package:book_app/database/favorite_helper.dart';
import 'package:book_app/models/category.dart';
import 'package:book_app/util/api.dart';
import 'package:book_app/util/consts.dart';
import '../models/category.dart';

class DetailsProvider extends ChangeNotifier {
  CategoryFeed related = CategoryFeed();
  bool loading = true;
  Entry entry;
  var favDB = FavoriteDB();
  var dlDB = DownloadsDB();

  bool faved = false;
  bool downloaded = false;
  Api api = Api();

  getFeed(String url) async {
    setLoading(true);
    checkFav();
    checkDownload();
    try {
      CategoryFeed feed = await api.getCategory(url);
      setRelated(feed);
      setLoading(false);
    } catch (e) {
      throw (e);
    }
  }

  // check if book is favorited
  checkFav() async {
    List c = await favDB.check({'id': entry.id.t.toString()});
    if (c.isNotEmpty) {
      setFaved(true);
    } else {
      setFaved(false);
    }
  }

  addFav() async {
    await favDB.add({'id': entry.id.t.toString(), 'item': entry.toJson()});
    checkFav();
  }

  removeFav() async {
    favDB.remove({'id': entry.id.t.toString()}).then((v) {
      print(v);
      checkFav();
    });
  }

  // check if book has been downloaded before
  checkDownload() async {
    List downloads = await dlDB.check({'id': entry.id.t.toString()});
    if (downloads.isNotEmpty) {
      // check if book has been deleted
      String path = downloads[0]['path'];
      print(path);
      if(await File(path).exists()){
        setDownloaded(true);
      }else{
        setDownloaded(false);
      }
    } else {
      setDownloaded(false);
    }
  }

  Future<List> getDownload() async {
    List c = await dlDB.check({'id': entry.id.t.toString()});
    return c;
  }

  addDownload(Map body) async {
    await dlDB.removeAllWithId({'id': entry.id.t.toString()});
    await dlDB.add(body);
    checkDownload();
  }

  removeDownload() async {
    dlDB.remove({'id': entry.id.t.toString()}).then((v) {
      print(v);
      checkDownload();
    });
  }

  Future downloadFile(BuildContext context, String url, String filename) async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);

    if (permission != PermissionStatus.granted) {
      await PermissionHandler().requestPermissions([PermissionGroup.storage]);
      startDownload(context, url, filename);
    } else {
      startDownload(context, url, filename);
    }
  }

  startDownload(BuildContext context, String url, String filename) async {
    Directory appDocDir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    if (Platform.isAndroid) {
      Directory(appDocDir.path.split('Android')[0] + '${Constants.appName}')
          .createSync();
    }

    String path = Platform.isIOS
        ? appDocDir.path + '/$filename.epub'
        : appDocDir.path.split('Android')[0] +
            '${Constants.appName}/$filename.epub';
    print(path);
    File file = File(path);
    if (!await file.exists()) {
      await file.create();
    } else {
      await file.delete();
      await file.create();
    }

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => DownloadAlert(
        url: url,
        path: path,
      ),
    ).then((v) {
      // When the download finishes, we then add the book
      // to our local database
      if (v != null) {
        addDownload(
          {
            'id': entry.id.t.toString(),
            'path': path,
            'image': '${entry.link[1].href}',
            'size': v,
            'name': entry.title.t,
          },
        );
      }
    });
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  void setRelated(value) {
    related = value;
    notifyListeners();
  }

  CategoryFeed getRelated() {
    return related;
  }

  void setEntry(value) {
    entry = value;
    notifyListeners();
  }

  void setFaved(value) {
    faved = value;
    notifyListeners();
  }

  void setDownloaded(value) {
    downloaded = value;
    notifyListeners();
  }
}
