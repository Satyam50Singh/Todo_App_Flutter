import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/quill_delta.dart';

class Utils {
  Utils._();

  static String quillJsonToPlainText(String json) {
    try {
      final delta = Delta.fromJson(jsonDecode(json));
      final document = Document.fromDelta(delta);
      return document.toPlainText().trim();
    } catch (_) {
      return "";
    }
  }
}
