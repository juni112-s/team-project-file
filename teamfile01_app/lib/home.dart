import 'package:flutter/material.dart';
import 'package:teamfile01_app/view/first_page.dart';
import 'package:teamfile01_app/view/four_page.dart';
import 'package:teamfile01_app/view/second_page.dart';
import 'package:teamfile01_app/view/third_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
// tabbar를 만들기 위해서 with single로 덛붙여서 사용해야한다.
class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  //property
  late TabController controller;


  @override
  void initState() {
    super.initState();
    // tabcontroller 페이지 개수 와 위치를 정해줘야한다.
    controller = TabController(length: 4, vsync: this);
  }


  @override
  void dispose() {
    //똑같이 사용 종료를 시켜줘야 데이터를 없앨수 있다.
    controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar를 지운 이유는 뒤에 페이지의 appBar 와 겹쳐나오기 떄문에 지워준다.
      // appBar: AppBar(
      //   title: Text('Tab Bar Test'),
      // ),
      body: TabBarView(
        //controller를 먼저 잡아 줘야한다.
        controller: controller,
        children: [
          FirstPage(),
          SecondPage(),
          ThirdPage(),
          FourPage(),
        ],
      ),
      // 바텀 내비게이션 바는 컨테이너를 사용하여야 한다.
      bottomNavigationBar: Container(
        color: Colors.amber,
        height: 80,
        // 여기까지가 컨테이너 환경을 만들어 줌
        // 내용 삽입
        child: TabBar(
          controller: controller,
          //선택된  페이지 색깔이 바뀜
          labelColor: Colors.blue,
          //선택된 페이지 하단에 표시가 댐
          indicatorColor: Colors.red,
          indicatorWeight: 10,
          tabs: [
            Tab(
              //
              icon: Icon(Icons.looks_one),
              text: "One",
            ),
            Tab(
              icon: Icon(Icons.looks_two),
              text: "Two",
            ),
            Tab(
              icon: Icon(Icons.looks_3),
              text: "Third",
            ),
            Tab(
              icon: Icon(Icons.looks_4),
              text: "Four",
            ),

          ],
          ),
      ),
    );
  }
}