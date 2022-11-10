import 'package:elaichi/presentation/components/custom_app_bar.dart';
import 'package:elaichi/presentation/components/custom_cards/devCard.dart';
import 'package:elaichi/presentation/components/dsc_socials/dsc_socials.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeveloperInfo extends StatefulWidget {
  const DeveloperInfo({Key? key}) : super(key: key);

  @override
  State<DeveloperInfo> createState() => _DeveloperInfoState();
}

class _DeveloperInfoState extends State<DeveloperInfo> {
  @override

  final String aboutText =
      "Developer Student Clubs (DSC) is a Google Developers powered program for university students to learn mobile and web development skills. The clubs will be open to any student interested to learn, ranging from novice developers who are just starting, to advanced developers who want to further their skills. The clubs are intended as a space for students to try out new ideas and collaborate to solve mobile and web development problems.\n\n"
      "DSC NIT Rourkela is a student chapter of DSC India with a motive to nurture developers within the community and solve real-life problems in the community through technology.";

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBar(
        title: 'Developer Information',
        leftButton: Icons.arrow_back_ios,
        leftTap: (){
          Navigator.pop(context);
        },
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 15,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.035, vertical: 6),
            child: Image.asset(
              'assets/images/dsc_logo.png',
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(height: 6,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.035, vertical: 6),
            child: Text(
              aboutText,
              textAlign: TextAlign.left,
              style: GoogleFonts.inter(
                fontSize: 14.6,
                fontWeight: FontWeight.w400,
                color: Color(0xFF4F4F4F),
              ),
            ),
          ),
          SizedBox(height: 6,),
          dscSocial(),
          SizedBox(height: 12,),
          Heading("Meet Our Team", width),
          SizedBox(height: 8,),
          DevCard(width: width, name: "Abhibhaw Asthana", link: "https://github.com/abhibhaw",  photo: "https://github.com/abhibhaw.png",role: "App Developer"),
          DevCard(width: width, name: "Akhoury Pranjal", link: "https://akhouryapk01.wixsite.com/my-site", role: "UX Designer", photo: "https://mir-s3-cdn-cf.behance.net/project_modules/2800_opt_1/d07bca98931623.5ee79b6a8fa55.jpg"),
          DevCard(width: width, name: "Astha Nayak", link: "https://github.com/nayakastha",  photo: "https://github.com/nayakastha.png",role: "App Developer"),
          DevCard(width: width, name: "Asutosh Ranjan", link: "https://github.com/asutoshranjan",  photo: "https://github.com/asutoshranjan.png",role: "App Developer"),
          DevCard(width: width, name: "Daksh Sharma", link: "https://www.dakshxp.com/",  photo: "https://mir-s3-cdn-cf.behance.net/user/138/64038d231416119.61e511e59d18b.png",role: "UX Designer"),
          DevCard(width: width, name: "Ritesh Patil", link: "https://github.com/riteshsp2000",  photo: "https://github.com/riteshsp2000.png",role: "App Developer"),
          DevCard(width: width, name: "Sriram Patibanda", link: "https://github.com/SriramPatibanda",  photo: "https://github.com/SriramPatibanda.png",role: "App Developer"),
          SizedBox(height: 30,),
        ],
      ),
    );
  }
  Widget Heading(String title, double width) => Padding(
    padding: EdgeInsets.only(
        right: width * 0.035, left: width * 0.035, bottom: 3, top: 7),
    child: Text(
      title,
      style: GoogleFonts.inter(
        fontSize: width*0.06,
        fontWeight: FontWeight.w600,
        color: Color(0xFF202020),
      ),
    ),
  );
}
