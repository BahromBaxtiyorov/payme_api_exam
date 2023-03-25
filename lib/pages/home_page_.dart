import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../getStorage.dart';
import '../items/home_page_item.dart';
import '../services/user_service.dart';
import '../services/utils_service.dart';
import 'AddCardPage.dart';

class HomePage_ extends StatefulWidget {
  const HomePage_({Key? key}) : super(key: key);

  @override
  State<HomePage_> createState() => _HomePage_State();
}

class _HomePage_State extends State<HomePage_> {

  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  initState() {
    //getConnetivity();
    super.initState();
    // subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    // Got a new connectivity status!
    // });
    // _loadMoreData();
  }


  @override
  dispose() {
    // subscription.cancel();
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: box!.values.length ?? 0,
            itemBuilder: (context, index){
              return HomePageItem(
                context,
                box!.getAt(index)!,
                      (){
                    _deleteUser(index);
                  });
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddCardPage()));
        },
        child: Icon(Icons.add),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _deleteUser(int id) async {
    bool result = await GetCardService.deleteCards(id.toString());
    if(result){
      box!.delete(id);
      setState(() {});
      Utils.snackBarSuccess('Update successfully', context);
    } else {
      Utils.snackBarError('Someting is wrong', context);
    }
  }






}