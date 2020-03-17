import 'package:flutter/material.dart';
import 'dart:io';
import 'package:coronatracker/symptoms.dart';
import 'package:coronatracker/about.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() async{
//await assign();
runApp(MyApp());
}
final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: Color(0xFF000000),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black54,
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: Color(0xFFE5E5E5),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme,
      home: MyHomePage(title: 'CORONA TRACKER'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
dynamic data;
bool fetch = true;
assign() {
  setState((){
  fetch =true;
   getData().then((x){
     setState(() {
       data=x;
       fetch = false;
       print("assigned");
     });
   });
  });
}

@override
void initState(){
  super.initState();
  assign();
}

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: 50),
          children: <Widget>[
            DrawerHeader(
              child: Text('CORONA TRACKER',textAlign: TextAlign.center,style:TextStyle(fontSize: 24,color: Colors.yellow)),
            ),
            InkWell(
              onTap: ()
              {
                Navigator.pop(context);
                Navigator.push(context,MaterialPageRoute(builder: (context)=>MyHomePage(title: 'CORONA TRACKER')));
              },
              child:Container(
              height: 40,
              child: Card(color: Colors.indigo,child: Text('DASHBOARD',textAlign: TextAlign.center,style:TextStyle(fontSize: 20,),),)
              )),
            Container(height: 30,),
            InkWell(
              onTap: (){
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Precautions()));
              },
              child:Container(
              height: 40,
              child: Card(color: Colors.indigo,child: Text('SYMPTOMS & PRECAUTIONS',textAlign: TextAlign.center,style:TextStyle(fontSize: 20,),),)
              )),
            Container(height: 30,),
            InkWell(
              onTap: (){
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(builder: (context)=>About()));
              },
              child:Container(
              height: 40,
              child: Card(color: Colors.indigo,child: Text('ABOUT CORONAVIRUS',textAlign: TextAlign.center,style:TextStyle(fontSize: 20,),),)
              )),
            Container(height: 30,),
              InkWell(
              onTap: (){Navigator.pop(context);exit(0);},
              child:Container(
              height: 40,
              child: Card(color: Colors.indigo,child: Text('EXIT',textAlign: TextAlign.center,style:TextStyle(fontSize: 20,),),)
              )),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.purple,
      ),
      body: fetch? Center(child:CircularProgressIndicator()):Center(
        child: ListView(
          children: <Widget>[
            Card(
              elevation: 25.0,
              child: Container(
              height: 200,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment:Alignment.centerLeft,
                    child: Icon(
                      Icons.local_hospital,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                  Text('\nTOTAL CONFIRMED CASES:'+(data["latest"]["confirmed"]).toString(),style: TextStyle(color: Colors.yellow,fontSize: 24),),
                  Text('\nLast Updated:\t'+ (data["confirmed"]["last_updated"]).toString(),style: TextStyle(color: Colors.white,fontSize: 14),)

                ],
              ),
            ),),
            Card(
              elevation: 25.0,
              child: Container(
              height: 200,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment:Alignment.centerLeft,
                    child: Icon(
                      Icons.favorite,
                      size: 100,
                      color: Colors.green,
                    ),
                  ),
                  Text('\nTOTAL RECOVERED CASES:'+ (data["latest"]["recovered"]).toString(),style: TextStyle(color: Colors.lightGreen,fontSize: 24),),
                  Text('\nLast Updated:\t'+ (data["recovered"]["last_updated"]).toString(),style: TextStyle(color: Colors.white,fontSize: 14),)
                ],
              ),
            ),),
            Card(
              elevation: 25.0,
              child: Container(
              height: 200,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment:Alignment.centerLeft,
                    child: Icon(
                      Icons.hotel,
                      size: 100,
                      color: Colors.redAccent,
                    ),
                  ),
                  Text('\nTOTAL DEATHS :'+ (data["latest"]["deaths"]).toString(),style: TextStyle(color: Colors.red,fontSize: 24),),
                  Text('\nLast Updated:\t'+ (data["deaths"]["last_updated"]).toString(),style: TextStyle(color: Colors.white,fontSize: 14),)

                ],
              ),
            ),),
            Container(
              padding: EdgeInsets.only(top: 25),
              child: FloatingActionButton(
                onPressed: () async{
                  await assign();
                },
                child: Icon(
                  Icons.refresh,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            Container(height: 10,)
          ],
        ),
      ),
    );
  }
}

Future<dynamic> getData() async {
  String apiUrl = 'https://coronavirus-tracker-api.herokuapp.com/all';
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}

