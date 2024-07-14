import 'package:codequest/c2ladder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../BeginnerProblem.dart';
import '../Drawer.dart';
import '../gfgpotd.dart';
import '../lcpotd.dart';
import 'HomePageContainer.dart';
import 'LstConatiner.dart';
import '../Roadmap.dart';
import '../CodingPlat/LeetCode/leetcode.dart';
import '../CodingPlat/HackerEarth/hackerearth.dart';
import '../CodingPlat/GeeksForGeeks/geeksforgeeks.dart';
import '../CodingPlat/CodingNinjas/codingninjas.dart';
import '../CodingPlat/CodeForces/codeforces.dart';
import '../CodingPlat/Codechef/codechef.dart';
import '../data/CodingPlatformsdata.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, Widget> platformScreens = {
    'LeetCode': Leetcode(),
    'CodeChef': Codechef(),
    'CodeForces': Codeforces(),
    'GeeksForGeeks': GeeksForGeeks(),
    'CodingNinjas': CodingNinjas(),
    'HackerEarth': Hackerearth(),
  };

  String getGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff171d28),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'Drawer');
                  },
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi Coders 👋',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    Text(
                      getGreeting() + " !!",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(color: Colors.white70, fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const c2ladder())),
                    child: CardContainer(
                      text: "Practice",
                      icon: Image.asset(
                        'assets/CodingPlatformsIcons/img_5.png',
                        height: 40, // Adjust the size as needed
                        width: 40,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Roadmap())),
                    // child: CardContainer(
                    //   text: "POTD",
                    //   icon: Icon(Icons.alt_route_rounded),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => gfgpotd())),
                    child: CardContainer(
                      text: "POTD",
                      icon: Image.asset(
                        'assets/CodingPlatformsIcons/img_6.png',
                        height: 40, // Adjust the size as needed
                        width: 40,
                      ),
                    ),


                ),
                ),
                SizedBox(width: 10),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => lcpotd())),
                    child: CardContainer(
                      text: "POTD",
                      icon: Image.asset(
                        'assets/CodingPlatformsIcons/img.png',
                        height: 40, // Adjust the size as needed
                        width: 40,
                      ),
                    ),
                  ),
                ),
              ],
            )
            ,

            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //       GestureDetector(
            //         onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const c2ladder())),
            //         child: CardContainer(
            //           text: "Practice Problems",
            //           icon: Icon(Icons.star),
            //         ),
            //       ),
            //
            //
            //
            //
            //
            //       SizedBox(width: 10),
            //       GestureDetector(
            //         onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Roadmap())),
            //         child: CardContainer(text: "DSA RoadMap", icon: Icon(Icons.alt_route_rounded)),
            //       ),
            //       SizedBox(width: 10),
            //       GestureDetector(
            //         onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Roadmap())),
            //         child: CardContainer(text: "DSA RoadMap", icon: Icon(Icons.alt_route_rounded)),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(height: 20),
            Text('Contests',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold))),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: CodingPlatformdata.length,
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () {
                      String platformName = CodingPlatformdata[index].name;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            if (platformScreens.containsKey(platformName)) {
                              return platformScreens[platformName]!;
                            } else {
                              return Scaffold(
                                body: Center(
                                  child: Text('Screen for $platformName not defined.'),
                                ),
                              );
                            }
                          },
                        ),
                      );
                    },
                    child: ListContainer(
                      text: CodingPlatformdata[index].name,
                      textStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      imagepath: CodingPlatformdata[index].imagePath,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
