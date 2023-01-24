import 'package:age_6/screen/provider/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeProvider? providerT;
  HomeProvider? providerF;

  @override
  Widget build(BuildContext context) {
    providerT = Provider.of<HomeProvider>(context, listen: true);
    providerF = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
        child: Form(
          key: providerT!.key,
          child: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text("Age Calculator"),
          centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 20, top: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Toaday's Date",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.datetime,
                    controller: providerF!.txtTD,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Toaday's Date",
                    ),
                    onTap: () {
                      providerF!.Date(context);
                    },
                    validator: (value) {
                      if(value!.isEmpty)
                        {
                          return "Enter The Date";
                        }
                      else
                        {
                          return null;
                        }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Date Of Birth",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          controller: providerF!.txtDD,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "DD",
                          ),
                          validator: (value) {
                            if(value!.isEmpty)
                              {
                                return "Enter The  Date!";
                              }
                            else if(int.parse("${providerT!.txtDD.text}") >=32)
                              {
                                return "Please Enter The Valid Date";
                              }
                            else{
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          controller: providerF!.txtMM,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "MM",
                          ),
                          validator: (value) {
                            if(value!.isEmpty)
                            {
                              return "Enter The  Month!";
                            }
                            else if(int.parse("$value") >= 13)
                            {
                              return "Please Enter The Valid Month!";
                            }
                            else{
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          controller: providerF!.txtYY,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "YYYY",
                          ),
                          validator: (value) {
                            if(value!.isEmpty)
                            {
                              return "Enter The  Year!";
                            }
                            else if(value!.length >4)
                            {
                              return "Please Enter The Valid Month!";
                            }
                            else{
                              return null;
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white)),
                            onPressed: () {
                            providerF!.clear();
                            },
                            child: Center(
                              child: Text("Clear",style: TextStyle(color: Colors.black,fontSize: 20),),
                            )),
                      ),
                      SizedBox(width: 15,),
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.deepPurple)),
                            onPressed: () {
                              if(providerT!.key.currentState!.validate())
                              {
                                providerF!.Result();
                                providerF!.nextBirth();
                              }
                            },
                            child: Center(
                              child: Text("Calculate",style: TextStyle(color: Colors.white,fontSize: 20),),
                            )),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Visibility(
                  visible: providerT!.vis,
                  child: SizedBox(
                    width: 320,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                              child: Text("Present Age",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                        ),
                        Container(
                          height: 150,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(blurRadius: 5,color: Colors.deepPurple)
                            ]
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${providerF!.Y} years",style: TextStyle(fontSize: 22,color: Colors.white),),
                                SizedBox(width: 10,),
                                Text("${providerF!.M} months",style: TextStyle(fontSize: 22,color: Colors.white),),
                                SizedBox(width: 10,),
                                Text("${providerF!.D} days",style: TextStyle(fontSize: 22,color: Colors.white),),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text("Next Birthday",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                        ),
                        Container(
                          height: 150,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(blurRadius: 5,color: Colors.deepPurple)
                            ]
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${providerF!.NM} months",style: TextStyle(fontSize: 22,color: Colors.white),),
                                SizedBox(width: 10,),
                                Text("${providerF!.ND} days",style: TextStyle(fontSize: 22,color: Colors.white),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
      ),
    ),
        ));
  }
}
