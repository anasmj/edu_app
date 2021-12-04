import 'package:education_app/screens/widgets.dart';
import 'package:flutter/material.dart';

class MathScreen extends StatelessWidget{

  bool mathematics = true;

  @override
  Widget build(BuildContext context) => Scaffold(

    appBar: AppBar(
      title: const Text('Subject'),
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.edit),
        ),
      ],
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
            getOptions(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getMathItem(color: Colors.greenAccent, title: 'Test', subTitle: 'Test Knowledge', iconData: Icons.bookmark),
                const SizedBox(
                  width: 20,
                ),
                getMathItem(color: Colors.blueAccent, title: 'Summerize', subTitle: 'Study Routine', iconData: Icons.edit),
              ],
            ),
            const SizedBox(height: 20.0,),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: const Color(0xffF0E7E7),
                child:Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20.0),
                      child: ListView(
                            children: [
                              const Text(
                                'Recommended Course',
                                style: TextStyle(fontSize: 22, letterSpacing: 0.001),
                              ),
                              recommendedCourses(avatarColor: Colors.yellow, icon: Icons.star,title: 'Positive rotation', subTitle: const Text('Recently updated ',),buttonColor: Colors.green,buttonText: 'Play'),
                              recommendedCourses(avatarColor: Colors.blue, icon: Icons.play_arrow,title: 'Fun practice', subTitle: const AppRatingBar() ),
                              recommendedCourses(avatarColor: Colors.purple, icon: Icons.tag,title: 'Wrong title set', subTitle: const Text('12-09-2021')),
                              recommendedCourses(avatarColor: Colors.orangeAccent, icon: Icons.edit,title: 'Latest update', subTitle: const Text('12-09-2021')),

                              recommendedCourses(avatarColor: Colors.indigo, icon: Icons.person,title: 'New Users', subTitle: const Text('5') ),
                              recommendedCourses(avatarColor: Colors.purple, icon: Icons.description,title: 'Achievement', subTitle: const Text('progress in this week')),
                              recommendedCourses(avatarColor: Colors.brown, icon: Icons.copy,title: 'Copied item', subTitle: const Text('12')),
                            ],
                          ),
                    ),
              ),
            ),
          ],
        ),
  );

  Widget recommendedCourses ({
  required Color avatarColor,
    Color? buttonColor,
    required IconData icon,
    required String title,
    required Widget subTitle,
    String? buttonText,

}) => Container(
    margin: const EdgeInsets.symmetric(vertical: 8.0),
    color: Colors.white,
    child:  ListTile(
        leading:  CircleAvatar(
          child: Icon(icon),
          backgroundColor: avatarColor,
        ),
        title: Text(title),
        subtitle: subTitle,
        trailing: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(

            height: 25,
            width: 70,
            color: buttonColor ?? Colors.blue.shade300,
            child: Center(child: Text(buttonText ??= 'Evaluate')),
          ),
        )
    ),
  );
  Widget getMathItem ({
    required Color color,
    required  String title,
    required String subTitle,
    required IconData iconData,
  }) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: color,
    ),
    width: 150,
    height: 150,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(iconData),
            ),
          ),
          Text(title, style: const TextStyle( fontSize: 18, letterSpacing: 0.05),),
          Text(subTitle),
        ],
      ),
    ),
  );

  Widget getOptions() => Container(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 8.0, top: 8.0, bottom: 8.0, right: 0.0),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              getSubjectName('Mathematics'),
              const SizedBox(
                width: 8,
              ),
              getSubjectName('English '),
              const SizedBox(
                width: 8,
              ),
              getSubjectName('Physics '),
              const SizedBox(
                width: 8,
              ),
              getSubjectName('Chemistry '),
              const SizedBox(
                width: 8,
              ),
              getSubjectName('Chemistry '),
              const SizedBox(
                width: 8,
              ),
              getSubjectName('Mathematics '),
              const SizedBox(
                width: 8,
              ),
              getSubjectName('Geography '),
            ],
          ),
        ),
      );

  Widget getSubjectName(String name) => Column(
        children: [
          Text(
            name,
            style: TextStyle(
                fontSize: 18,
                color: name == 'Mathematics' ? Colors.black:Colors.grey ,
                fontWeight: FontWeight.w500,
                letterSpacing: .01),
          ),
          const SizedBox(height: 5.0,),
          Container(
            color: name == 'Mathematics' ? Colors.greenAccent:Colors.white ,
            height: 2.0,
            width: 38.0,
          )
        ],
      );
}