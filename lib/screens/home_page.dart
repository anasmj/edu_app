import 'package:education_app/screens/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'mathmatics_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentTab = 0;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Home Page'),
      actions: const [
        Icon(Icons.notifications, color: Colors.green,),
      ],
    ),
    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentTab,
      onTap: (int value)=> setState(()=> _currentTab = value),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.book),label: 'Subjects'),
        BottomNavigationBarItem(icon: Icon(Icons.notifications),label: 'Notification'),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
      ],

    ),
    body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: searchField(),
        ),
        SizedBox(
              height: 200,
              child: categoryGridView()
          ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
               Text('Recommended Course',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,letterSpacing: 0.01), ),

               Text('more', style: TextStyle(color: Colors.grey, letterSpacing: 0.1),),
            ],
          ),
        ),
        const SizedBox(height: 8.0,),
        SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
               getRecommendedCourses(title: 'Memorizing Textbook',bgColor: Colors.greenAccent,ratePoint: 8.6, imageUrl: 'assets/book.jpg') ,
               getRecommendedCourses(title: 'English Reading',bgColor: Colors.blueAccent,ratePoint: 8.0,imageUrl: 'assets/english.jfif') ,
               getRecommendedCourses(title: 'Math Basics',bgColor: Colors.red,ratePoint: 9.5,imageUrl: 'assets/math.jpg') ,
               getRecommendedCourses(title: 'History',bgColor: Colors.orangeAccent,ratePoint: 6.8,imageUrl: 'assets/history.jfif') ,
               getRecommendedCourses(title: 'Geography',bgColor: Colors.brown,ratePoint: 7.9,imageUrl: 'assets/geography.jpg') ,
              ],
            ),
          ),
      ],
    ),
  );

  Widget searchField ()=> Column(
    children: [
      TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[300],
          prefixIcon: const Icon(Icons.search,),
          hintText: 'Search',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),

      ),
    ],
  );

  Widget categoryGridView () => GridView(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 30,
      mainAxisSpacing: 0,

    ),
    children:  [
      getOptions(avatarColor: Colors.orangeAccent, avatarIcon: const Icon(Icons.settings), title: 'Category'),
      getOptions(avatarColor: Colors.blue, avatarIcon: const Icon(Icons.document_scanner), title: 'Free Course'),
      getOptions(avatarColor: Colors.green, avatarIcon: const Icon(Icons.play_arrow), title: 'Online Class'),
      getOptions(avatarColor: Colors.red, avatarIcon: const Icon(Icons.card_giftcard), title: 'Bookstore'),
      getOptions(avatarColor: Colors.blueAccent, avatarIcon: const Icon(Icons.play_circle_fill), title: 'Live Courses'),
      getOptions(avatarColor: Colors.greenAccent, avatarIcon: const Icon(Icons.screen_lock_landscape), title: 'Leaderboard'),
    ],

  );
  Widget getOptions(
      {required Color avatarColor,
        required Icon avatarIcon,
        required title}) =>
      Column(
        children: [
          CircleAvatar(
            backgroundColor: avatarColor,
            child: avatarIcon,
            radius: 25,
          ),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w500,letterSpacing: 0.10),),
        ],
      );

  Widget getRecommendedCourses ({required Color bgColor, required String title, required double ratePoint, required imageUrl} )=> GestureDetector(
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MathScreen()
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey ,
                offset: Offset(0.0, 2.0),
                blurRadius: 2.0,
                spreadRadius: 0.0
            ),
          ],
        ),
        //color: Colors.red,
        height: 250,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:  8.0),
              child: Text(title, style: const TextStyle(fontWeight: FontWeight.w500),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:  8.0),
              child: Text(ratePoint.toString(), style:  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:  8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:   const [
                  Expanded(
                      child:  AppRatingBar(),
                  ),
                  Icon(Icons.favorite, color: Colors.red,),
                ],
              ),
            )

          ],
        ),
      ),
    ),
  );


}