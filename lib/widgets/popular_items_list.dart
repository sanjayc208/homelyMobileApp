import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// This is the stateful widget that the main application instantiates.
class PopularItemList extends StatefulWidget {
  const PopularItemList({Key? key }) 
   : super(key: key);

  @override
  State<PopularItemList> createState() => _PopularItemListState();
}

/// This is the private State class that goes with PopularItemList.
class _PopularItemListState extends State<PopularItemList> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

     var populatItems = ["https://www.cookwithmanali.com/wp-content/uploads/2021/07/Tandoori-Roti.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm46VrK-OY4D0Q7VAEcMj9e0EUJoFjo0oaVQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkbpGXA8wNPkpjEhYIWrX0AQ57CpoIamaP2A&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0wq7dQzvJJb7ufwe1RhXJbg-ga6JYVMp6kw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgOCC-rC16IQyNQhiVrlr2K0ROfXDTsBDzKA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS02SOfIG5WuNSe_y2vSG1fb383xSXzK82Qsg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStgF888GAUTFv_H56HNEDpH4YzVvXOTaNvjQ&usqp=CAU"];


    return Column(
        children: <Widget>[
          Text("Popular Home Food Around You", style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
            fontSize: 18)
          ),
          Divider(
            color: Colors.red,
            indent: 120,
            thickness: 3,
            endIndent: 120,
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: <Widget>[
                for(var images in populatItems) popularItemCard(images)
                ]
              )
            ),
        ],
      );
  }

  
popularItemCard(images) {
  return Card(
    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Container(
      color: Colors.red,
      width: 80,
      height: 80,
      child: Image.network(
        images,
        fit: BoxFit.fill,
      ),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    elevation: 3,
    margin: EdgeInsets.all(10),
  );
}
}