import 'package:flutter/material.dart';

const backgroundColor1 = Color(0xffFFFFFF);   // 배경 그라데이션 상단
const backgroundColor2 = Color(0xffFAFAFA);   // 배경 그라데이션 하단

// 배경
const background = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      backgroundColor1,
      backgroundColor2
    ],
  )
);

const mainGreen =  Color(0xff61A052);         // 메인 초록색
const mainGrey = Color(0xff434343);           // 글자 메인 색

const iconGreen = Color(0xff59A661);          // 활성화 아이콘 색깔
const iconGrey =  Color(0xffBBBBBB);          // 비활성화 아이콘 색깔

const List<String> alarmSounds = ['벨소리 1', '벨소리 2', '벨소리 3', '벨소리 4', '벨소리 5'];    // 알람음

// --------------------------------------------------------------------------

// 로컬 저장소에 저장된 변수들

/*

// 알람 설정

late int alarmCount;    // 알람 횟수

late int quietTimeCount;   // 방해 금지 시간대 개수
late List<String> startQuietTime;    // 방해 금지 시작 시간 리스트
late List<String> overQuietTime;     // 방해 금지 종료 시간 리스트

late String alarmMode ;   // 벨소리 모드 : 'RINGTONE' | 진동 모드 : 'VIBRATION' | 무음 모드 : 'SILENT'

late int alarmSound;    // 선택된 알람음 index

late bool isVibrate;   // 진동 유무

*/