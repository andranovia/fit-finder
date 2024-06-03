import 'package:flutter/material.dart';
import 'package:fit_finder/common/color_extension.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../common_widget/collection_fitness_item_cell.dart';
import '../../common_widget/favorite_fitness_item_cell.dart';
import '../../common_widget/fitness_item_cell.dart';
import '../../common_widget/line_textfield.dart';
import '../../common_widget/popular_fitness_item_cell.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/selection_text_view.dart';
import '../fitness/fitness_detail_view.dart';

Future<List<dynamic>> fetchLegendaryData() async {
  final response = await http.get(Uri.parse(
      'https://660e22056ddfa2943b35d9a0.mockapi.io/api/v1/Legendary'));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<dynamic>> fetchTrendingData() async {
  final response = await http.get(
      Uri.parse('https://660e22056ddfa2943b35d9a0.mockapi.io/api/v1/Trending'));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSelectCity = false;
  TextEditingController txtSearch = TextEditingController();
  late Future<List<dynamic>> legendaryArr;
  late Future<List<dynamic>> trendingArr;
  @override
  void initState() {
    super.initState();
    legendaryArr = fetchLegendaryData();
    trendingArr = fetchTrendingData();
  }

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

  List favoriteArr = [
    {
      "name": "Strength",
      "image":
          "https://images.unsplash.com/photo-1556817411-31ae72fa3ea0?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "Cardio",
      "image":
          "https://images.unsplash.com/photo-1506197061617-7f5c0b093236?q=80&w=1718&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "Functional",
      "image":
          "https://images.unsplash.com/photo-1526314149856-d8cf115d62f1?q=80&w=1949&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "Group Fitness",
      "image":
          "https://images.unsplash.com/photo-1517130038641-a774d04afb3c?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "Flexibility",
      "image":
          "https://images.unsplash.com/photo-1522898467493-49726bf28798?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "Mind-Body",
      "image":
          "https://images.unsplash.com/photo-1649789248266-ef1c7f744f6f?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "Sports",
      "image":
          "https://images.unsplash.com/photo-1513635625218-6956bc843133?q=80&w=1902&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "Recovery",
      "image":
          "https://images.unsplash.com/photo-1640622659613-26d7d08893e4?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    }
  ];

  List popularArr = [
    {"outlets": "23", "image": "assets/img/gym-logo-1.png"},
    {"outlets": "16", "image": "assets/img/gym-logo-2.png"},
    {"outlets": "31", "image": "assets/img/gym-logo-3.png"},
    {"outlets": "20", "image": "assets/img/gym-logo-4.png"}
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.bg,
      body: isSelectCity
          ? NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    pinned: true,
                    floating: false,
                    centerTitle: false,
                    leading: IconButton(
                      icon: Image.network(
                        "https://img.icons8.com/?size=100&id=7811&format=png&color=FC7919",
                        width: 30,
                        height: 36,
                      ),
                      onPressed: () {
                        setState(() {
                          isSelectCity = false;
                        });
                      },
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "New York City",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: TColor.text,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Your location",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: TColor.gray,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    actions: [
                      IconButton(
                        icon: Image.asset(
                          "assets/img/notification.png",
                          width: 24,
                          height: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            isSelectCity = false;
                          });
                        },
                      ),
                      IconButton(
                        icon: Image.network(
                          "https://img.icons8.com/?size=100&id=60953&format=png&color=FC7919",
                          width: 30,
                          height: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            isSelectCity = false;
                          });
                        },
                      ),
                    ],
                  ),
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    elevation: 1,
                    pinned: false,
                    floating: true,
                    primary: false,
                    title: RoundTextField(
                      controller: txtSearch,
                      hitText: "Search for fitness place…",
                      leftIcon: Icon(Icons.search, color: TColor.gray),
                    ),
                  ),
                ];
              },
              body: FutureBuilder<List<dynamic>>(
                future: legendaryArr,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No data found'));
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectionTextView(
                            title: "Most Finded",
                            onSeeAllTap: () {},
                          ),
                          SizedBox(
                            height: media.width * 0.48,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                var fObj = snapshot.data![index] as Map? ?? {};

                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FitnessDetailView(
                                          fObj: fObj,
                                        ),
                                      ),
                                    );
                                  },
                                  child: FitnessItemCell(
                                    fObj: fObj,
                                  ),
                                );
                              },
                            ),
                          ),
                          FutureBuilder<List<dynamic>>(
                            future: trendingArr,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.isEmpty) {
                                return Center(child: Text('No data found'));
                              } else {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SelectionTextView(
                                      title: "Trending",
                                      onSeeAllTap: () {},
                                    ),
                                    SizedBox(
                                      height: media.width * 0.48,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) {
                                          var tObj =
                                              snapshot.data![index] as Map? ??
                                                  {};

                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      FitnessDetailView(
                                                    fObj: tObj,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: FitnessItemCell(
                                              fObj: tObj,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              }
                            },
                          ),
                          SelectionTextView(
                            title: "Find Category",
                            onSeeAllTap: () {},
                          ),
                          SizedBox(
                            height: media.width * 0.6,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                itemCount: collectionsArr.length,
                                itemBuilder: (context, index) {
                                  var fObj =
                                      collectionsArr[index] as Map? ?? {};

                                  return CollectionFitnessItemCell(
                                    fObj: fObj,
                                  );
                                }),
                          ),
                          SelectionTextView(
                            title: "Favorite Cuisines",
                            onSeeAllTap: () {},
                          ),
                          SizedBox(
                            height: media.width * 0.47,
                            child: GridView.builder(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                scrollDirection: Axis.horizontal,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.55,
                                        crossAxisSpacing: 15,
                                        mainAxisSpacing: 15),
                                itemCount: favoriteArr.length,
                                itemBuilder: (context, index) {
                                  var fObj = favoriteArr[index] as Map? ?? {};

                                  return FavoriteFitnessItemCell(
                                    fObj: fObj,
                                    index: index,
                                  );
                                }),
                          ),
                          SelectionTextView(
                            title: "Popular brands",
                            onSeeAllTap: () {},
                          ),
                          SizedBox(
                            height: media.width * 0.42,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                itemCount: popularArr.length,
                                itemBuilder: (context, index) {
                                  var fObj = popularArr[index] as Map? ?? {};

                                  return GestureDetector(
                                    onTap: () {
                                      //
                                    },
                                    child: PopularFitnessItemCell(
                                      fObj: fObj,
                                      index: index,
                                    ),
                                  );
                                }),
                          ),
                          const SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    );
                  }
                },
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                    "https://img.icons8.com/?size=100&id=hAoPhLLaSFUB&format=png&color=000000",
                    width: media.width,
                    height: media.width * .25),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Text(
                  "Hi, nice to meet you!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: TColor.text,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Text(
                  "Set your location to start exploring\nFitness places around you",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: TColor.gray,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.08,
                ),
                RoundButton(
                  title: "User current location",
                  type: RoundButtonType.primary,
                  onPressed: () async {
                    setState(() {
                      isSelectCity = true;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
