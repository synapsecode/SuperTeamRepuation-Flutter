import 'package:flutter/material.dart';

extension TextExtensions on Text {
  Text size(double size) {
    return Text(
      data!,
      style: style?.copyWith(fontSize: size) ?? TextStyle(fontSize: size),
    );
  }

  Text color(Color color) {
    return Text(
      data!,
      style: style?.copyWith(color: color) ?? TextStyle(color: color),
    );
  }

  Text weight(FontWeight weight) {
    return Text(
      data!,
      style:
          style?.copyWith(fontWeight: weight) ?? TextStyle(fontWeight: weight),
    );
  }

  Text align(TextAlign alignment) {
    return Text(data!, style: style, textAlign: alignment);
  }
}
