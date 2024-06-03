import 'package:flutter/material.dart';
import 'package:fit_finder/view/home/comment_list_view.dart';
import 'package:fit_finder/view/home/like_user_list_view.dart';
import 'package:fit_finder/view/home/photo_details_view.dart';

import '../../common/color_extension.dart';
import '../../common_widget/popup_layout.dart';
import '../../common_widget/selection_button.dart';
import '../../common_widget/user_photo_row.dart';

class PhotoListView extends StatefulWidget {
  const PhotoListView({super.key});

  @override
  State<PhotoListView> createState() => _PhotoListViewState();
}

class _PhotoListViewState extends State<PhotoListView> {
  var selectTab = 0;
  var isGrid = true;

  List imgArr = [
    "https://plus.unsplash.com/premium_photo-1672280783570-59f6320798fc?q=80&w=1936&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1517964603305-11c0f6f66012?q=80&w=1771&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1576678927484-cc907957088c?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1556817411-31ae72fa3ea0?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1506197061617-7f5c0b093236?q=80&w=1718&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1672280783570-59f6320798fc?q=80&w=1936&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1517964603305-11c0f6f66012?q=80&w=1771&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1576678927484-cc907957088c?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1556817411-31ae72fa3ea0?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1506197061617-7f5c0b093236?q=80&w=1718&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1672280783570-59f6320798fc?q=80&w=1936&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1517964603305-11c0f6f66012?q=80&w=1771&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1576678927484-cc907957088c?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1556817411-31ae72fa3ea0?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1506197061617-7f5c0b093236?q=80&w=1718&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.bg,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 1,
              pinned: true,
                  automaticallyImplyLeading: false,
              floating: false,
              centerTitle: false,
              leadingWidth: 0,
              title: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset(
                      "assets/img/back.png",
                      width: 25,
                      height: 25,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "All Photos",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: TColor.text,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isGrid = !isGrid;
                    });
                  },
                  icon: Image.asset(
                    isGrid
                        ? "assets/img/filter.png"
                        : "assets/img/grid_icon.png",
                    width: 25,
                    height: 25,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
            SliverAppBar(
              primary: false,
              floating: false,
              backgroundColor: Colors.white,
              expandedHeight: 70,
              elevation: 1,
              leading: Container(),
              automaticallyImplyLeading: false,
              leadingWidth: 0,
              flexibleSpace: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Row(
                    children: [
                      SelectionButton(
                          title: "Dumbbells",
                          subTitle: "(80)",
                          onPressed: () {
                            setState(
                              () {
                                selectTab = 0;
                              },
                            );
                          },
                          isSelect: selectTab == 0),
                      SelectionButton(
                          title: "Machine",
                          subTitle: "(25)",
                          onPressed: () {
                            setState(
                              () {
                                selectTab = 1;
                              },
                            );
                          },
                          isSelect: selectTab == 1),
                      SelectionButton(
                          title: "Cardio",
                          subTitle: "(10)",
                          onPressed: () {
                            setState(
                              () {
                                selectTab = 2;
                              },
                            );
                          },
                          isSelect: selectTab == 2),
                      SelectionButton(
                          title: "All",
                          subTitle: "(115)",
                          onPressed: () {
                            setState(
                              () {
                                selectTab = 3;
                              },
                            );
                          },
                          isSelect: selectTab == 3),
                    ],
                  ),
                ),
              ),
            )
          ];
        },
        body: isGrid
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                itemCount: imgArr.length,
                itemBuilder: (context, index) {
                  var img = imgArr[index] as String? ?? "";

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhotoDetailsView(
                            img: img,
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: TColor.secondary,
                        ),
                        child: Image.network(
                          img,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                })
            : ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 2),
                itemCount: imgArr.length,
                itemBuilder: (context, index) {
                  var img = imgArr[index] as String? ?? "";
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 1,
                              offset: Offset(0, 1))
                        ]),
                    child: UserPhotoRow(
                      pObj: {
                        "image": img,
                      },
                      onCommentPress: () {
                        Navigator.push(context,
                            PopupLayout(child: const CommentListView()));
                      },
                      onLikePress: () {
                        Navigator.push(context,
                            PopupLayout(child: const LikeUserListView()));
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
