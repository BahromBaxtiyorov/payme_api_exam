


// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       backgroundColor: Colors.grey.shade800,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             FutureBuilder(
//                 future: GetCardService.getCards(),
//                 builder: (context,snapshot){
//                     if(snapshot.hasData){
//                       return  ListView.builder(
//                           itemCount: box!.values.length,  // ??0,
//                           shrinkWrap: true,
//                           itemBuilder: (context,index){
//                             return HomePageItem(context,
//                               box!.getAt((box?.values.length)! - 1 - index)!,
//                             );
//                           });
//                     }
//                   if(snapshot.hasError){
//                   return Center(child: Text(snapshot.error.toString()));
//                   }
//                   return Center (child: CircularProgressIndicator(),);
//             }),
//             // FutureBuilder(
//             //     future: GetUserService.getUsers(),
//             //     builder: (context, snapshot){
//             //       if(snapshot.hasData){
//             //        return ListView.builder(
//             //             physics: NeverScrollableScrollPhysics(),
//             //             shrinkWrap: true,
//             //             itemCount: snapshot.data!.length,
//             //             itemBuilder: (context, index) {
//             //               return HomePageItem(context,  snapshot.data![index],);
//             //             });
//             //       }
//             //       if(snapshot.hasError){
//             //         return Center(child: Text(snapshot.error.toString()));
//             //       }
//             //       return Center (child: CircularProgressIndicator(),);
//             //     }),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             Navigator.pushNamed(context,"/AddCardPage");
//           },
//           child: Icon(Icons.add)
//       ),
//     );
//   }
// }
