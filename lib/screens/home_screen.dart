import 'package:flutter/material.dart';
import 'package:spine_fairy/widgets/bottom_menu_bar.dart';
import 'package:spine_fairy/screens/alarm_screen.dart';
import 'package:spine_fairy/screens/analysis_screen.dart';
import 'package:spine_fairy/settings/settings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 52),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 28.0),
                      child: Text(
                        '척추요정',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: mainGreen,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 72),
                    const Text(
                      '오늘 남은 척추 알람의 횟수',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: mainGrey,
                      ),
                    ),
                    const Text(
                      '0',
                      style: TextStyle(
                        fontSize: 82,
                        fontWeight: FontWeight.bold,
                        color: mainGreen,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 60.0,
                        left: 28.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '분석 결과를 보고 싶다면?',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                              color: mainGrey,
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(-5, 5),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) {
                                      return const AnalysisScreen();
                                    },
                                  )
                                );
                              },
                              child: const Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.play_arrow,
                                    size: 25,
                                    color: mainGreen,
                                  ),
                                  Text(
                                    '분석 결과 바로가기',
                                    style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.w500,
                                      color: mainGreen,
                                      decoration: TextDecoration.underline,
                                      decorationColor: mainGreen,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 35),
                          const Text(
                            '알람 설정을 바꾸고 싶다면?',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                              color: mainGrey,
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(-5, 5),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) {
                                      return const AlarmScreen();
                                    },
                                  )
                                );
                              },
                              child: const Row(
                                children: [
                                 Icon(
                                    Icons.play_arrow,
                                    size: 25,
                                    color: mainGreen,
                                  ),
                                  Text(
                                    '알람 설정 바로가기',
                                    style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.w500,
                                      color: mainGreen,
                                      decoration: TextDecoration.underline,
                                      decorationColor: mainGreen,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            const BottomMenuBar(pageNumber: 3)
          ],
        ),
      ),
    );
  }
}