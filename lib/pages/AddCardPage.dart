import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask/mask/mask.dart';
import 'package:mask/models/hashtag_is.dart';
import 'package:payme_api/pages/mainView.dart';

import '../getStorage.dart';
import '../models/user_model.dart';
import 'home_page_.dart';


class AddCardPage extends StatefulWidget {
  const AddCardPage({Key? key}) : super(key: key);

  @override
  State<AddCardPage> createState() => _SearchCardState();
}

class _SearchCardState extends State<AddCardPage> {
  final  _formKey = GlobalKey<FormState>();
  var expiredDateNumberCtr = TextEditingController();
  var cardNumberCtr = TextEditingController();
  var cardNameCtr = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar:AppBar(title: Text("Add card")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:20,left: 20,right: 20,bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           Container(width: MediaQuery.of(context).size.width,
             height: 250,
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
               image: DecorationImage(
                   image: AssetImage("assets/images/i (19).webp"),
                   fit: BoxFit.cover
               ),
             ),
             child: Container(
                 child: Padding(
                   padding: const EdgeInsets.only(left:20,top:15,bottom:15),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       const SizedBox(height: 15,),
                       Text(cardNameCtr.text,style: TextStyle(color: Colors.white,fontSize:18,fontWeight: FontWeight.w700),),
                       const SizedBox(height: 15,),
                       const Text("Bahrom Baxtiyorov",style: TextStyle(color: Colors.white,fontSize:16,),),
                       const SizedBox(height: 10,),
                       const Text("2 550 000 sum",style: TextStyle(color: Colors.white,fontSize:20,fontWeight: FontWeight.w700),),
                       const SizedBox(height: 10,),
                       const Text("Bahrom Baxtiyorov",style: TextStyle(color: Colors.white,fontSize:16,),),
                       const SizedBox(height: 55,),
                       Row(
                         children: [
                           Container(
                               width: 220,
                               child: Text(cardNumberCtr.text,style: TextStyle(color: Colors.white,fontSize:17,fontWeight: FontWeight.w500),)),
                           SizedBox(width: 20,),
                           Text(expiredDateNumberCtr.text,style: TextStyle(color: Colors.white,fontSize:19,fontWeight: FontWeight.w500),),
                         ],
                       ),
                     ],
                   ),
                 )
             )
           ),
              SizedBox(height:15),
              Text("Card number",style: TextStyle(color: Colors.white54,fontSize: 15)),
              SizedBox(height:5),
              Form(
                key:_formKey,
                child: TextFormField(
                  onChanged: (number){
                    _formKey.currentState!.validate();
                    setState(() {});
                    },
                  validator: (value){
                    if(value == null || value.isEmpty) {
                      return "Please enter card number right";
                    }
                    if(value.length <19){
                      return 'Please enter 16 digits';
                    }
                    if(!value.startsWith("8600") && !value.startsWith("9860")) {
                      return "you can add only cards 'HUMO' or 'UZCARD'";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                 controller: cardNumberCtr,
                  inputFormatters: [
                    Mask.generic(masks:[ '#### #### #### ####'],
                    hashtag: Hashtag.numbers,
                    )
                  ],
                  decoration: InputDecoration(
                    hintText: 'Card number',
                    hintStyle: TextStyle(color:Colors.white54),
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15.0),),),
                  ),
                ),
              ),
              SizedBox(height:10),
              Text("Expire Date",style: TextStyle(color: Colors.white54,fontSize: 15)),
              SizedBox(height:5),
              TextFormField(
                onChanged: (number1){
                  _formKey.currentState!.validate();
                  setState(() {});
                },
                validator: (date) {
                  if (date == null ||  date.isEmpty) {
                    return "Please Enter Date";
                  }
                  if (expiredDateNumberCtr.text.codeUnitAt(0) > 49 &&
                      expiredDateNumberCtr.text.codeUnitAt(1) > 50) {
                  return "Invalid date";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                controller: expiredDateNumberCtr,
                inputFormatters: [
                  Mask.generic(masks:[ '##/##'],
                    hashtag: Hashtag.numbers,
                  )
                ],
                decoration: InputDecoration(
                  hintText: 'Expire Date',
                    hintStyle: TextStyle(color:Colors.white54),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15.0),),),
                ),
              ),
              SizedBox(height:10),
              Text("Card name",style: TextStyle(color: Colors.white54,fontSize: 15)),
              SizedBox(height:5),
              TextFormField(
                controller: cardNumberCtr,
                decoration: InputDecoration(
                  hintText: 'Card name',
                  hintStyle: TextStyle(color:Colors.white54),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15.0),),),
                ),
              ),
              SizedBox(height:80),
              Container(
                height:50,
                width:MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                    color: Colors.grey
                ),
                child: ElevatedButton(
                    onPressed: (){
                        var newNote = UserModel(
                          cardname: cardNameCtr.text,
                          cardNumber: cardNumberCtr.text.startsWith("8600")? "Uzcard" : "Humo",
                          expireDateNumber: expiredDateNumberCtr.text,
                          image: "assets/images/i (19).webp",
                          name: "Bahrom Baxtiyorov",
                          price: "1 sum",
                        );
                       box!.add(newNote);
                        setState(() {});
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (BuildContext context) {
                              return  const MainView();
                            }));
                        setState(() {});
                    },
                    child: Text("Done", style:TextStyle(color: Colors.white))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
