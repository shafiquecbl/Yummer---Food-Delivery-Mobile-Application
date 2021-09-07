import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderHistoryCard extends StatefulWidget {
  const OrderHistoryCard({Key? key}) : super(key: key);

  @override
  _OrderHistoryCardState createState() => _OrderHistoryCardState();
}

class _OrderHistoryCardState extends State<OrderHistoryCard> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return
      SingleChildScrollView(
      child: Column(
        children: [


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: InkWell(
              child:

              Container(

                decoration: BoxDecoration(color: Colors.white,
                ),
                height: 100.0,
                width: width,
                child:
                Row(
                  children: [
                    Image.asset("assets/foodpand.png",width: 100.0,height: 100.0,),
                    SizedBox(width: 4.0,),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(top: 12.0,left: 20,bottom: 8),
                          child: Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(child: Text("Filada Family Bar",style: TextStyle(color: Colors.black,fontSize: 14.0),)),

                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(child: Text("May 26,2021",style: TextStyle(color: Colors.black54,fontSize: 12.0),)),
                              ],
                            ),
                          ),
                        ),

                        Row(children: [

                          SizedBox(width: 5.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 0.0,right: 5.0),

                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15.0),
                                      child: Text("Delivered ",
                                        style: TextStyle(fontSize: 14.0,
                                            color: Colors.green),),
                                    ),
                                    Icon(Icons.check,color: Colors.green,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40.0),
                                      child: Text("\$",style: TextStyle(color: Colors.black,fontSize: 16.0),),
                                    ),
                                    Text(("16").toString(),
                                      style: TextStyle(fontSize: 15.0,
                                          color: Colors.black),),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],),
                        Flexible(child: Container(
                          //remove cart item
                        )),


                      ],
                    ))
                  ],
                ),
              ),
            ),
          ),

        ],
      ));
  }
}


