import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
   CategoryCard({super.key , required this.title } );
 var title = "";
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
          height: 90,
          width:160 ,
        
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(17)
            
          ),
          child: Center(child: Text("$title")),
        ),
    );
  }
}