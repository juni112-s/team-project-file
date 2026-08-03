import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late TextEditingController num1Controller;  // 첫번째 숫자 입력창
  late TextEditingController num2Controller;  // 두번째 숫자 입력창

  late String resultString;
  late TextEditingController addController;   // 덧셈 결과
  @override
  void initState() {
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();    
    addController = TextEditingController();
    resultString = "";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: num1Controller,
                decoration: InputDecoration(
                  labelText: '숫자를 입력하세요',
                  border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.number,
              ),
            ),            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: num2Controller,
                decoration: InputDecoration(
                  labelText: '숫자를 입력하세요',
                  border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.number,
              ),
            ),     
            SizedBox(height: 50,),  
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => numbercalc(), 
                  child: Text('결과 확인'),
                ),
                SizedBox(width: 30,),
                ElevatedButton(
                  onPressed: () => remove(), 
                  child: Text('지우기'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                  controller: addController,
                  decoration: InputDecoration(
                    labelText: "덧셈 결과",
                    border: OutlineInputBorder()
                  ),
                  keyboardType: TextInputType.text,
                  readOnly: true,
                ),
            ),              
            Text(
              resultString,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.red
              ),
              
              )
          ],
        ),
      ),
    );
  }
    void numbercalc(){
    if(num1Controller.text.trim().isNotEmpty && num2Controller.text.trim().isNotEmpty){
    numbercheck();
    }else{
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('숫자를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
        ),
      );
    }
  }

    void numbercheck(){
  int num1 = int.parse(num1Controller.text.trim());
  int num2 = int.parse(num2Controller.text.trim());
  int addResult = num1 + num2;
  addController.text = addResult.toString();
    
  resultString = "$num1 + $num2 = $addResult";

  }

  
  void remove(){
      num1Controller.text = "";
          }

}