import 'package:flutter/material.dart';
import 'dart:io';
import 'package:coronatracker/main.dart';
import 'package:coronatracker/about.dart';
class Precautions extends StatefulWidget {
  @override
  _PrecautionsState createState() => _PrecautionsState();
}

class _PrecautionsState extends State<Precautions> {
  @override
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
        title: Text('PRECAUTION'),
        backgroundColor: Colors.purple,
      ),
      body:  Center(child: Container(
        padding: EdgeInsets.all(10),
        //color: Colors.transparent,
        decoration: BoxDecoration(
          color: Colors.brown,
          boxShadow: [BoxShadow(color: Colors.black54,blurRadius:5.0,spreadRadius: 10)],
          borderRadius: BorderRadius.all(
            Radius.circular(10)
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.85,
        width: MediaQuery.of(context).size.width * 0.9,
        child: ListView(
            shrinkWrap: true,
            
            children: <Widget>[Column(
            children: <Widget>[
             Center(child: Text("SYMPTOMS",style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.w900,fontSize: 20),)),
              GridView.count(
              primary: false,  
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10),
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  Card(
                    color: Colors.orange,
                    child: Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage('assets/cough.png'),
                          height: 150,
                        ),
                        Text("COUGHING",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.w900,fontSize: 20),)
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.lime,
                    child: Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage('assets/fever.png'),
                          height: 150,
                        ),
                        Text("FEVER",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.w900,fontSize: 20),)
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.green,
                    child: Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage('assets/runningnose.png'),
                          height: 150,
                        ),
                        Text("RUNNING NOSE",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.w900,fontSize: 20),)
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage('assets/breathing.png'),
                          height: 150,
                        ),
                        Text("\t\tBREATHING\n\t\tDIFFICULTY",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.w900,fontSize: 20),)
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 25,
              ),
              Center(child: Text("PRECAUTIONS",style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.w900,fontSize: 20),)),
              Container(
                child: GridView.count(
                  primary: false,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 10),
                  crossAxisCount: 1,
                  childAspectRatio: 0.94,
                  children: <Widget>[
                    Card(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/p1.png')
                          )
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/p2.png')
                          )
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/p3.png')
                          )
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/p4.png')
                          )
                        ),
                      ),
                    ),
                  ],
                ),
              ), 
            ],
          ),]
        ),
      ),
    ));
  }
}