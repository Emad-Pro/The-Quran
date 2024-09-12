import 'package:flutter/material.dart';

import '../widget/bookmarks_add_new_collection.dart';
import '../widget/bookmarks_build_listview_item.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [BookMarksAddNewCollection(), BookMarksBuildListViewItem()],
    );
  }
}
