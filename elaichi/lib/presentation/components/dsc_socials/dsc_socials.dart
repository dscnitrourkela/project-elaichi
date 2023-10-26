import 'package:elaichi/presentation/core/utils/urlLauncher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget dscSocial() {
  const clr = Color(0xFF4F4F4F);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      IconButton(
          icon: const FaIcon(FontAwesomeIcons.globe, color: clr,),
          onPressed: () {
            launchURL('https://dscnitrourkela.org');
          },),
      IconButton(
          icon: const FaIcon(FontAwesomeIcons.github, color: clr,),
          onPressed: () {
            launchURL('https://github.com/dscnitrourkela');
          },),
      IconButton(
          icon: const FaIcon(FontAwesomeIcons.medium, color: clr,),
          onPressed: () {
            launchURL('https://medium.com/dsc-nit-rourkela');
          },),
      IconButton(
          icon: const FaIcon(FontAwesomeIcons.linkedin, color: clr,),
          onPressed: () {
            launchURL('https://www.linkedin.com/company/dscnitrourkela');
          },),
      IconButton(
          icon: const FaIcon(FontAwesomeIcons.facebook, color: clr,),
          onPressed: () {
            launchURL('https://www.facebook.com/dscnitrourkela');
          },),
      IconButton(
          icon: const FaIcon(FontAwesomeIcons.instagram, color: clr,),
          onPressed: () {
            launchURL('https://www.instagram.com/dscnitrourkela');
          },),
      IconButton(
          icon: const FaIcon(FontAwesomeIcons.twitter, color: clr,),
          onPressed: () {
            launchURL('https://twitter.com/dscnitrourkela');
          },),
    ],
  );
}