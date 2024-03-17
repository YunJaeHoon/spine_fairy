import 'package:flutter/material.dart';
import 'package:spine_fairy/widgets/bottom_menu_bar.dart';
import 'package:spine_fairy/settings/settings.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: background,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Text(
                        '척추요정',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: mainGreen,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Icon(
                        Icons.settings_outlined,
                        size: 40,
                        color: Color.fromARGB(255, 54, 54, 54),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 90),
                    Text(
                      '오늘 남은 척추 알람의 횟수',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '0',
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: mainGreen,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 80.0,
                        left: 28.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '분석 결과를 보고 싶다면?',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.play_arrow,
                                size: 25,
                                color: mainGreen,
                              ),
                              Text(
                                '분석 결과 바로가기',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: mainGreen,
                                  decoration: TextDecoration.underline,
                                  decorationColor: mainGreen,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 35),
                          Text(
                            '알람 설정을 바꾸고 싶다면?',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: [
                             Icon(
                                Icons.play_arrow,
                                size: 25,
                                color: mainGreen,
                              ),
                              Text(
                                '알람 설정 바로가기',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: mainGreen,
                                  decoration: TextDecoration.underline,
                                  decorationColor: mainGreen,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            BottomMenuBar(
              pageNumber: 2,
            )
          ],
        ),
      ),
    );
  }
}