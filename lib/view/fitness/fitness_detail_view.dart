import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../common/color_extension.dart';
import '../../common_widget/collection_fitness_item_cell.dart';
import '../../common_widget/fitness_item_cell.dart';
import '../../common_widget/icon_text_button.dart';
import '../../common_widget/img_text_button.dart';
import '../../common_widget/selection_text_view.dart';
import '../../common_widget/user_review_row.dart';
import '../home/map_detail_view.dart';
import '../home/photo_list_view.dart';
import 'package:fit_finder/view/bookmark/bookmark_data.dart' as bookmarkData; 

class FitnessDetailView extends StatefulWidget {
  final Map fObj;
  const FitnessDetailView({super.key, required this.fObj});

  @override
  State<FitnessDetailView> createState() => _FitnessDetailViewState();
}

class _FitnessDetailViewState extends State<FitnessDetailView> {
  List trendingArr = [
    {
      "name": "Titan Strength",
      "address": "210 Salt Pond Rd.",
      "category": "Boutique gyms",
      "image":
          "https://images.unsplash.com/photo-1593079831268-3381b0db4a77?q=80&w=1769&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "Zenith Fitness",
      "address": "East 46th Street",
      "category": "Group fitness studios",
      "image":
          "https://images.unsplash.com/photo-1558611848-73f7eb4001a1?q=80&w=1771&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "Velocity Gym",
      "address": "East 46th Street",
      "category": "Personal Training Gyms",
      "image":
          "https://images.unsplash.com/photo-1570829460005-c840387bb1ca?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    }
  ];
  List collectionsArr = [
    {
      "name": "Oldschool",
      "place": "34",
      "image":
          "https://plus.unsplash.com/premium_photo-1672280783570-59f6320798fc?q=80&w=1936&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "Modern day",
      "place": "28",
      "image":
          "https://images.unsplash.com/photo-1517964603305-11c0f6f66012?q=80&w=1771&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "Powerlifting",
      "place": "56",
      "image":
          "https://images.unsplash.com/photo-1576678927484-cc907957088c?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    }
  ];

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(39.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 14.151926040649414);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                automaticallyImplyLeading: false,
                expandedHeight: media.width * 0.667,
                floating: false,
                centerTitle: false,
                flexibleSpace: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        widget.fObj["image"].toString(),
                        width: media.width,
                        height: media.width * 0.8,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 4,
                      left: 10,
                      child: IconButton(
                        icon: Image.network(
                          "https://img.icons8.com/?size=100&id=7811&format=png&color=FC7919",
                          width: 24,
                          height: 30,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.fObj["name"].toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: TColor.text,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                            color: TColor.primary,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          "4.8",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconTextButton(
                        title: "Share",
                        subTitle: "603",
                        icon: "assets/img/share.png",
                        onPressed: () {},
                      ),
                      IconTextButton(
                        title: "Review",
                        subTitle: "953",
                        icon: "assets/img/review.png",
                        onPressed: () {},
                      ),
                      IconTextButton(
                        title: "Photo",
                        subTitle: "115",
                        icon: "assets/img/photo.png",
                        onPressed: () {},
                      ),
                      IconTextButton(
                        title: "Bookmark",
                        subTitle: "1478",
                        icon: "assets/img/bookmark_detail.png",
                        onPressed: () {
                          var currentItem = {
                            "name": widget.fObj["name"].toString(),
                            "address": widget.fObj["address"].toString(),
                            "category": widget.fObj["category"].toString(),
                            "image": widget.fObj["image"].toString(),
                            "time": widget.fObj["time"].toString(),
                            "rate": widget.fObj["rate"].toString(),
                          };

                          setState(() {
                            bookmarkData.bookmarks.add(currentItem);
                          });

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  '${currentItem["name"]} has been bookmarked')));
                        },
                      ),
                    ],
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => const MapDetailView()));
                //   },
                //   child: Container(
                //     color: Colors.white,
                //     height: media.width * 0.4,
                //     child: Stack(
                //       children: [
                //         GoogleMap(
                //           mapType: MapType.normal,
                //           initialCameraPosition: _kLake,
                //           onMapCreated: (GoogleMapController controller) {
                //             _controller.complete(controller);
                //           },
                //         ),
                //         Container(
                //           padding: const EdgeInsets.all(25),
                //           child: Row(
                //             children: [
                //               Expanded(
                //                 child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text(
                //                       widget.fObj["address"].toString(),
                //                       textAlign: TextAlign.left,
                //                       style: TextStyle(
                //                           color: TColor.gray,
                //                           fontSize: 16,
                //                           fontWeight: FontWeight.w700),
                //                     ),
                //                     const SizedBox(
                //                       height: 8,
                //                     ),
                //                     Text(
                //                       widget.fObj["category"].toString(),
                //                       textAlign: TextAlign.left,
                //                       style: TextStyle(
                //                           color: TColor.gray,
                //                           fontSize: 16,
                //                           fontWeight: FontWeight.w700),
                //                     ),
                //                     const SizedBox(
                //                       height: 8,
                //                     ),
                //                     Text(
                //                       "11:30AM to 11PM",
                //                       textAlign: TextAlign.left,
                //                       style: TextStyle(
                //                           color: TColor.gray,
                //                           fontSize: 16,
                //                           fontWeight: FontWeight.w700),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //               Padding(
                //                 padding:
                //                     EdgeInsets.only(right: media.width * 0.15),
                //                 child: Image.asset("assets/img/map_pin.png",
                //                     width: 25),
                //               )
                //             ],
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          widget.fObj["image"].toString(),
                          width: media.width,
                          height: media.width * 0.2,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: media.width,
                        height: media.width * 0.2,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Colors.black54, Colors.transparent]),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Search Gym Online",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
                SelectionTextView(
                  title: "Photos",
                  actionTitle: "+ Add New photo",
                  onSeeAllTap: () {},
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PhotoListView()));
                  },
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ImgTextButton(
                          title: "Dumbbells",
                          subTitle: "(80)",
                          image:
                              "https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PhotoListView()));
                          },
                        ),
                        ImgTextButton(
                          title: "Machine",
                          subTitle: "(25)",
                          image:
                              "https://images.unsplash.com/photo-1598575435247-2572be03bf6d?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PhotoListView()));
                          },
                        ),
                        ImgTextButton(
                          title: "Cardio",
                          subTitle: "(10)",
                          image:
                              "https://images.unsplash.com/photo-1626252346582-c7721d805e0d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PhotoListView()));
                          },
                        ),
                        ImgTextButton(
                          title: "All Photos",
                          subTitle: "(115)",
                          image:
                              "https://images.unsplash.com/photo-1589579234096-25cb6b83e021?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PhotoListView()));
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                SelectionTextView(
                  title: "Details",
                  actionTitle: "Read All",
                  onSeeAllTap: () {},
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Call",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: TColor.gray,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "(212 789-7898)",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: TColor.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Average Monthly",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: TColor.gray,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "\$20 - \$40",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: TColor.gray,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),

                SelectionTextView(
                  title: "Reviews",
                  actionTitle: "Read All (953)",
                  onSeeAllTap: () {},
                ),
                ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: ((context, index) {
                      return UserReviewRow();
                    })),

                SelectionTextView(
                  title: "Same Fitnesss",
                  onSeeAllTap: () {},
                ),
                SizedBox(
                  height: media.width * 0.48,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      itemCount: trendingArr.length,
                      itemBuilder: (context, index) {
                        var fObj = trendingArr[index] as Map? ?? {};

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FitnessDetailView(
                                          fObj: fObj,
                                        )));
                          },
                          child: FitnessItemCell(
                            fObj: fObj,
                          ),
                        );
                      }),
                ),
                SelectionTextView(
                  title: "Collections by Capi",
                  onSeeAllTap: () {},
                ),
                SizedBox(
                  height: media.width * 0.6,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      itemCount: collectionsArr.length,
                      itemBuilder: (context, index) {
                        var fObj = collectionsArr[index] as Map? ?? {};

                        return CollectionFitnessItemCell(
                          fObj: fObj,
                        );
                      }),
                ),
                const SizedBox(
                  height: 15,
                )
              ],
            ),
          )),
    );
  }
}
