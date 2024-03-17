import 'package:flutter/material.dart';
import 'package:spine_fairy/screens/home_screen.dart';

// 앱 실행
void main()
{
  runApp(const App());
}

// 앱 위젯
class App extends StatefulWidget
{
  // 생성자
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // build 메서드
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // 폰트 설정
        fontFamily: 'NotoSansKR',
      ),
      home: const HomeScreen(),
    );
  }
}
