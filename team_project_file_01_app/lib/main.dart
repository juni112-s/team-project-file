import 'package:flutter/material.dart';
import 'package:team_project_file_01_app/view/kang_seok_jun/kang_page.dart';
import 'package:team_project_file_01_app/view/kim_da_eun/kim_page.dart';
import 'package:team_project_file_01_app/view/lee_kyu_hyuk/lee_page.dart';
import 'package:team_project_file_01_app/view/sung_ki_hyuk/sung_page.dart';
import 'package:team_project_file_01_app/view/team4.dart';
//gyjfdhgyt
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "",
      routes: {
        "/" :(context) => Team4(),
        "/kang" :(context) => KangPage(),
        "/kim" :(context) => KimPage(),
        "/lee" :(context) => LeePage(),
        "/sung" :(context) => SungPage(),
      },
    );
  }
}
