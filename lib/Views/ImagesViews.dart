
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'package:permission_handler/permission_handler.dart';

class ImageViews extends StatefulWidget {
  final String imageURL;
  ImageViews({required this.imageURL});

  @override
  _ImageViewsState createState() => _ImageViewsState();
}

class _ImageViewsState extends State<ImageViews> {

  _save() async {
    if (Platform.isAndroid) {
      await _askPermission();
    }
   var response = await Dio().get(
           widget.imageURL,
           options: Options(responseType: ResponseType.bytes));
   final result = await ImageGallerySaver.saveImage(
           Uint8List.fromList(response.data),
           );
   Navigator.pop(context);
  }

  _askPermission() async {
    if(Platform.isIOS) {
      await Permission.photos.request();
    }else {
     await [Permission.storage].request();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
        Hero(
          tag: widget.imageURL,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(widget.imageURL, fit: BoxFit.cover,),
          ),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            GestureDetector(
              onTap: () {
                _save();
              },
              child: Stack(
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width/2,
                    decoration: BoxDecoration(
                      color: Color(0xff1c1818).withOpacity(0.8),
                      borderRadius: BorderRadius.circular(30)
                    )
                  ),
                  Container(
                  width: MediaQuery.of(context).size.width/2,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),border:  Border.all(color: Colors.white54, width: 1),
                    gradient: LinearGradient(colors: [Color(0x36ffffff), Color(0x0FFFFFFF)]),
                  ),
                  child: Column(
                    children: [Text('Set WallPaper', style: TextStyle(color: Colors.white),),Text('Image will be save in Gallery', style: TextStyle(color: Colors.white, fontSize: 12),)],
                  ),
                ),
                ]),
            ),
            SizedBox(height: 5,),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Text('cancel', style: TextStyle(color: Colors.white),),
              ),
            ),
            SizedBox(height: 50,)
          ],),
        ), 
      ],),
    );
  }
}