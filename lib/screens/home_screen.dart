import 'package:flutter/material.dart';
import 'package:flutter_9/resources/auth_methods.dart';
import 'package:flutter_9/screens/history_meeting_screen.dart';
import 'package:flutter_9/screens/meeting_screen.dart';
import 'package:flutter_9/utils/colors.dart';
import 'package:flutter_9/widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

 
  @override
  Widget build(BuildContext context) {
     List<Widget > pages = [
    MeetingScreen(),
    const HistoryMeetingScreen(),
   
    Center(child: CustomButton(text: 'Log Out', onPressed: () => AuthMethods().signOut(context))),
  ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: footerColor,
        elevation: 0,
        title: const Text('Meet & Chat'),
        centerTitle: true,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble_rounded,
            ),
            label: 'Meet & Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.access_time,
            ),
            label: 'Meetings',
          ),
          
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}