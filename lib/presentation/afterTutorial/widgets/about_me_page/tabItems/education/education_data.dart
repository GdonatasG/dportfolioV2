import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:flutter/material.dart';

class EducationItem {
  final Icon icon;
  final String time;
  final String name;
  final String location;

  const EducationItem({this.icon, this.time, this.name, this.location});
}

const List<EducationItem> educations = [
  EducationItem(
      icon: Icon(Icons.school),
      time: LocaleKeys.UNIVERSITY_EDUCATION_TIME,
      name: LocaleKeys.UNIVERSITY_EDUCATION_NAME,
      location: LocaleKeys.UNIVERSITY_EDUCATION_LOCATION),
  EducationItem(
      icon: Icon(Icons.code),
      time: LocaleKeys.JAVA_COURSE_TIME,
      name: LocaleKeys.JAVA_COURSE_NAME,
      location: LocaleKeys.JAVA_COURSE_LOCATION),
  EducationItem(
      icon: Icon(Icons.home),
      time: LocaleKeys.SECONDARY_EDUCATION_TIME,
      name: LocaleKeys.SECONDARY_EDUCATION,
      location: LocaleKeys.SECONDARY_EDUCATION_LOCATION),
];
