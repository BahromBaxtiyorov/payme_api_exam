import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payme_api/pages/uz_cardPage.dart';

import 'homePage.dart';
import 'home_page_.dart';
import 'humo_cardPage.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade800,
          title: Text("My Cards",),
          bottom: TabBar(
            labelStyle: TextStyle(fontSize: 18,color: Colors.blue),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            controller: _tabController,
            isScrollable: true,
            tabs: const [
              Tab(text: "All Cards",),
              Tab(text: "Uzcard",),
              Tab(text: "Humo",),
            ],
          ),
          elevation: 0,
        ),
     body: TabBarView(
       controller: _tabController,
       children: const [
         HomePage_(),
         HumoCardPage(),
         UzcardPage(),
       ],
     )
    );
  }
}
