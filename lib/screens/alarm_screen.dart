import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spine_fairy/settings/alarm_count_setting_screen.dart';
import 'package:spine_fairy/settings/alarm_sound_setting_screen.dart';
import 'package:spine_fairy/widgets/bottom_menu_bar.dart';
import 'package:spine_fairy/settings/settings.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({
    super.key,
  });

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {

  late SharedPreferences prefs;     // 사용자의 저장소와 연결될 인스턴스

  int alarmCount = 3;               // 알람 횟수
  int quietTimeCount = 0;           // 방해 금지 시간대 개수
  String alarmMode = 'RINGTONE';    // 벨소리 모드
  int alarmSound = 0;               // 선택된 알람음 index
  bool isVibrate = true;            // 진동 유무

  // 초기화 함수
  Future initPrefs() async
  {
    prefs = await SharedPreferences.getInstance();    // 사용자의 저장소와 연결

    if(prefs.getInt('alarmCount') != null)
    {
      setState(() {
        alarmCount = prefs.getInt('alarmCount')!;
        quietTimeCount = prefs.getInt('quietTimeCount')!;
        alarmMode = prefs.getString('alarmMode')!;
        alarmSound = prefs.getInt('alarmSound')!;
        isVibrate = prefs.getBool('isVibrate')!;
      });
    }
    else
    {
      await prefs.setInt('alarmCount', 3);
      await prefs.setInt('quietTimeCount', 0);
      await prefs.setString('alarmMode', 'RINGTONE');
      await prefs.setInt('alarmSound', 0); 
      await prefs.setBool('isVibrate', false);
    }
  }

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  // '+', '-' 버튼을 눌렀을 시에 실행될 함수
  changeQuietTimeCount({required bool isPlus}) async
  {
    if(isPlus)
    {
      await prefs.setInt('quietTimeCount', quietTimeCount + 1);
      setState(() {
        quietTimeCount++;
      });
    }
    else
    {
      await prefs.setInt('quietTimeCount', quietTimeCount - 1);
      setState(() {
        quietTimeCount--;
      });
    }
  }

  // 알람 모드(벨소리, 진동, 무음) 버튼을 눌렀을 시에 실행될 함수
  changeAlarmMode({required String modeName}) async
  {
    if(modeName == 'RINGTONE')
    {
      await prefs.setString('alarmMode', 'RINGTONE');
      setState(() {
        alarmMode = 'RINGTONE';
      });
    }
    else if(modeName == 'VIBRATION')
    {
      await prefs.setString('alarmMode', 'VIBRATION');
      setState(() {
        alarmMode = 'VIBRATION';
      });
    }
    else if(modeName == 'SILENT')
    {
      await prefs.setString('alarmMode', 'SILENT');
      setState(() {
        alarmMode = 'SILENT';
      });
    }
  }

  // 진동 유무 버튼을 눌렀을 시에 실행될 함수
  changeIsVibrate() async
  {
    await prefs.setBool('isVibrate', !isVibrate);
    setState(() {
      isVibrate = !isVibrate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 58),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: Text(
                            '척추 알람',
                            style: TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                              color: mainGreen,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26.0),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '알람 횟수',
                                style: TextStyle(
                                  fontSize: 23,
                                  color: mainGrey,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '하루에',
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              const SizedBox(width: 15),
                              GestureDetector(
                                child: EditForm(
                                  name: '      $alarmCount      ',
                                  nameSize: 35,
                                  nameWeight: FontWeight.w600,
                                  formWidth: 150,
                                  isCenter: true,
                                ),
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) {
                                        return const AlarmCountSettingScreen();
                                      },
                                    )
                                  );
                                },
                              ),
                              const SizedBox(width: 15),
                              const Text(
                                '번',
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 45),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '방해 금지 시간대 설정',
                                style: TextStyle(
                                  fontSize: 23,
                                  color: mainGrey,
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    child: const Icon(
                                      Icons.add,
                                      size: 35,
                                      color: Color.fromARGB(255, 53, 53, 53),
                                    ),
                                    onTap: () {
                                      if(quietTimeCount < 5)
                                      {
                                        changeQuietTimeCount(isPlus: true);
                                      }
                                    },
                                  ),
                                  GestureDetector(
                                    child: const Icon(
                                      Icons.remove,
                                      size: 35,
                                      color: Color.fromARGB(255, 53, 53, 53),
                                    ),
                                    onTap: () {
                                      if(quietTimeCount > 0)
                                      {
                                        changeQuietTimeCount(isPlus: false);
                                      }
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 18),
                          for(var i = 0; i < quietTimeCount; i++) QuietTimeWidget(number: i),
                          const SizedBox(height: 48),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                child: AlarmModeButton(
                                  buttonName: '벨소리',
                                  isActivatedMode: alarmMode == 'RINGTONE',
                                ),
                                onTap: () {
                                  changeAlarmMode(modeName: 'RINGTONE');
                                },
                              ),
                              GestureDetector(
                                child: AlarmModeButton(
                                  buttonName: '진동',
                                  isActivatedMode: alarmMode == 'VIBRATION',
                                ),
                                onTap: () {
                                  changeAlarmMode(modeName: 'VIBRATION');
                                },
                              ),
                              GestureDetector(
                                child: AlarmModeButton(
                                  buttonName: '무음',
                                  isActivatedMode: alarmMode == 'SILENT',
                                ),
                                onTap: () {
                                  changeAlarmMode(modeName: 'SILENT');
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 38),
                          alarmMode == 'RINGTONE' ?
                          Column(
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '알람음',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: mainGrey,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              GestureDetector(
                                child: EditForm(
                                  name: alarmSounds[alarmSound],
                                  nameSize: 23,
                                  nameWeight: FontWeight.w500,
                                  formWidth: 380,
                                  isCenter: false,
                                ),
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) {
                                        return const AlarmSoundSettingScreen();
                                      },
                                    )
                                  );
                                },
                              ),
                              const SizedBox(height: 32),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text(
                                    '진동 유무',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: mainGrey,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Padding(
                                    padding: isVibrate ? EdgeInsets.zero : const EdgeInsets.only(left: 2.4, bottom: 2.4),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: isVibrate ?
                                        null :
                                        Border.all(
                                          color: isVibrate ? mainGreen : iconGrey,
                                          width: 1.4
                                        ),
                                        borderRadius: BorderRadius.circular(50.0)
                                      ),
                                      child: GestureDetector(
                                        child: Icon(
                                          Icons.circle,
                                          color: isVibrate ? mainGreen : const Color(0xffF8F8F8),
                                          size: isVibrate ? 27 : 20,
                                        ),
                                        onTap: () {
                                          changeIsVibrate();
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 50),
                            ],
                          ) :
                          const SizedBox(width: 0, height: 0)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const BottomMenuBar(
              pageNumber: 1,
            )
          ],
        ),
      ),
    );
  }
}

