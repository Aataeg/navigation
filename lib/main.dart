import 'package:flutter/material.dart';
import 'package:navigation/aboutus.dart';
import 'package:navigation/feedback.dart';

void main() {
  runApp(const NavigationTest());
}

const List<String> _drawerList = <String>['Главная','Обратная связь'];
const List<String> _drawerListDivider = <String>['О нас'];
int _indexBottomBar = 0;
const List<BottomNavigationBarItem> _bottomBar = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Домой',),
  BottomNavigationBarItem(
    icon: Icon(Icons.local_post_office_outlined),
    label: 'Обратная связь',),
  BottomNavigationBarItem(
    icon: Icon(Icons.info_outline),
    label: 'О нас',), ];


class NavigationTest extends StatefulWidget {
  const NavigationTest({Key? key}) : super(key: key);

  @override
  _NavigationTestState createState() => _NavigationTestState();
}

class _NavigationTestState extends State<NavigationTest> {


  @override
  Widget build(BuildContext context) {
    //   globalContext = context;
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/feedback': (context) => const FeedBack(),
        '/aboutus': (context) => const AboutUs(),
      },
    );
  }
}


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTest(),
      drawer: menuDrawer(context),
      body: Container(
        alignment: Alignment.center,
        child: Text('Главная страница'),
      ),
      bottomNavigationBar: bottomNavBar(context),
    );
  }
}

class AppBarTest extends StatelessWidget implements PreferredSizeWidget{

  @override
  Widget build(BuildContext context){
    return AppBar(actions: [
      IconButton(onPressed: (){
        _indexBottomBar = 2;
        Navigator.pushNamed(context, '/aboutus');
      }, icon: Icon(Icons.info_outline),),
      IconButton(onPressed: (){
        _indexBottomBar = 1;
        Navigator.pushNamed(context, '/feedback');
      }, icon: const Icon(Icons.local_post_office_outlined),),
      IconButton(onPressed: (){
        _indexBottomBar = 0;
        Navigator.of(context).popUntil(ModalRoute.withName('/'));
      }, icon: Icon(Icons.home)),
    ],);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

Widget? menuDrawer(context) =>
    Container(
      width: 250,
      child: Drawer(
        child: ListView(
            children: [
              DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(85, 154, 209, 1),
                  ),
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.zero,
                    child: Image(image: AssetImage('assets/city-skyline.jpg'),),
                  )
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: _drawerList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20),
                    //                  color: Colors.blue,
                    height: 50,
                    child: ListTile(
                      title: Text(_drawerList[index], style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(85, 154, 209, 1),
                      ),),
                      onTap: () {
                        switch (index) {
                          case 0:
                            {
                              _indexBottomBar = 0;
                              Navigator.of(context).popUntil(ModalRoute.withName('/'));
                              break;
                            }
                          case 1:
                            {
                              _indexBottomBar = 1;
                              Navigator.pushNamed(context, '/feedback');
                              break;
                            }
                        }
                      },
                    ),
                  );
                },
              ),
              Divider(),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: _drawerListDivider.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20),
                    height: 50,
                    child: ListTile(
                      title: Text(
                        _drawerListDivider[index], style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(85, 154, 209, 1),
                        //fontStyle: FontStyle.normal,
                      ),),
                      onTap: () {
                        switch (index) {
                          case 0:
                            {
                              _indexBottomBar = 2;
                              Navigator.pushNamed(context, '/aboutus');
                              break;
                            }
                        }
                      },
                    ),
                  );
                },
              ),

            ]
        ),
      ),
    );

Widget? bottomNavBar(context) => BottomNavigationBar(
  items: _bottomBar,
  currentIndex: _indexBottomBar,
  onTap: (int index) {switch (index) {
    case 0:
      {
        _indexBottomBar = index;
        Navigator.of(context).popUntil(ModalRoute.withName('/'));
        break;
      }
    case 1:
      {
        _indexBottomBar = index;
        Navigator.pushNamed(context, '/feedback');
        break;
      }
    case 2:
      {
        _indexBottomBar = index;
        Navigator.pushNamed(context, '/aboutus');
        break;
      }
  }},
);







