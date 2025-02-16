import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'HomePage/HomePage.dart';

class SliderMenu extends StatefulWidget {
  const SliderMenu({Key? key}) : super(key: key);

  @override
  State<SliderMenu> createState() => _SliderMenuState();
}

class _SliderMenuState extends State<SliderMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 320,
        height: double.infinity,
        color: Color(0xFF161c28),
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(20,40,0,0),
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(CupertinoIcons.person),
                ),
                title: Text(
                  "CODERS",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                subtitle: Text(
                  "Passionate",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: Divider(
                  color: Colors.white,
                  height: 40,
                ),
              ),
              Padding(
                padding:EdgeInsets.only(left: 10.0,top: 1.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                child: Row(
                  children: [
                    SizedBox(
                      height: 90,
                      width: 80,
                      child: Lottie.asset(
                        'assets/home_ani.json',
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Home',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ),
              Padding(
                padding:EdgeInsets.only(left: 10.0,top: 1.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 90,
                      width: 70,
                      child: Lottie.asset(
                        'assets/potd.json',
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'POTD Challenge',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:EdgeInsets.only(left: 10.0,top: 1.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 90,
                      width: 70,
                      child: Lottie.asset(
                        'assets/comp3.json',
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Compare Profiles',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:EdgeInsets.only(left: 10.0,top: 1.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 90,
                      width: 70,
                      child: Lottie.asset(
                        'assets/chat_room_ani.json',
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Chat Room',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
