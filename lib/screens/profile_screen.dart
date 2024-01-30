import 'package:campus_collaborate/models/user_info.dart';
import 'package:campus_collaborate/services/roll_number_decoder.dart';
import 'package:campus_collaborate/widgets/commonWidgets/app_bar.dart';
import 'package:campus_collaborate/widgets/commonWidgets/common_container.dart';
import 'package:campus_collaborate/widgets/commonWidgets/skills_container.dart';
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
    final RollNumberDecoder rollNumberDecoder =
        RollNumberDecoder(rollNumber: int.parse(widget.userInfo.rollNumber));
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar('Profile', () {}),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Row(
                   children: [
                     const Icon(
                       Icons.supervised_user_circle,
                       size: 90,
                     ),
                     const SizedBox(
                       width: 10,
                     ),
                     Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           widget.userInfo.name,
                           style: const TextStyle(fontSize: 13),
                         ),
                         Text(
                           widget.userInfo.rollNumber,
                           style: const TextStyle(fontSize: 13),
                         ),
                         Text(
                           rollNumberDecoder.getBranch(),
                           style: const TextStyle(fontSize: 13),
                         ),
                         const Text(
                           'B.Tech',
                           style: TextStyle(fontSize: 13),
                         ),
                       ],
                     ),
                   ],
                 ),
                  GestureDetector(
                    child: Column(
                      children: [
                        Image.asset('assets/logout.png', width: 30, height: 30,),
                        const Text('Logout', style: TextStyle(fontSize: 10),)
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CommonContainer(children: [
                const Text(
                  'Skills',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                SkillsListView(skillsList: widget.userInfo.skills),
              ]),
              const SizedBox(height: 20,),
              CommonContainer(children: [
                const Text(
                  'Courses',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                SkillsListView(skillsList: widget.userInfo.courses),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
