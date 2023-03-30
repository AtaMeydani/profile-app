import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'components/skill_item.dart';
import 'consts.dart';

class MyHomePage extends StatefulWidget {
  final Function() toggleThemeMode;
  final Function(Language language) toggleLanguage;

  const MyHomePage(
      {super.key, required this.toggleThemeMode, required this.toggleLanguage});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Skill selectedSkill = Skill.photoshop;
  Language selectedLanguage = Language.en;

  void updateSelectedSkill(Skill selectedSkill) {
    setState(() {
      this.selectedSkill = selectedSkill;
    });
  }

  void updateSelectedLanguage(Language selectedLanguage) {
    widget.toggleLanguage(selectedLanguage);
    setState(() {
      this.selectedLanguage = selectedLanguage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localization.profileTitle),
        actions: [
          const Icon(CupertinoIcons.chat_bubble),
          const SizedBox(
            width: 8,
          ),
          InkWell(
            onTap: widget.toggleThemeMode,
            child: const Icon(CupertinoIcons.ellipsis_vertical),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/images/profile_image.png",
                    width: 60,
                    height: 60,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localization.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(localization.job),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.location,
                            color:
                                Theme.of(context).textTheme.titleMedium!.color,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            localization.localeName,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Icon(
                  CupertinoIcons.heart,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
            child: Text(
              localization.summary,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(localization.selectedLanguage),
                CupertinoSlidingSegmentedControl<Language>(
                  groupValue: selectedLanguage,
                  thumbColor: Theme.of(context).colorScheme.primary,
                  children: {
                    Language.en: Text(localization.enLanguage),
                    Language.fa: Text(localization.faLanguage),
                  },
                  onValueChanged: (value) => updateSelectedLanguage(value!),
                )
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  localization.skills,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  width: 2,
                ),
                const Icon(
                  CupertinoIcons.chevron_down,
                  size: 12,
                ),
              ],
            ),
          ),
          Center(
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 8,
              runSpacing: 2,
              children: [
                SkillItem(
                  skill: Skill.photoshop,
                  title: "Photoshop",
                  imagePath: "assets/images/app_icon_01.png",
                  shadowColor: Colors.blue,
                  isActive: selectedSkill == Skill.photoshop,
                  onTap: () => updateSelectedSkill(Skill.photoshop),
                ),
                SkillItem(
                  skill: Skill.lightRoom,
                  title: "Lightroom",
                  imagePath: "assets/images/app_icon_02.png",
                  shadowColor: Colors.blue,
                  isActive: selectedSkill == Skill.lightRoom,
                  onTap: () => updateSelectedSkill(Skill.lightRoom),
                ),
                SkillItem(
                  skill: Skill.afterEffect,
                  title: "After Effect",
                  imagePath: "assets/images/app_icon_03.png",
                  shadowColor: Colors.blue.shade900,
                  isActive: selectedSkill == Skill.afterEffect,
                  onTap: () => updateSelectedSkill(Skill.afterEffect),
                ),
                SkillItem(
                  skill: Skill.illustrator,
                  title: "Illustrator",
                  imagePath: "assets/images/app_icon_04.png",
                  shadowColor: Colors.orangeAccent,
                  isActive: selectedSkill == Skill.illustrator,
                  onTap: () => updateSelectedSkill(Skill.illustrator),
                ),
                SkillItem(
                  skill: Skill.xd,
                  title: "Adobe XD",
                  imagePath: "assets/images/app_icon_05.png",
                  shadowColor: Colors.redAccent,
                  isActive: selectedSkill == Skill.xd,
                  onTap: () => updateSelectedSkill(Skill.xd),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localization.personalInformation,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: localization.email,
                    prefixIcon: const Icon(CupertinoIcons.at),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: localization.password,
                    prefixIcon: const Icon(CupertinoIcons.lock),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(localization.save),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
