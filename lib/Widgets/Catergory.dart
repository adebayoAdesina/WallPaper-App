// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterpackage/Views/SearchCatergory.dart';
// import 'package:flutterpackage/Models/categoriesModel.dart';

class Category extends StatelessWidget {
  final imageURL, title;
  Category({@required this.title, @required this.imageURL});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchCatergory(categoriesNames: title.toString())));
      },
      child: Container(
        margin: EdgeInsets.only(right: 6),
        child: Stack( // for one widget above another
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(imageURL, height: 50, width: 100, fit: BoxFit.cover,)
            ),
            Container(
              decoration:  BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(16),
              ),
              height: 50, width: 100,
              alignment: Alignment.center,
              child: Text(title, style: 
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}