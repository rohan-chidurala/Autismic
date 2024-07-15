import 'package:flutter/material.dart';

class Tool {
  String name;
  String description;
  Color boxColor;
  bool viewIsSelected;

  Tool({
    required this.name,
    required this.description,
    required this.boxColor,
    required this.viewIsSelected
  


  });

  static List<Tool> getTools() {
    List<Tool> tools = [];
    tools.add(
      Tool(
        name: 'Voice to Emotion', 
        description: 'description', 
        boxColor: Color(0xffFCDDEC), 
        viewIsSelected: false
        )
    );

    tools.add(
        Tool(
          name: 'Text to Image', 
          description: 'description', 
          boxColor: Color(0xffF09E54), 
          viewIsSelected: false
          )
      );
    

    return tools;
    
  }


}