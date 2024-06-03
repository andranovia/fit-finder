import 'package:flutter/material.dart';
import 'package:fit_finder/common/color_extension.dart';

import '../bookmark/bookmark_view.dart';
import '../discovery/discovery_view.dart';
import '../home/home_view.dart';
import '../my_profile/my_profile_view.dart';


class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView>
    with TickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
   
    controller = TabController(length: 5, vsync: this);
    controller?.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(controller: controller,
       children: const [
        HomeView(),
        DiscoveryView(),
        BookmarkView(),
     
        MyProfileView()
      ]),
      bottomNavigationBar: BottomAppBar(
        child: TabBar(
            controller: controller,
            labelColor: TColor.primary,
            labelPadding: EdgeInsets.zero,
            unselectedLabelColor: TColor.gray,
            labelStyle:
                const TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
            unselectedLabelStyle:
                const TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
            indicatorColor: Colors.transparent,
            padding: EdgeInsets.zero,
            tabs: [
              Tab(
               
                icon: Image.asset(
                  "assets/img/home_tab.png",
                  width: 25,
                  height: 25,
                  fit: BoxFit.contain,
                  color: controller?.index == 0 ? TColor.primary : TColor.gray,
                ),
                text: "Home",
              ),
              Tab(
                icon: Image.asset(
                  "assets/img/discovery_tab.png",
                  width: 25,
                  height: 25,
                  fit: BoxFit.contain,
                  color: controller?.index == 1 ? TColor.primary : TColor.gray,
                ),
                text: "Discovery",
              ),
              Tab(
                icon: Image.asset(
                  "assets/img/bookmark_tab.png",
                  width: 25,
                  height: 25,
                  fit: BoxFit.contain,
                  color: controller?.index == 2 ? TColor.primary : TColor.gray,
                ),
                text: "Bookmark",
              ),
             
              Tab(
                icon: Image.asset(
                  "assets/img/my_profile_tab.png",
                  width: 25,
                  height: 25,
                  fit: BoxFit.contain,
                  color: controller?.index == 4 ? TColor.primary : TColor.gray,
                ),
                text: "My",
              ),
            ]),
      ),
    );
  }
}
