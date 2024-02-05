import 'package:flutter/material.dart';

class HelpRequest extends StatefulWidget {
  @override
  _HelpRequestState createState() => _HelpRequestState();
}

class _HelpRequestState extends State<HelpRequest> {
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  TextEditingController textController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(85, 85, 85, 1),
        title: Text(
          'New Help Request',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Message Title',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 10, 0),
              child: Container(
                height: 50,
                width: 300,
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: textController1,
                  decoration: InputDecoration(
                    hintText: 'Short title for your problem',
                    filled: true,
                    fillColor: Color.fromRGBO(85, 85, 85, 1),
                    // Set the desired grey color
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(170, 170, 170, 1),
                      // Set text color to white
                      fontSize: 16, // Set the desired font size
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      // Set the radius to 10 pixels
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    // You can also adjust the input text style if needed
                    // hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'What do you need help with ?',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 10, 0),
              child: Container(
                height: 100,
                width: 300,
                child: TextField(
                  maxLines: 6,
                  style: TextStyle(color: Colors.white),
                  controller: textController2,
                  decoration: InputDecoration(
                    hintText: 'Describe your problem',
                    filled: true,
                    fillColor: Color.fromRGBO(85, 85, 85, 1),
                    // Set the desired grey color
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(170, 170, 170, 1),
                      // Set text color to white
                      fontSize: 16, // Set the desired font size
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      // Set the radius to 10 pixels
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    // You can also adjust the input text style if needed
                    // hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Domains',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 10, 0),
              child: Container(
                height: 50,
                width: 300,
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: textController3,
                  decoration: InputDecoration(
                    hintText: 'HTML,CSS,JAVASCRIPT,ETC',
                    filled: true,
                    fillColor: Color.fromRGBO(85, 85, 85, 1),
                    // Set the desired grey color
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(170, 170, 170, 1),
                      // Set text color to white
                      fontSize: 16, // Set the desired font size
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      // Set the radius to 10 pixels
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    // You can also adjust the input text style if needed
                    // hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(45, 15, 10, 0),
              child: GestureDetector(
                onTap: () {
                  // Handle the tap event
                  print('POST IN SYNERGY tapped');
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(224, 140, 56, 1),
                    borderRadius: BorderRadius.circular(
                        100.0), // Set the radius to 100 pixels
                  ),
                  child: Center(
                    child: Text(
                      'POST IN SYNERGY',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
