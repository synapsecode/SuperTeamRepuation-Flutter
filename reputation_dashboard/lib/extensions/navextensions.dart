import 'package:flutter/material.dart';

extension NavExt on NavigatorState {
  Future<T?> pushNewPage<T>(Widget page) async {
    return push(MaterialPageRoute(builder: (ctx) => page));
  }

  Future<T?> replaceWithNewPage<T>(Widget page) async {
    return pushReplacement(MaterialPageRoute(builder: (ctx) => page));
  }
}
