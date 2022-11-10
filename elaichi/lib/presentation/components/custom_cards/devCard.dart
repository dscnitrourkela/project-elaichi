import 'package:auto_size_text/auto_size_text.dart';
import 'package:elaichi/presentation/core/utils/urlLauncher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DevCard extends StatelessWidget {
  final double width;
  final String name;
  final String link;
  final String photo;
  final String role;
  const DevCard({Key? key, required this.width, required this.name, required this.link, required this.role, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.035, vertical: 6),
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(7),
        elevation: 5,
        shadowColor: Colors.blueAccent[100],
        child: InkWell(
          splashColor: Colors.lightBlueAccent[100],
          onTap: (){
            launchURL(link);
          },
          child: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        height: width*0.19,
                        width: width*0.19,
                        decoration: BoxDecoration(
                          color: Color(0xFF444444),
                          borderRadius: BorderRadius.circular(width*0.095),
                        ),
                      ),
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        height: width*0.176,
                        width: width*0.176,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(width*0.088),
                        ),
                        child: Image.network(photo),
                      ),
                    ],
                  ),
                  SizedBox(width: width*0.05),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width*0.55,
                        child: AutoSizeText(
                          name,
                          style: GoogleFonts.inter(
                            fontSize: width*0.05,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF202020),
                          ),
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(height: 2),
                      Container(
                        width: width*0.55,
                        child: AutoSizeText(
                          role,
                          style: GoogleFonts.inter(
                            fontSize: width*0.038,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF555555),
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
