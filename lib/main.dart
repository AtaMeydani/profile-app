import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/skill_item.dart';
import 'consts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile Projects",
      home: const MyHomePage(),
      // To share a Theme across the entire app
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.pink.shade400,
        dividerTheme: const DividerThemeData(
          color: Colors.white10,
          indent: 32,
          thickness: 0.5,
        ),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color.fromARGB(255, 30, 30, 30),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        textTheme: GoogleFonts.latoTextTheme(const TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
          titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color.fromARGB(200, 255, 255, 255)),
          bodyLarge: TextStyle(fontSize: 15),
          bodyMedium: TextStyle(fontSize: 13),
        )),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Skill selectedSkill = Skill.photoshop;

  void updateSelectedSkill(Skill selectedSkill) {
    setState(() {
      this.selectedSkill = selectedSkill;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Curriculum Vitae"),
        actions: const [
          Icon(CupertinoIcons.chat_bubble),
          SizedBox(
            width: 8,
          ),
          Icon(CupertinoIcons.ellipsis_vertical),
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      "Brice Séraphin",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    const Text("Product& Product Designer"),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.location,
                          color: Theme.of(context).textTheme.titleMedium!.color,
                          size: 18,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Paris, France",
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
          padding: EdgeInsets.fromLTRB(32, 0, 32, 16),
          child: Text(
            "Enthusiastic young computer Geek, Freelance Designer in love of independence, I have alot of experience in graphical projects, and always give the best of myself to bring you to success.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 16, 32, 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Skills",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.w900),
              ),
              SizedBox(
                width: 2,
              ),
              Icon(
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
            runSpacing: 8,
            children: [
              SkillItem(
                skill: Skill.photoshop,
                title: "Photoshop",
                imagePath: "assets/images/app_icon_01.png",
                shadowColor: Colors.blue,
                isActive: selectedSkill == Skill.photoshop,
                onTap: () => updateSelectedSkill(Skill.photoshop),
              )
            ],
          ),
        )
      ]),
    );
  }
}
