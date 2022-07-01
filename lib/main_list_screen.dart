import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_switch/flutter_switch.dart';
import 'package:task_project/task_obj.dart';


void main() {
  runApp(MaterialApp(home: SafeArea(child: Scaffold(body: MainListScreen(),)),));
}

class MainListScreen extends StatefulWidget {

  @override
  State<MainListScreen> createState() => _MainListScreenState();
}

class _MainListScreenState extends State<MainListScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  Future<List<TaskObj>>? getFutureList;

  Future<List<TaskObj>> getFutureData() async {

     var response = await http
         .get(Uri.parse("https://jsonplaceholder.typicode.com/users"), headers: {"Accept": "application/json"});
     List res = json.decode(response.body);
     // print(res);
     if (response.statusCode == 200) {
       print("status 200");
       // return json.decode(response.body);
       var data = res.map((job) => TaskObj.fromJson(job)).toList();
       // return dao.getStudentFromLocal();
       return data;
     } else {
       throw Exception('Failed to load student');
     }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      getFutureList = getFutureData();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        },backgroundColor: Colors.cyan,
      ),
      key: _scaffoldKey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.3,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(-10),bottomRight: Radius.circular(-10),)
            // ),
            // color: Colors.blueAccent,
            child: Stack(
              children: <Widget>[
                Container(
                  color: Colors.green.shade300,
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.all(Radius.circular(50))
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 170.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.0),
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.5), width: 1.0),
                          color: Colors.white),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.search,
                            ),
                            onPressed: () {
                              print("your menu action here");
                            },
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search Package",
                              ),
                            ),
                          ),

                          IconButton(
                            icon: Icon(
                              Icons.menu,
                            ),
                            onPressed: () {
                              print("your menu action here");
                              _scaffoldKey.currentState!.openDrawer();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              // color: Colors.red,
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(30), color: Colors.green),
              height: MediaQuery.of(context).size.height*0.8,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("Hide Scanned",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                          SizedBox(width: 20,),
                          FlutterSwitch(
                            width: 65.0,
                            height: 30.0,
                            valueFontSize: 15.0,
                            toggleSize: 25.0,
                            value: true,
                            activeColor: Colors.green.shade700,
                            borderRadius: 20.0,
                            padding: 8.0,
                            showOnOff: false,
                            onToggle: (val) {
                              // setState(() {
                              //   status = val;
                              // });
                            },
                          ),


                        ],
                      ),
                      Row(
                        children: [
                          Text("Group by route",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                          SizedBox(width: 20,),
                          FlutterSwitch(
                            width: 65.0,
                            height: 30.0,
                            valueFontSize: 15.0,
                            toggleSize: 25.0,
                            value: false,
                            activeColor: Colors.green.shade700,
                            borderRadius: 20.0,
                            padding: 8.0,
                            showOnOff: false,
                            onToggle: (val) {
                              // setState(() {
                              //   status = val;
                              // });
                            },
                          ),


                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: FutureBuilder<List<dynamic>>(
                      future: getFutureList,
                      builder: (BuildContext context,AsyncSnapshot snapshot){
                        var _datas = snapshot.data;
                        if (snapshot.hasData){
                          return ListView.builder(
                            itemCount: _datas.length ?? 0,
                            itemBuilder: (context, index) {
                              TaskObj _data = _datas[index];
                              return Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(_data.name!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                    SizedBox(height: 10,),
                                    Text(_data.company!.name!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),
                                    SizedBox(height: 10,),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.home,color: Colors.grey,),
                                              Text(_data.address!.city!),
                                            ],
                                          ),
                                          SizedBox(width: 10,),
                                          Row(
                                            children: [
                                              Icon(Icons.route,color: Colors.grey,),
                                              Text(_data.address!.street!),
                                            ],
                                          ),
                                          SizedBox(width: 10,),
                                          Row(
                                            children: [
                                              Icon(Icons.account_circle,color: Colors.grey,),
                                              Text(_data.name!),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                  ],
                                ),
                              );
                            },
                          );
                        }else{
                          return Center(
                            child: LinearProgressIndicator(color: Colors.green,),
                          );
                        }
                      }
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}