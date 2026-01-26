import 'package:auth_app/features/todo/presentation/widgets/add_todo_widgets/quill_editor_container.dart';
import 'package:auth_app/features/todo/presentation/widgets/add_todo_widgets/quill_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class DescriptionCard extends StatelessWidget {
  final QuillController quillDescController;

  const DescriptionCard({super.key, required this.quillDescController});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: QuillToolbar(quillController: quillDescController),
          ),
          const SizedBox(height: 4),

          QuillEditorContainer(quillDescController: quillDescController),
        ],
      ),
    );
  }
}
