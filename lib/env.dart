import 'package:flutter/material.dart';

enum Environment { dev, prod }

abstract class AppEnvironment {
  static String baseAPiUrl = 'https://jsonplaceholder.typicode.com/posts';
  static late String title;
  static late Environment _environment;
  static late MaterialColor color;
  //static Environment get environment => _environment;
  // static setupEnv(Environment env) {
  //   _environment = env;
  //   switch (env) {
  //     case Environment.dev:
  //       {
  //         baseAPiUrl = 'https://jsonplaceholder.typicode.com/posts';
  //         title = 'Hotel-Dev';
  //         color = Colors.red;
  //         break;
  //       }
  //     case Environment.prod:
  //       {
  //         baseAPiUrl = 'https://api-prod.com/';
  //         title = 'Hotel';
  //         color = Colors.grey;
  //         break;
  //       }
  //  }
  //}
}
