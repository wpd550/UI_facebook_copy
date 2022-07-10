import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

class Student {
  final String name;
  static final Map<String, Student> _studentMap = <String, Student>{};

  //匿名工厂构造
  factory Student(String name) {
    return _studentMap.putIfAbsent(name, () => Student._newStudent(name));
  }
  //工厂构造函数
  factory Student.fromJson(Map<String, Object> json) {
    return Student(json['name'].toString());
  }
  //命名构造
  Student._newStudent(this.name);
}

class Singleton {
  Singleton._internal();
  static final Singleton _instance = Singleton._internal();

  factory Singleton.getInstance() => _getInstance();

  static _getInstance() {
    return _instance;
  }
}
