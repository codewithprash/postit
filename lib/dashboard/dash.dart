import 'package:flutter/material.dart';
import 'package:postit/dashboard/post_it.dart';
import 'package:postit/dashboard/apipost.dart';

class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  int index = 0;
  final screens = [
    const Postitpage(),
    const Apipost(),
  ];
  //final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[index],
        bottomNavigationBar: NavigationBarTheme(
          data: const NavigationBarThemeData(
            height: 60,
          ),
          child: NavigationBar(
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
              selectedIndex: index,
              onDestinationSelected: (index) =>
                  setState(() => this.index = index),
              destinations: const [
                NavigationDestination(
                    icon: Icon(
                      Icons.mail_outline,
                      color: Colors.blue,
                    ),
                    selectedIcon: Icon(
                      Icons.mail,
                      color: Colors.blue,
                    ),
                    label: 'POSTit'),
                NavigationDestination(
                    icon: Icon(
                      Icons.dashboard_customize_outlined,
                      color: Colors.blue,
                    ),
                    selectedIcon: Icon(
                      Icons.dashboard,
                      color: Colors.blue,
                    ),
                    label: 'API data'),
              ]),
        ),
      );
}
