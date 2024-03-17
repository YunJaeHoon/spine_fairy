import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spine_fairy/screens/alarm_screen.dart';
import 'package:spine_fairy/screens/analysis_screen.dart';
import 'package:spine_fairy/screens/calendar_screen.dart';
import 'package:spine_fairy/screens/home_screen.dart';
import 'package:spine_fairy/screens/my_screen.dart';
import 'package:spine_fairy/settings/settings.dart';

const screens = [
  AlarmScreen(),
  CalendarScreen(),
  HomeScreen(),
  AnalysisScreen(),
  MyScreen(),
];

const icons = [
  'assets/icons/alarm_icon.svg',
  'assets/icons/calendar_icon.svg',
  'assets/icons/home_icon.svg',
  'assets/icons/analysis_icon.svg',
  'assets/icons/my_icon.svg'
];

class BottomMenuBar extends StatelessWidget {

  // 프로퍼티
  final int pageNumber;

  // 생성자
  const BottomMenuBar({
    super.key,
    required this.pageNumber,
  });

  // 빌드 메서드
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 14.0, bottom: 11.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MenuIcon(
              iconName: '알람',
              isActivate: pageNumber == 1,
              screenCode: 1,
            ),
            MenuIcon(
              iconName: '달력',
              isActivate: pageNumber == 2,
              screenCode: 2,
            ),
            MenuIcon(
              iconName: '홈',
              isActivate: pageNumber == 3,
              screenCode: 3,
            ),
            MenuIcon(
              iconName: '분석',
              isActivate: pageNumber == 4,
              screenCode: 4,
            ),
            MenuIcon(
              iconName: 'MY',
              isActivate: pageNumber == 5,
              screenCode: 5,
            ),
          ],
        ),
      ),
    );
  }
}

// 하단 메뉴 아이콘
class MenuIcon extends StatelessWidget {
  // 프로퍼티
  final String iconName;    // 아이콘 이름
  final bool isActivate;    // 아이콘 활성화 여부
  final int screenCode;     // 화면 코드

  // 생성자
  const MenuIcon({
    super.key,
    required this.iconName,
    required this.isActivate,
    required this.screenCode,
  });

  // 빌드 메서드
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: SvgPicture.asset(
            icons[screenCode - 1],
            width: 35,
            height: 35,
            color: isActivate ? iconGreen : iconGrey,
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return screens[screenCode - 1];
                },
              )
            );
          },
        ),
        const SizedBox(height: 4),
        Text(
          iconName,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: isActivate ? iconGreen : iconGrey,
          ),
        )
      ]
    );
  }
}