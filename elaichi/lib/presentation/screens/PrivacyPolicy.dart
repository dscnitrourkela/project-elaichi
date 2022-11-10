import 'package:elaichi/presentation/components/custom_app_bar.dart';
import 'package:elaichi/presentation/core/utils/urlLauncher.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  static final String F1 =
  """Built the Avenue NIT Rourkela app as a Free app. This SERVICE is provided by at no cost and is intended for use as is.

This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.

If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.

The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Avenue NIT Rourkela unless otherwise defined in this Privacy Policy.""";
  static final String F2 =
  """For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information, including but not limited to Mobile Number, Name, Roll Number. The information that we request will be retained by us and used as described in this privacy policy.

The app does use third party services that may collect information used to identify you.

Link to privacy policy of third party service providers used by the app""";
  static final String F3 =
  """We want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (?IP?) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics.""";
  static final String F4 =
  """Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory.

This Service does not use these ?cookies? explicitly. However, the app may use third party code and libraries that use ?cookies? to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.""";
  static final String F5 =
  """We may employ third-party companies and individuals due to the following reasons:

 - To facilitate our Service;
 - To provide the Service on our behalf;
 - To perform Service-related services; or
 - To assist us in analyzing how our Service is used.

We want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.""";
  static final String F6 =
  """We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.""";
  static final String F7 =
  """This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.""";
  static final String F8 =
  """These Services do not address anyone under the age of 13. We do not knowingly collect personally identifiable information from children under 13. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do necessary actions.""";
  static final String F9 =
  """We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately after they are posted on this page.""";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBar(
        title: 'Privacy Policy',
        leftButton: Icons.arrow_back_ios,
        leftTap: (){
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Body(F1, width),
            Heading("Information Collection and Use", width),
            Body(F2, width),
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: width * 0.035, vertical: 6),
              child: RichText(
                text: TextSpan(
                  text: ' - ',
                  style: GoogleFonts.inter(
                    fontSize: 14.6,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4F4F4F),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Google Play Services',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchURL("https://play.google.com/about/play-terms/");
                          },
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xFF2F80ED),
                          fontSize: 14.6,
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: width * 0.035, vertical: 6),
              child: RichText(
                text: TextSpan(
                  text: ' - ',
                  style: GoogleFonts.inter(
                    fontSize: 14.6,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4F4F4F),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Firebase Analysis',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchURL("https://firebase.google.com/terms");
                          },
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xFF2F80ED),
                          fontSize: 14.6,
                        )),
                  ],
                ),
              ),
            ),
            Heading("Log Data", width),
            Body(F3, width),
            Heading("Cookies", width),
            Body(F4, width),
            Heading("Service Providers", width),
            Body(F5, width),
            Heading("Security", width),
            Body(F6, width),
            Heading("Links to Other Sites", width),
            Body(F7, width),
            Heading("Children’s Privacy", width),
            Body(F8, width),
            Heading("Changes to This Privacy Policy", width),
            Body(F9, width),
            Heading("Contact Us", width),
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: width * 0.035, vertical: 8),
              child: RichText(
                text: TextSpan(
                  text:
                  'If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at ',
                  style: GoogleFonts.inter(
                    fontSize: 14.6,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4F4F4F),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'dsc.nitr@gmail.com',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchURL("mailto:dsc.nitr@gmail.com");
                          },
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xFF2F80ED),
                          fontSize: 14.6,
                        )),
                    TextSpan(text: '\n\nThis privacy policy page was created at '),
                    TextSpan(
                        text: 'privacypolicytemplate.net',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchURL("http://privacypolicytemplate.net/");
                          },
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xFF2F80ED),
                          fontSize: 14.6,
                        )),
                    TextSpan(text: ' and modified or generated by '),
                    TextSpan(
                        text: 'App Privacy Policy Generator',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchURL("https://www.app-privacy-policy.com/");
                          },
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xFF2F80ED),
                          fontSize: 14.6,
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
  Widget Heading(String title, double width) => Padding(
    padding: EdgeInsets.only(
        right: width * 0.035, left: width * 0.035, bottom: 3, top: 7),
    child: Text(
      title,
      style: GoogleFonts.inter(
        fontSize: 18.6,
        fontWeight: FontWeight.w600,
        color: Color(0xFF4F4F4F),
      ),
    ),
  );
  Widget Body(String title, double width) => Padding(
    padding: EdgeInsets.symmetric(horizontal: width * 0.035, vertical: 8),
    child: Text(
      title,
      style: GoogleFonts.inter(
        fontSize: 14.6,
        fontWeight: FontWeight.w400,
        color: Color(0xFF4F4F4F),
      ),
    ),
  );
}


