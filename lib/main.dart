import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rendom_user/user/provider/user_provider.dart';
import 'package:rendom_user/user/view/user_screen.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
   Sizer(builder: (context, orientation, deviceType) {
     return  ChangeNotifierProvider(
       create: (context) => UserProvider(),
       child: MaterialApp(
         debugShowCheckedModeBanner: false,
          routes: {
           '/':(context) => HomeScreen()
          },
       ),
     );
   },)
  );
}