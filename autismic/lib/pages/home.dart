import 'package:autismic/models/feeling_check.dart';
import 'package:autismic/models/available_tools.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_generative_ai/src/model.dart';

class HomePage extends StatelessWidget {
  int selectedIndex = 0;
  HomePage({super.key, required GenerativeModel geminiVisionProModel, required GenerativeModel geminiProModel});

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
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

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
            height: 0.015 * deviceHeight,
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
            height: 0.015 * deviceHeight,
          ),
          Container(
            height: 0.17 * deviceHeight,
            //color: Color.fromARGB(255, 135, 95, 95),
            child: ListView.separated(
              itemCount: categories.length,
              padding: EdgeInsets.only(left: 20, right: 20),
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 0.03 * deviceWidth,
                );
              },
              scrollDirection: Axis.horizontal,
              itemBuilder: currentFeeling,
            ),
          ),
          SizedBox(
            height: 0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Tools',
              style: TextStyle(
                  fontFamily: 'Alegreya',
                  fontSize: 20,
                  color: Color(0xff371B34)),
            ),
          ),
          SizedBox(
            height: 0.015 * deviceHeight,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 0.33 * deviceHeight,
                width: double.infinity,
                child: ListView.separated(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      
                      height: 0.13*deviceHeight,
                      decoration: BoxDecoration(
                          color: tools[index].boxColor,
                          borderRadius: BorderRadius.circular(20)),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 0.02 * MediaQuery.of(context).size.height);
                  },
                  itemCount: tools.length,
                ),
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/Home.svg'), label: 'Home'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/Listen.svg'),
              label: 'Listen'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/settings.svg'),
              label: 'Settings')
        ],
      ),
    );
  }

  Widget? currentFeeling(context, index) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.width;
    return Column(children: [
      Container(
        width: 0.25 * deviceWidth,
        height: 0.25 * deviceWidth,
        decoration: BoxDecoration(
            color: categories[index].boxColor,
            borderRadius: BorderRadius.circular(25)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 0.12 * deviceWidth,
              height: 0.12 * deviceWidth,
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(8),
                //child: SvgPicture.asset(assetName),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 0,
      ),
      Container(
          child: Text(
        categories[index].name,
        style: TextStyle(
            fontFamily: 'Alegreya', fontSize: 20, color: Color(0xff371B34)),
      ))
    ]);
  }
}
