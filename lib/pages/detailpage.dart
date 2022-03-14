import 'dart:math';

import 'package:flutter/material.dart';
import 'package:infinite_listview/helper/urlhelper.dart';
import 'package:infinite_listview/models/model.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
   DetailScreen({Key? key, required this.detailData}) : super(key: key);
  final PostModel detailData;
  var colorme = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details Information',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 18, 20, 31),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.white),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            color:  Color.fromARGB(255, 16, 19, 27),
          ),
          child: Padding(
            padding: const EdgeInsets.all(7),
            child: Column(
              children: [
                Card(
                  color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        const Text('Author:'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(detailData.authorName.toString()),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        const Text('ID:'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(detailData.postId.toString()),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        const Text('Width:'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(detailData.width.toString()),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        const Text('Height:'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(detailData.height.toString()),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const Text('Image URL :'),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            detailData.downloadUrl.toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          lunchUrl(detailData.imageUrl.toString());
        },
        backgroundColor: colorme,
        child: const Icon(
          Icons.cloud_download,
          color: Colors.white,
        ),
      ),
    );
  }
}
