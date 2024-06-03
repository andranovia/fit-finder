import 'package:flutter/material.dart';
import '../../common/color_extension.dart';
import '../../common_widget/line_textfield.dart';
import '../../common_widget/near_by_list_row.dart';
import 'package:fit_finder/view/bookmark/bookmark_data.dart' as bookmarkData; 

class BookmarkView extends StatefulWidget {
  const BookmarkView({super.key});

  @override
  State<BookmarkView> createState() => _BookmarkViewState();
}

class _BookmarkViewState extends State<BookmarkView> {
  TextEditingController txtSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.bg,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              pinned: true,
              floating: false,
              centerTitle: false,
              leadingWidth: 0,
              title: Row(
                children: [
                  Image.network(
                    "https://img.icons8.com/?size=100&id=26089&format=png&color=000000",
                    width: 30,
                    height: 30,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Bookmark",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: TColor.text,
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 1,
              pinned: false,
              floating: true,
              primary: false,
              expandedHeight: 50,
              flexibleSpace: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RoundTextField(
                  controller: txtSearch,
                  hitText: "Search for fitness place…",
                  leftIcon: Icon(Icons.search, color: TColor.gray),
                ),
              ),
            ),
          ];
        },
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            ListView.builder(
                itemCount: bookmarkData.bookmarks.length, // Ensure this line is correct
                itemBuilder: (context, index) {
                  var fObj = bookmarkData.bookmarks[index];
                  return NearByListRow(
                    fObj: fObj,
                    isBookmark: true,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
