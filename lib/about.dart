import 'package:flutter/material.dart';
import 'dart:io';
import 'package:coronatracker/main.dart';
import 'package:coronatracker/symptoms.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  final String text0 ="First reported from Wuhan, China, on 31 December 2019.";
  final String text1= "Coronaviruses (CoV) are a large family of viruses that cause illness ranging from the common cold to more severe diseases such as Middle East Respiratory Syndrome (MERS-CoV) and Severe Acute Respiratory Syndrome (SARS-CoV). A novel coronavirus (nCoV) is a new strain that has not been previously identified in humans.";
  final String text2="Coronaviruses are zoonotic, meaning they are transmitted between animals and people.  Detailed investigations found that SARS-CoV was transmitted from civet cats to humans and MERS-CoV from dromedary camels to humans. Several known coronaviruses are circulating in animals that have not yet infected humans. ";
  
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
        title: Text('ABOUT CORONAVIRUS'),
        backgroundColor: Colors.purple,
      ),
      body:  Center(
        child: Card(color: Colors.green,
        child: 
        Container(
          height: MediaQuery.of(context).size.height*0.9,
          width: MediaQuery.of(context).size.width*0.95,
          color: Colors.black54,
          child: SingleChildScrollView(
                      child: Column(
              children: <Widget>[
                Center(child: Text('\nABOUT CORONAVIRUS\n\n',style: TextStyle(color: Colors.yellow,fontFamily: 'cursive',fontSize: 28),)),
                Center(child: Text(text0+"\n",style: TextStyle(fontSize: 18),)),
                Center(child: Text(text1+"\n",style: TextStyle(fontSize: 18))),
                Center(child: Text(text2+"\n",style: TextStyle(fontSize: 18))),
              ],
            ),
          ),
          ),),
      ),
    );
  }
}