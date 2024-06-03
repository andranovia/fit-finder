
import 'package:flutter/material.dart';
import '../../common/color_extension.dart';
import '../../common_widget/discovery_cell.dart';

class DiscoveryView extends StatefulWidget {
  const DiscoveryView({super.key});

  @override
  State<DiscoveryView> createState() => _DiscoveryViewState();
}

class _DiscoveryViewState extends State<DiscoveryView> {
  List listArr = [
    {
      "name": "Nearby Gym",
      "place": "34",
      "image": "https://img.icons8.com/?size=100&id=8KoR8Bv64kb2&format=png&color=000000",
    },
    {
      "name": "Fitness & Training",
      "place": "28",
      "image": "https://img.icons8.com/?size=100&id=13390&format=png&color=000000",
    },
    {
      "name": "Workout Spots",
      "place": "28",
      "image": "https://img.icons8.com/?size=100&id=MyDyhaNB2oZy&format=png&color=000000",
    },
    {
      "name": "Sports Bars",
      "place": "42",
      "image": "https://img.icons8.com/?size=100&id=13388&format=png&color=000000",
    },
    {
      "name": "Health Cafes",
      "place": "29",
      "image": "https://img.icons8.com/?size=100&id=30001&format=png&color=000000",
    },
    {
      "name": "Take-Away Fitness",
      "place": "21",
      "image": "https://img.icons8.com/?size=100&id=16971&format=png&color=000000",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
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
                    "https://img.icons8.com/?size=100&id=13800&format=png&color=000000",
                    width: 30,
                    height: 30,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Discovery",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: TColor.text,
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ];
        },
        body: GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1),
            itemCount: listArr.length,
            itemBuilder: (context, index) {
              var fObj = listArr[index] as Map? ?? {};
              return GestureDetector(
                  onTap: () {
                    //
                  },
                  child: DiscoveryCell(
                    fObj: fObj,
                  ));
            }),
      ),
    );
  }
}
