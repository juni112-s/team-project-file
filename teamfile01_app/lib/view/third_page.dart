import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  late TextEditingController num1Controller;
  late TextEditingController num2Controller;
  late String result;

  @override
  void initState() {
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    result = '';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('곱셈'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: num1Controller,
                decoration: InputDecoration(
                  labelText: '숫자를 입력하세요',
                  border:  OutlineInputBorder()
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: num2Controller,
                decoration: InputDecoration(
                  labelText: '숫자를 입력하세요',
                  border:  OutlineInputBorder()
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              onPressed: mulAction,
              child: Text('ok')
            ),
            Text(
              result,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

    void _snackBar(String message, Color color){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: Duration(seconds: 2),
          backgroundColor: color,
        ),
      );
    }
    
    void mulAction(){
    if(num1Controller.text.trim().isNotEmpty && num2Controller.text.trim().isNotEmpty){
      int num1 = int.parse(num1Controller.text.trim());
      int num2 = int.parse(num2Controller.text.trim());
      int sum = num1 * num2;
      result = "$num1 * $num2 = $sum";
      setState(() {});
    }else{
      _snackBar('숫자를 입력하세요', Colors.red);
    }
    
  }
}