// 방해 금지 시간대 위젯
class QuietTimeWidget extends StatefulWidget {

  final int number;

  const QuietTimeWidget({
    super.key,
    required this.number,
  });

  @override
  State<QuietTimeWidget> createState() => _QuietTimeWidgetState();
}

class _QuietTimeWidgetState extends State<QuietTimeWidget> {

  late SharedPreferences prefs;     // 사용자의 저장소와 연결될 인스턴스

  List<String> startQuietTime = ['00:00','00:00','00:00','00:00','00:00'];    // 방해 금지 시작 시간 리스트
  List<String> overQuietTime = ['00:00','00:00','00:00','00:00','00:00'];     // 방해 금지 종료 시간 리스트

  // 초기화 함수
  Future initPrefs() async
  {
    prefs = await SharedPreferences.getInstance();     // 사용자의 저장소와 연결

    if(prefs.getInt('alarmCount') != null)
    {
      setState(() {
        startQuietTime = prefs.getStringList('startQuietTime')!;
        overQuietTime = prefs.getStringList('overQuietTime')!;
      });
    }
    else
    {
      await prefs.setStringList('startQuietTime', ['00:00','00:00','00:00','00:00','00:00']);
      await prefs.setStringList('overQuietTime', ['00:00','00:00','00:00','00:00','00:00']);
    }
  }

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  // 방해 금지 시간대 수정 시에 실행될 함수
  changeQuietTime({required bool isStart, required int index, required String value}) async
  {
    final timeList = isStart ? prefs.getStringList('startQuietTime') : prefs.getStringList('overQuietTime');

    if(timeList != null)
    {
      timeList[index] = value;

      if(isStart)
      {
        await prefs.setStringList('startQuietTime', timeList);
        setState(() {
          startQuietTime[index] = value;
        });
      }
      else
      {
        await prefs.setStringList('overQuietTime', timeList);
        setState(() {
          overQuietTime[index] = value;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: EditForm(
              name: startQuietTime[widget.number],
              nameSize: 28,
              nameWeight: FontWeight.w500,
              formWidth: 150,
              isCenter: true,
            ),
            onTap: () async {

              final TimeOfDay? time = await showTimePicker(
                context: context,
                initialTime: const TimeOfDay(hour: 0, minute: 0)
              );

              if (time != null) {
                changeQuietTime(
                  isStart: true,
                  index: widget.number,
                  value: '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}'
                );
              }

            },
          ),
          const SizedBox(width: 15),
          const Text(
            '~',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(width: 15),
          GestureDetector(
            child: EditForm(
              name: overQuietTime[widget.number],
              nameSize: 28,
              nameWeight: FontWeight.w500,
              formWidth: 150,
              isCenter: true,
            ),
            onTap: () async {
      
              final TimeOfDay? time = await showTimePicker(
                context: context,
                initialTime: const TimeOfDay(hour: 0, minute: 0)
              );

              if (time != null) {
                changeQuietTime(
                  isStart: false,
                  index: widget.number,
                  value: '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}'
                );
              }

            },
          ),
        ],
      ),
    );
  }
}

// 수정 버튼 양식
class EditForm extends StatelessWidget {

  final String name;
  final double nameSize;
  final FontWeight nameWeight;
  final double formWidth;
  final bool isCenter;

  const EditForm({
    super.key,
    required this.name,
    required this.nameSize,
    required this.nameWeight,
    required this.formWidth,
    required this.isCenter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: formWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: isCenter ? EdgeInsets.zero : const EdgeInsets.only(left: 15, bottom: 5),
                  child: isCenter ?
                  Center(
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: nameSize,
                        fontWeight: nameWeight,
                      ),
                    ),
                  ) :
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: nameSize,
                      fontWeight: nameWeight,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 3.0),
                child: Icon(
                  Icons.edit_rounded,
                  size: 20,
                  color: Color(0xffBBBBBB),
                ),
              )
            ],
          ),
        ),
        Container(
          color: const Color(0xffBBBBBB),
          width: formWidth,
          height: 2.4,
        )
      ],
    );
  }
}

// 벨소리 | 진동 | 무음 선택 버튼
class AlarmModeButton extends StatelessWidget {

  final String buttonName;
  final bool isActivatedMode;

  const AlarmModeButton({
    super.key,
    required this.buttonName,
    required this.isActivatedMode
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isActivatedMode ? mainGreen : const Color(0xffD9D9D9)
      ),
      width: 110,
      height: 41,
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            color: isActivatedMode ? Colors.white : mainGrey,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}