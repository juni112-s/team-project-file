import 'dart:async';

import 'package:flutter/material.dart';

class KangPage extends StatefulWidget {
  const KangPage({super.key});

  @override
  State<KangPage> createState() => _KangPageState();
}

class _KangPageState extends State<KangPage> {
  late TextEditingController textController;
  late TextEditingController text2Controller;
  late Timer _timer;


  late List<String> listName;
  late int currenter;
  late String str;

  late List<String> list2Name;
  late int number;
  late String str2;
  

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    text2Controller = TextEditingController();
    

    //=============첫번쨰 광고 변수 및 타이머=====================
    str = "";
    listName = "".split("");
    currenter = 0;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) => timeattack());
    //================================================




    //=================두번째 광고 변수 및 타이머=================
    str2 = "";
    list2Name = "".split("");
    number = 0;
    _timer = Timer.periodic(Duration(seconds: 2), (timer) => textfiletimer(),);
    //================================================


  } 

  // 적어 놓앗던 메모리를 지우기 위해서 dispose 사용.
  @override
  void dispose() {
    textController.dispose();
    text2Controller.dispose();

    _timer.cancel();
    super.dispose();
  }



    //=================첫번쨰 광고 함수 ===========================
    void timeattack(){
    if(currenter >= listName.length){
      currenter = 0;
      str = "";
    }else{
      str += listName[currenter];
      currenter++;
      }setState(() {});
    }
    //===========================================================

    //==============두번쨰 광고 함수================================
    void textfiletimer(){
    if(number >= list2Name.length){
      number = 0;
      str2 = "";
    }else{
      str2 += list2Name[number];
      number++;
    }setState(() {});
    }
   //=============================================================


   


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text('LED 광고'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        backgroundColor: Colors.amber,
        child: Column(
          children: [
            DrawerHeader(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Center(
                  child: Text('광고 문구를 입력하세요',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber
                  ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    suffix: IconButton(
                      onPressed: newtext, 
                      icon: Icon(Icons.send)),
                      // ElevatedButton(
                      // onPressed: newtext, 
                      // child: Text('확인')),
                    labelText: '글자를 입력하세요',
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: text2Controller,
                  decoration: InputDecoration(
                    suffix: IconButton(
                      onPressed: newtext2, 
                      icon: Icon(Icons.send),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.red
                      ),),
                      // ElevatedButton(
                      // onPressed: newtext, 
                      // child: Text('확인')),
                    labelText: '글자를 입력하세요',
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(str,
            style: TextStyle(
              color: Colors.red,
              fontSize: 50,
              fontWeight: FontWeight.bold
              ),
            ),
            Text(str2,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 40,
              fontWeight: FontWeight.bold
              ),
            ),
            
          ],
        ),
      ),
    );
  }

  // 첫번쨰 텍스트 필드의 아이콘 함수
  void newtext(){
    if(textController.text.trim().isNotEmpty){
      listName = textController.text.trim().split("");
      currenter = 0;
      str = "";
      textController.clear();
    }
    Navigator.of(context).pop();
  }
 // ====================================================
 // 두번쨰 텍스트 필드의 아이콘 함수
  void newtext2(){
    if(text2Controller.text.trim().isNotEmpty){
      list2Name = text2Controller.text.trim().split("");
      number = 0;
      str2 = "";
      text2Controller.clear();
    }
    Navigator.of(context).pop();
  }
}
