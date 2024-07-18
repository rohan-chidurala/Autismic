import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:autismic/pages/home.dart';

class HistoryPage extends StatefulWidget {
  final GenerativeModel geminiVisionProModel;
  final GenerativeModel geminiProModel;

  const HistoryPage({super.key, required this.geminiVisionProModel, required this.geminiProModel});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late GenerativeModel geminiVisionProModel;
  late GenerativeModel geminiProModel;
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),  // Replace with your actual HomePage widget
    ListenPage(),  // Replace with your actual ListenPage widget
    SettingsPage(),  // Replace with your actual SettingsPage widget
  ];

  @override
  void initState() {
    super.initState();
    _initializeModels();
  }

  void _initializeModels() {
    geminiVisionProModel = widget.geminiVisionProModel;
    geminiProModel = widget.geminiProModel;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/Home.svg'), label: 'Home'),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/Listen.svg'), label: 'Listen'),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/settings.svg'), label: 'Settings')
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Home Page'));
  }
}

class ListenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Listen Page'));
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Settings Page'));
  }
}
