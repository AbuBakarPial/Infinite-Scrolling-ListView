import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:infinite_listview/network/api_service.dart';
import 'package:infinite_listview/models/model.dart';

import 'package:infinite_listview/models/view_model.dart';
import 'package:infinite_listview/pages/detailpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  _showSnackbar(String message, {required Color bgColor}) {
    // ignore: deprecated_member_use
    _globalKey.currentState!.showSnackBar(
      SnackBar(
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor:Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
      ),
    );
  }

  _hideSnackbar() {
    // ignore: deprecated_member_use
    _globalKey.currentState!.hideCurrentSnackBar();
  }

  _getPosts({bool refresh = true}) async {
    var provider = Provider.of<ViewModel>(context, listen: false);
    if (!provider.shouldRefresh) {
      _showSnackbar('No more to show.',
          bgColor: const Color.fromARGB(255, 241, 16, 16));
      return;
    }
    if (refresh) {
      _showSnackbar('Loading More...',
          bgColor: const Color.fromARGB(255, 27, 30, 39));
    }

    var postsResponse = await APIHelper.getPosts(
      limit: 20,
      page: provider.currentPage,
    );
    if (postsResponse.isSuccessful) {
      if (postsResponse.data.isNotEmpty) {
        if (refresh) {
          provider.mergePostsList(postsResponse.data, notify: false);
        } else {
          provider.setPostsList(postsResponse.data, notify: false);
        }
        provider.setCurrentPage(provider.currentPage + 1);
      } else {
        provider.setShouldRefresh(false);
      }
    } else {
      _showSnackbar(postsResponse.message, bgColor: Colors.black);
    }
    provider.setIsHomePageProcessing(false);
    _hideSnackbar();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        if (_scrollController.offset ==
            _scrollController.position.maxScrollExtent) {
          _getPosts();
        }
      }
    });
    _getPosts(refresh: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 19, 27),
      key: _globalKey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 18, 20, 31),
        elevation: 5,
        centerTitle: true,
        title: const Text('Authors Photo'),
      ),
      body: Consumer<ViewModel>(
        builder: (_, provider, __) => provider.isHomePageProcessing
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : provider.postsListLength > 0
                ? ListView.builder(
                    controller: _scrollController,
                    itemBuilder: (_, index) {
                      PostModel post = provider.getPostByIndex(index);
                      var colorme = Colors
                          .primaries[Random().nextInt(Colors.primaries.length)];
                      return Container(
                        margin: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: colorme,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(25.0),
                                bottomRight: Radius.circular(25.0))),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) =>
                                    DetailScreen(detailData: post),
                              ),
                            );
                          },
                          leading: CircleAvatar(
                            backgroundColor: Colors.primaries[
                                Random().nextInt(Colors.primaries.length)],
                            child: Text(
                              post.authorName[0],
                              style: const TextStyle(
                                color: Colors.white,
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                          ),
                          title: Text(post.authorName),
                          subtitle: Text(
                            "User: " + post.postId,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      );
                    },
                    itemCount: provider.postsListLength,
                  )
                : const Center(
                    child: Text('Nothing to show here!'),
                  ),
      ),
    );
  }
}
