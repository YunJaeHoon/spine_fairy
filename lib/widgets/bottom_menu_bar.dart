import 'package:flutter/material.dart';

const mainGreen =  Color(0xff3AA346);   // 메인 초록색
const mainGray =  Color(0xffAAAAAA);    // 메인 회색

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MenuIcon(
            iconShape: Icons.notifications,
            iconName: '알람',
            isActivate: pageNumber == 1
          ),
          MenuIcon(
            iconShape: Icons.calendar_month,
            iconName: '달력',
            isActivate: pageNumber == 2
          ),
          MenuIcon(
            iconShape: Icons.home_filled,
            iconName: '홈',
            isActivate: pageNumber == 3
          ),
          MenuIcon(
            iconShape: Icons.description,
            iconName: '분석',
            isActivate: pageNumber == 4
          ),
          MenuIcon(
            iconShape: Icons.medical_services,
            iconName: '정보',
            isActivate: pageNumber == 5
          ),
        ],
      ),
    );
  }
}

// 하단 메뉴 아이콘
class MenuIcon extends StatelessWidget {

  // 프로퍼티
  final IconData iconShape;                       // 아이콘 종류
  final String iconName;                          // 아이콘 이름
  final bool isActivate;                          // 색상 결정

  // 생성자
  const MenuIcon({
    super.key,
    required this.iconShape,
    required this.iconName,
    required this.isActivate,
  });

  // 빌드 메서드
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        children: [
          Icon(
            iconShape,
            size: 45,
            color: isActivate ? mainGreen : mainGray,
          ),
          Text(
            iconName,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: isActivate ? mainGreen : mainGray,
            ),
          )
        ]
      ),
    );
  }
}