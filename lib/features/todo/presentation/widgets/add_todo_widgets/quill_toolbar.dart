import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class QuillToolbar extends StatelessWidget {
  final QuillController quillController;

  const QuillToolbar({super.key, required this.quillController});

  @override
  Widget build(BuildContext context) {
    final config = QuillSimpleToolbarConfig(
      toolbarSectionSpacing: 1,
      sectionDividerSpace: 0,
      showFontSize: false,
      showFontFamily: false,
      showRedo: false,
      showUndo: false,
      showLineHeightButton: false,
      showSubscript: false,
      showSuperscript: false,
      showDirection: false,
      showListCheck: false,
      showCodeBlock: false,
      showQuote: true,
      showIndent: false,
      showLink: false,
      showSearchButton: false,
      showClearFormat: false,
      showBackgroundColorButton: false,
      showColorButton: false,
      showInlineCode: false,
      showSmallButton: false,
      showAlignmentButtons: false,
      showHeaderStyle: false,
    );

    return QuillSimpleToolbar(controller: quillController, config: config);
  }
}
