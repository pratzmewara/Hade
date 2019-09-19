import 'package:flutter/material.dart';
import 'package:hade/util.dart';
import 'package:http/http.dart' as http;
import 'package:hade/models/global.dart';
import 'dart:async';
import 'dart:convert';
import 'package:hade/createOrganisationPage.dart';
import 'package:hade/screens/joinOrganization.dart';
import 'package:hade/models/get_Organization.dart';
import 'package:hade/userDataMangment.dart';
import 'package:hade/screens/login.dart';


class GetOrganizationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GetOrganizationPageState();
  }

}

class CustomPopupMenu {
  CustomPopupMenu({this.title, this.icon});

  String title;
  IconData icon;
}



class GetOrganizationPageState extends State<GetOrganizationPage>{

  SharedPreferencesTest s=new SharedPreferencesTest();

  String token='';
  @override
  initState(){
    super.initState();

    Future<String> tok=s.getToken();
    tok.then((res){
      setState(() {
        token=res;
      });
    });
  }

  List<CustomPopupMenu> choices = <CustomPopupMenu>[
    CustomPopupMenu(title: 'Logout'),
  ];


//  void _select(CustomPopupMenu choice) {
//
//    if(choice.title=='Logout'){
//      s.setLoginCheck(false);
//      Navigator.of(context).popUntil((route) => route.isFirst);
//      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
//      // s.setEmail("");
//      // s.setLogincheck("false");
//      // s.setToken("");
//      // Navigator.of(context).popUntil((route) => route.isFirst);
//      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
//
//    }
//  }

  toHomePage(){
    Navigator.of(context).pushReplacementNamed('/homepage');
  }



  toCreate(){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CreateOrganisationScreen()));
  }

  toJoin(){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => JoinOrganization(token)));
  }

  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
                      appBar: AppBar(
                        elevation: 0,
                        centerTitle: true,
                        title: Text("Hades",style: TextStyle(color: Colors.black),),
                        actions: <Widget>[

//                          Theme(
//                              data: Theme.of(context).copyWith(
//                                cardColor: Colors.white,
//                                iconTheme: IconThemeData(color: Colors.black),
//                              ),
//                              child: ListTileTheme(
//                                  iconColor: Colors.black,
//                                  child: PopupMenuButton<CustomPopupMenu>(
//                                    elevation: 3.2,
//                                    initialValue: choices[0],
//                                    onCanceled: () {
//                                      print('You have not choosed anything');
//                                    },
//                                    tooltip: 'This is tooltip',
//                                    onSelected: _select,
//                                    itemBuilder: (BuildContext context) {
//                                      return choices.map((CustomPopupMenu choice) {
//                                        return PopupMenuItem<CustomPopupMenu>(
//                                          value: choice,
//                                          child: Text(choice.title),
//                                        );
//                                      }).toList();
//                                    },
//                                  ))),


//                IconButton(icon: Icon(Icons.check_box_outline_blank),onPressed: (){

//                },)
                        ],
                      ),
                      body: Container(
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                  onTap:(){
                                    toJoin();
                                  } ,child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[

                                  Container(
                                      height: 150,
                                      width: 150,
                                      margin: EdgeInsets.all(16),
                                      decoration:BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                              color: Colors.grey[400],
                                              offset: Offset(0.5, 0.5),
                                              blurRadius: 10.0,
                                            ),
                                          ],
                                          shape: BoxShape.rectangle,


                                          borderRadius: BorderRadius.all(Radius.circular(10))),
                                      child:Column(
                                        children: <Widget>[
                                          Container(
                                              padding: EdgeInsets.fromLTRB(8, 8, 8, 2),
                                              child:Icon(Icons.check_circle,size: 90,color: Colors.amber,)
                                          ),
                                          Container(
                                              padding: EdgeInsets.fromLTRB(8, 8, 8, 2),
                                              child:Text("Join",style: TextStyle(fontWeight: FontWeight.w500,decoration: TextDecoration.none,fontSize: 16),)
                                          )


                                        ],
                                      )
                                  ),
                                ]

                                ,)),
                              GestureDetector(
                                  onTap:(){
                                    toCreate();
                                  } ,
                                  child:  Container(
                                      height: 150,
                                      width: 150,
                                      decoration:BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                              color: Colors.grey[400],
                                              offset: Offset(0.5, 0.5),
                                              blurRadius: 10.0,
                                            ),
                                          ],
                                          shape: BoxShape.rectangle,

                                          borderRadius: BorderRadius.all(Radius.circular(10))),
                                      margin: EdgeInsets.all(16),
                                      child:Column(
                                        children: <Widget>[
                                          Container(
                                              padding: EdgeInsets.fromLTRB(8, 8, 8, 2),
                                              child:Icon(Icons.add_circle,size: 90,color: Colors.green,)
                                          ),
                                          Container(
                                              padding: EdgeInsets.fromLTRB(8, 8, 8, 2),
                                              child:Text("Create",style: TextStyle(fontWeight: FontWeight.w500,decoration: TextDecoration.none,fontSize: 16),)
                                          )

                                        ],
                                      )
                                  ))])));


  }




}