import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';

Widget HomePageItem(
  BuildContext context,
  UserModel card,
  void Function() delete,
) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: AssetImage("assets/images/i (19).webp"), fit: BoxFit.cover),
      ),
      child: Container(
          child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              card.cardname.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              card.name.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(card.price.toString(),
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),),
            SizedBox(height: 10,),
            Text(card.name.toString(), style: TextStyle(color: Colors.white, fontSize: 16,),),
            SizedBox(height: 30,),
            Row(
              children: [
                Container(
                    width: 220,
                    child: Text(
                      card.cardNumber.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),)),
                Text(
                  card.expireDateNumber.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w500),),
                SizedBox(width:20),
                IconButton(
                    onPressed: () {
                      delete();
                    },
                    icon: Icon(Icons.delete,size:30,color: Colors.white)),
              ],
            ),
          ],
        ),
      )),
    ),
  );
}
