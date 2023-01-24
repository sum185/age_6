import 'package:age_6/screen/provider/HomeProvider.dart';
import 'package:age_6/screen/view/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 void main()
 {
   runApp(
     MultiProvider(
       providers: [
         ChangeNotifierProvider(create: (context) => HomeProvider(),)
       ],
       child: MaterialApp(
         debugShowCheckedModeBanner: false,
         initialRoute: '/',
         routes: {
           '/':(context) => HomePage()
         },
       ),
     )
   );
 }