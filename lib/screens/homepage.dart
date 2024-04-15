import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:restaurantrating/constants/color_constants.dart';
import 'package:restaurantrating/screens/home.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends  StatefulWidget  {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Text(
      'Index 1: Page',
      style: optionStyle,
    ),
    Text(
      'Index 2: Page',
      style: optionStyle,
    ),
    Text(
      'Index 3: Page',
      style: optionStyle,
    ),
  ];

  StreamSubscription <ServiceStatus>? _streamSubscription;

  @override
  void initState() {
    _streamSubscription = Geolocator.getServiceStatusStream().listen(
            (ServiceStatus status) {
           print(status);
          if(status == ServiceStatus.disabled){
            Location().requestService();
          }

        });
    super.initState();
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorConstants.backgroundColor,
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
               BottomNavigationBarItem(
                icon: Icon(Icons.home,size: 30),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.heart,size: 30),
                label: '',
              ),
              BottomNavigationBarItem(
                icon:Icon(CupertinoIcons.person,size: 30),
                label: '',
              ),
              BottomNavigationBarItem(
                icon:Icon(Icons.history,size:30),
                label: '',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: ColorConstants.blueColor,
            unselectedItemColor: ColorConstants.unSelectedBottomIconColor,
            onTap: _onItemTapped,
          )),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}
