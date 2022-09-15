
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget{
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState(){
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    Scaffold(body: Text("Home")),
    Scaffold(body: Text("Running")),
    Scaffold(body: Text("Week")),
  ];

  void _onBottomNavBarItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onBottomNavBarItemTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.directions_run), label: 'Run'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_view_week), label: 'Week'),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Logan's Weather App"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.info),
              onPressed: (){
                  //Navigator push to information tab
              },
            ),
          ],
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildBottomNavBar(),
          ],
        ));
  }
}
