import 'package:campus_collaborate/constants/skills.dart';
import 'package:flutter/material.dart';

class SkillContainer extends StatelessWidget {
  final SkillsEnum skill;
  const SkillContainer({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: SkillsComponents.getSkillColor(skill),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        skill.name,
        style: const TextStyle(
            fontSize: 13, color: Colors.black, fontWeight: FontWeight.w400),
      ),
    );
  }
}
