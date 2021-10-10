import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class ItemsList extends StatefulWidget {
  const ItemsList({Key? key}) : super(key: key);

  @override
  State<ItemsList> createState() => _ItemsListState();
}

/// This is the private State class that goes with ItemsList.
class _ItemsListState extends State<ItemsList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var items = [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyBrKwEdYqApv4VKFgBbaYZ70waYxkqxP2Hg&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyBrKwEdYqApv4VKFgBbaYZ70waYxkqxP2Hg&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyBrKwEdYqApv4VKFgBbaYZ70waYxkqxP2Hg&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyBrKwEdYqApv4VKFgBbaYZ70waYxkqxP2Hg&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyBrKwEdYqApv4VKFgBbaYZ70waYxkqxP2Hg&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyBrKwEdYqApv4VKFgBbaYZ70waYxkqxP2Hg&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyBrKwEdYqApv4VKFgBbaYZ70waYxkqxP2Hg&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyBrKwEdYqApv4VKFgBbaYZ70waYxkqxP2Hg&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyBrKwEdYqApv4VKFgBbaYZ70waYxkqxP2Hg&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyBrKwEdYqApv4VKFgBbaYZ70waYxkqxP2Hg&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyBrKwEdYqApv4VKFgBbaYZ70waYxkqxP2Hg&usqp=CAU"
    ];

    return Column(children: <Widget>[
      Text(
        "Homely Food",
        style: TextStyle(
            color: Colors.grey[800], fontWeight: FontWeight.bold, fontSize: 18),
      ),
      Divider(
        color: Colors.red,
        indent: 120,
        thickness: 3,
        endIndent: 120,
      ),
      for(var images in items) itemCardList(images)
    ]);
  }

  itemCardList(String images){
    return Card(
        elevation: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 6, // 20%
              child: Container(
                child: Column(
                  children: <Widget>[
                    const ListTile(
                      title: Text('The Anita Home Food'),
                      subtitle: Text(
                          'We have Good food and juicies .Which is good for health'),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4, // 20%
              child: Container(
              child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyBrKwEdYqApv4VKFgBbaYZ70waYxkqxP2Hg&usqp=CAU'),
            ),
            )
          ],
        ),
      );
  }
}
