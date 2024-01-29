import 'package:campus_collaborate/constants/skills.dart';
import 'package:campus_collaborate/models/user_info.dart';
import 'package:campus_collaborate/widgets/commonWidgets/app_bar.dart';
import 'package:campus_collaborate/widgets/commonWidgets/common_container.dart';
import 'package:campus_collaborate/widgets/commonWidgets/skillsContainer.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final UserInfo userInfo;
  const ProfileScreen({super.key, required this.userInfo});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar('Profile', () {}),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 30),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.supervised_user_circle, size: 100,),
                  const SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Manik', style: TextStyle(fontSize: 15),),
                      Text('220107052', style: TextStyle(fontSize: 15),),
                      Text('Manik', style: TextStyle(fontSize: 15),),
                      Text('Manik', style: TextStyle(fontSize: 15),),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10,),
              CommonContainer(children: [
                Text(
                  'Skills',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 5,),
                SkillContainer(skill: SkillsEnum.javascript)
              ])
            ],
          ),
        ),
      ),
    );
  }
}
