// Flutter imports:
import 'package:flutter/foundation.dart';

// Project imports:
import 'package:book_app/database/favorite_helper.dart';

class FavoritesProvider extends ChangeNotifier {
  List posts = List();
  bool loading = true;
  var db = FavoriteDB();

  getFavorites() async {
    setLoading(true);
    posts.clear();
    List all = await db.listAll();
    posts.addAll(all);
    setLoading(false);
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  void setPosts(value) {
    posts = value;
    notifyListeners();
  }

  List getPosts() {
    return posts;
  }
}
