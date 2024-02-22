import 'package:flutter/material.dart';
import 'package:spine_fairy/screens/home_screen.dart';

const mainGreen =  Color(0xff3AA346);   // 메인 초록색

// 앱 실행
void main()
{
  runApp(const App());
}

// 앱 위젯
class App extends StatelessWidget
{
  // 생성자
  const App({super.key});

  // build 메서드
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSansKR',
      ),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            // 배경
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffFFFFFF),
                Color(0xffFDFDFD)
              ],
            )
          ),
          child: const HomeScreen(),
        )
      ),
    );
  }
}
