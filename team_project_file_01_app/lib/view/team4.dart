import 'package:flutter/material.dart';

class Team4 extends StatefulWidget {
  const Team4({super.key});

  @override
  State<Team4> createState() => _Team4State();
}

class _Team4State extends State<Team4> {
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('팀 프로젝트 메인'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/kang'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: BeveledRectangleBorder()),
              child: Text('강석준 페이지'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/kim'),
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: BeveledRectangleBorder()),

                child: Text('김다은 페이지'),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/lee'),
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: BeveledRectangleBorder()),

              child: Text('이규혁 페이지'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/sung'),
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: BeveledRectangleBorder()),

                child: Text('성기혁 페이지'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}