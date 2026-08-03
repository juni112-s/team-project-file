import 'package:flutter/material.dart';

class FourPage extends StatefulWidget {
  const FourPage({super.key});

  @override
  State<FourPage> createState() => _FourPageState();
}

class _FourPageState extends State<FourPage> {
  ///입력을 받을 텍스트 에디팅 컨트롤러들
  late TextEditingController input1Controller, input2Controller;
  ///출력값을 보여주는 컨트롤러
  late TextEditingController resultStringController;

  @override
  void initState() {
    super.initState();
    input1Controller = TextEditingController();
    input2Controller = TextEditingController();
    resultStringController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('나눗셈'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            SizedBox(
              width: 150,
              height: 50,
              child: TextField(
                controller: input1Controller,
                decoration: InputDecoration(
                  labelText: '분자 입력',
                  border: OutlineInputBorder(),
                ),
                keyboardType: .number,
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              width: 150,
              height: 50,
              child: TextField(
                controller: input2Controller,
                decoration: InputDecoration(
                  labelText: '분모 입력',
                  border: OutlineInputBorder(),
                ),
                keyboardType: .number,
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: onPressedCalculateButton, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                ),
                textStyle: TextStyle(
                  fontWeight: .w900,
                  fontSize: 20
                )
              ),
              child: Text('계산 및 출력')
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 300,
              height: 50,
              child: GestureDetector(
                onDoubleTap: () => resultStringController.text = "",
                child: TextField(
                  readOnly: true,
                  controller: resultStringController,
                  decoration: InputDecoration(
                    labelText: '결과는 여기에 표시됩니다.',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPressedCalculateButton(){
    double? input1 = double.tryParse(input1Controller.text.trim());
    double? input2 = double.tryParse(input2Controller.text.trim());
    if(input1==null || input2==null){
      showDialog(
        context: context, 
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text('경고'),
            content: Text('모든 칸에 숫자만을 입력하세요.'),
            shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(5)
                  ),
            actionsAlignment: .center,
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(), 
                child: Text('네 알겠습니다')
              )
            ],
          );
        },
      );
      resultStringController.text = '모든 칸에 숫자만을 입력하세요.';
    }else if(input2 == 0){
      showDialog(
        context: context, 
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text('경고'),
            content: Text('0으로 나눌 수 없습니다.'),
            shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(5)
                  ),
            actionsAlignment: .center,
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(), 
                child: Text('네 알겠습니다')
              )
            ],
          );
        },
      );
      resultStringController.text = '0으로 나눌 수 없습니다.';
    }else{
      var inputNumber1 = input1%1==0?input1.toInt():input1;
      var inputNumber2 = input2%1==0?input2.toInt():input2;
      var resultNumber = input1/input2%1==0?(input1/input2).toInt():input1/input2;
      resultStringController.text = '$inputNumber1 ÷ $inputNumber2 = $resultNumber';
    }
    setState(() {});
  }
}