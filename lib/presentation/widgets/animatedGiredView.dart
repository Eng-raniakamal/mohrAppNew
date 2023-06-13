
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';



  GridView buildAnimatedGridView(BuildContext context) {
    return
      GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 3,
        children: List.generate(6, (index) {
          return AnimationConfiguration.staggeredGrid(
              position: index,
              columnCount: 3,
              child: ScaleAnimation(
                duration: Duration(milliseconds: 3000),
                child: FadeInAnimation(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 150,
                      width: 150,
                      color: Colors.deepOrange,
                      child: Center(
                        child: Text(
                          "Requests",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ));
        }),

      );
  }
