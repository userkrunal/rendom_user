import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rendom_user/user/helper/user_api.dart';
import 'package:rendom_user/user/model/usermodel.dart';

import 'package:rendom_user/user/provider/user_provider.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserProvider? upT;
  UserProvider? upF;

  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context,listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    upT=Provider.of<UserProvider>(context,listen: true);
    upF=Provider.of<UserProvider>(context,listen: false);
    return SafeArea(child: Scaffold(
      body: FutureBuilder(
        builder: (context, snapshot) {
          if(snapshot.hasError)
            {
              return Text("${snapshot.error}");
            }
          else if(snapshot.hasData)
            {
              UserModel userModel=snapshot.data!;
              return Container(
                height: 100.h,
                width: 100.w,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/img.png"),fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(),
                          Text("Rendom Data",style: TextStyle(fontSize: 25.sp)),
                          SizedBox(width: 15.w),
                          IconButton(onPressed: () async {
                            upF!.rendomuser(await UserApi.userApi.getApi());
                          }, icon: Icon(Icons.refresh,size: 30,),color: Colors.black),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        ClipOval(
                          child: Image.network("${userModel.results![0].picture!.large}",height: 150,width: 150,fit: BoxFit.fill),
                        ),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Text("Name :- ${userModel.results![0].name!.title}.${userModel.results![0].name!.first} ${userModel.results![0].name!.last}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: userModel.results![0].id!.value==null?Text("Id :- *******",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)):Text("Id :- ${userModel.results![0].id!.name}-${userModel.results![0].id!.value}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Mobil No. :- ${userModel.results![0].phone}",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Gender :- ${userModel.results![0].gender}",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Country :- ${userModel.results![0].location!.country}",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Date of Birth :- ${userModel.results![0].dob!.date}",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Email :- ${userModel.results![0].email}",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Registered Date :- ${userModel.results![0].registered!.date}",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("UserName :- ${userModel.results![0].login!.username}",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Password :- ${userModel.results![0].login!.password}",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Postcode :- ${userModel.results![0].location!.postcode}",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600)),
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
          return Center(child: CircularProgressIndicator());
        },
        future: upF!.getData(),
      )
      ),
    );
  }
}
