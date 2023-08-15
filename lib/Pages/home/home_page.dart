import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Pages/home/main_food_page.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key?key}):super(key:key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex=0;
  late PersistentTabController _controller;


  List pages=[
    MainfoodPage(),
    Container(child: Center(child: Text("NextPage"),),),
    Container(child: Center(child: Text("NextPage 2"),),),
    Container(child: Center(child: Text("NextPage"),),),
  ];

  void onTapNav(int index){
    setState(() {
      _selectedIndex=index;
    });
  }

/*  @override
  void initState(){
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
       selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        currentIndex: _selectedIndex,
        onTap:  onTapNav,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label:'home',
          
          
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label:Text("Home").toString(),


          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart ),
            label:Text("Home").toString(),


          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label:Text("Home").toString(),


          ),
        ],
      ),
    );
  }



}
