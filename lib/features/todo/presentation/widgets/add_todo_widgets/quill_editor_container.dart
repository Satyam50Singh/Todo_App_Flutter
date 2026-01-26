import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class QuillEditorContainer extends StatelessWidget {
  final quillDescController;

  const QuillEditorContainer({super.key, required this.quillDescController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Container(
        padding: const EdgeInsets.all(12),
        child: QuillEditor(
          scrollController: ScrollController(),
          controller: quillDescController,
          config: const QuillEditorConfig(
            placeholder: "Write your todo here...",
          ),
          focusNode: FocusNode(),
        ),
      ),
    );
  }
}
