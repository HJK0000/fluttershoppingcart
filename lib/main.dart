import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShopPage(),
    );
  }
}

class ShopPage extends StatelessWidget {

  List<String> imageList = [
    "https://picsum.photos/id/100/200/200",
    "https://picsum.photos/id/101/200/200"

  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    print("ShopPage 그림 그려짐");

    return Scaffold(
      appBar: AppBar(title: Text("쇼핑카트")),
      body: Column(
        children: [
          // 1. 이미지
          AspectRatio(
            aspectRatio: 3 / 2,
            child: Image.network(
              imageList[selectedIndex],
              fit: BoxFit.cover,
            ),
          ),

          // 2. 버튼 2개
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  onPressed: () {
                    selectedIndex = 0;
                    print("selectedIndex : $selectedIndex");
                  },
                  icon: Icon(Icons.account_circle_sharp),
                ),
              ),
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  onPressed: () {
                    selectedIndex = 1;
                    print("selectedIndex : $selectedIndex");
                  },
                  icon: Icon(Icons.apple),
                ),
              ),
            ],
          ),
          // 3. 동그라미 2개
          _circle(),
          _field(),

        ],
      ),
    );
  }

  Stack _field() {
    return Stack(
          children: [
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.person),
                enabledBorder: OutlineInputBorder(),
              ),
            ),
            Positioned(
                left: 200,
                top: 50,
                child: Icon(Icons.person)),

          ],
        );
  }

  Container _circle() {
    return Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Align(
            alignment: Alignment(1.0, 0.0),
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(75),
              ),
            ),
          ),
        );
  }
}
