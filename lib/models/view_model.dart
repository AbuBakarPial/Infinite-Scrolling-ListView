import 'package:flutter/foundation.dart';
import 'package:infinite_listview/models/model.dart';

class ViewModel extends ChangeNotifier {
  bool _isHomePageProcessing = true;
  int _currentPage = 1;
  List<PostModel> _postsList = [];
  bool _shouldRefresh = true;

  bool get shouldRefresh => _shouldRefresh;

  setShouldRefresh(bool value) => _shouldRefresh = value;

  int get currentPage => _currentPage;

  setCurrentPage(int page) {
    _currentPage = page;
  }

  bool get isHomePageProcessing => _isHomePageProcessing;

  setIsHomePageProcessing(bool value) {
    _isHomePageProcessing = value;
    notifyListeners();
  }

  List<PostModel> get postsList => _postsList;

  setPostsList(List<PostModel> list, {bool notify = true}) {
    _postsList = list;
    if (notify) notifyListeners();
  }

  mergePostsList(List<PostModel> list, {bool notify = true}) {
    _postsList.addAll(list);
    if (notify) notifyListeners();
  }

  addPost(PostModel post, {bool notify = true}) {
    _postsList.add(post);
    if (notify) notifyListeners();
  }

  PostModel getPostByIndex(int index) => _postsList[index];

  int get postsListLength => _postsList.length;
}
