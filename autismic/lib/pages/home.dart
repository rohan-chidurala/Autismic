import 'package:autismic/models/feeling_check.dart';
import 'package:autismic/models/available_tools.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<FeelingCheck> categories = [];
  List<Tool> tools = [];
  void getCategories() {
    categories = FeelingCheck.getCategories();
  }
  void getTools() {
    tools = Tool.getTools();
  }

  void initState() {
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    getCategories();
    getTools();
    var appBar = AppBar(
      title: RichText(
        text: const TextSpan(children: <TextSpan>[
          TextSpan(
              text: 'Welcome Back, ',
              style: TextStyle(
                  fontFamily: 'Alegreya',
                  fontSize: 30,
                  color: Color(0xff371B34))),
          TextSpan(
              text: 'Sarina!',
              style: TextStyle(
                  fontFamily: 'Alegreya',
                  fontSize: 30,
                  color: Color(0xff371B34),
                  fontWeight: FontWeight.bold))
        ]),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'How are you feeling right now?',
              style: TextStyle(
                  fontFamily: 'Alegreya',
                  fontSize: 20,
                  color: Color(0xff371B34)),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 200,
            //color: Color.fromARGB(255, 135, 95, 95),
            child: ListView.separated(
              itemCount: categories.length,
              padding: EdgeInsets.only(left: 20, right: 20),
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 15,
                );
              },
              scrollDirection: Axis.horizontal,
              itemBuilder: currentFeeling,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Tools',
              style: TextStyle(
                fontFamily: 'Alegreya',
                fontSize: 20,
                color: Color(0xff371B34)
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Color.fromARGB(255, 238, 233, 219),
                height: 380,
                width: double.infinity,
                child: ListView.separated(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                    width: 20,
                    height: 50,
                    decoration: BoxDecoration(
                      color: tools[index].boxColor,
                      borderRadius: BorderRadius.circular(25) 
                      
                    ),
                    

                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 20);
                  },
                  itemCount: tools.length,
                  
                ),

              )

            ],
          )

        ],
      ),
    );
  }

  Widget? currentFeeling(context, index) => Column(
                children: 
                [
                  Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: categories[index].boxColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          //child: SvgPicture.asset(assetName),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  child: 
                    Text(
                        categories[index].name,
                        style: TextStyle(
                          fontFamily: 'Alegreya',
                          fontSize: 20,
                          color: Color(0xff371B34)
                          
                        ),
                      )
                )
                ]
                
                
              );
}
