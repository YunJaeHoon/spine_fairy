import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spine_fairy/screens/alarm_screen.dart';
import 'package:spine_fairy/settings/settings.dart';

class AlarmCountSettingScreen extends StatefulWidget {
  const AlarmCountSettingScreen({super.key});

  @override
  State<AlarmCountSettingScreen> createState() => _AlarmCountSettingScreenState();
}

class _AlarmCountSettingScreenState extends State<AlarmCountSettingScreen> {

  late SharedPreferences prefs;   // 사용자의 저장소와 연결될 인스턴스
  int alarmCount = 3;             // 알람 횟수

  // 초기화 함수
  Future initPrefs() async
  {
    prefs = await SharedPreferences.getInstance();    // 사용자의 저장소와 연결

    if(prefs.getInt('alarmCount') != null)
    {
      setState(() {
        alarmCount = prefs.getInt('alarmCount')!;
      });
    }
    else
    {
      await prefs.setInt('alarmCount', 3);
    }
  }

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  // 알람 횟수를 바꿀 시에 실행될 함수
  void setAlarmCount(int number) async
  {
    await prefs.setInt('alarmCount', number);
    setState(() {
      alarmCount = number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: background,
        child: Column(
          children: [
            const SizedBox(height: 55),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 15),
                  child: GestureDetector(
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 40,
                      color: mainGrey,
                    ),
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
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 55),
                    child: Text(
                      '알람 횟수',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 37,
                        fontWeight: FontWeight.bold,
                        color: mainGrey
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 30,
                itemBuilder: (context, index) {
                  return SelectForm(
                    number: index + 1,
                    alarmCount: alarmCount,
                    setAlarmCountFunction: setAlarmCount,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectForm extends StatelessWidget {

  final int number;
  final int alarmCount;
  final void Function(int) setAlarmCountFunction;

  const SelectForm({
    super.key,
    required this.number,
    required this.alarmCount,
    required this.setAlarmCountFunction,
  });

  @override
  Widget build(BuildContext context) {
    bool isActivate = ( alarmCount == number );

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 26),
                child: Text(
                  '$number번',
                  style: const TextStyle(
                    fontSize: 23.5,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: isActivate ? 26 : 28.5),
                child: Container(
                  decoration: BoxDecoration(
                    border: isActivate ?
                    null :
                    Border.all(
                      color: isActivate ? mainGreen : iconGrey,
                      width: 1.4
                    ),
                    borderRadius: BorderRadius.circular(50.0)
                  ),
                  child: GestureDetector(
                    child: Icon(
                      Icons.circle,
                      color: isActivate ? mainGreen : const Color(0xffF8F8F8),
                      size: isActivate ? 27 : 20,
                    ),
                    onTap: () {
                      setAlarmCountFunction(number);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        number != 30 ?
        Container(
          color: const Color(0xffBBBBBB),
          width: 380,
          height: 2.5,
        ) :
        const SizedBox(width: 0, height: 50)
      ],
    );
  }
}