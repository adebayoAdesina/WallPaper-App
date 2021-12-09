import 'package:flutter/material.dart';

Widget brandName () {
  return Center(
    child: RichText(
      
    text: TextSpan(
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      children: [
        TextSpan(text: 'Wall', style: TextStyle(color: Colors.white)),
        TextSpan(text: 'Paper', style: TextStyle(color: Colors.black)),
      ],
    ),
),
  );
}