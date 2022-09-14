import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:map_exam/db/models/note.dart';

import 'cubits/note_list_cubit/note_list_cubit.dart';

class EditScreen extends StatefulWidget {
  final bool editMode;
  final Note? note;

  const EditScreen({
    Key? key,
    required this.editMode,
    this.note,
  }) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.note?.title ?? '';
    _descriptionController.text = widget.note?.content ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        title: Text(
          widget.note == null
              ? 'Add new Note'
              : widget.editMode
                  ? 'Edit Note'
                  : 'View Note',
        ),
        actions: [
          if (widget.editMode)
            IconButton(
                icon: const Icon(
                  Icons.check_circle,
                  size: 30,
                ),
                onPressed: () {
                  if (widget.note == null) {
                    context.read<NoteListCubit>().addNote(
                          _titleController.text,
                          _descriptionController.text,
                        );
                  } else {
                    context.read<NoteListCubit>().editNote(
                          widget.note!.id,
                          _titleController.text,
                          _descriptionController.text,
                        );
                  }
                  Navigator.pop(context);
                }),
          IconButton(
              icon: const Icon(
                Icons.cancel_sharp,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              initialValue: null,
              enabled: widget.editMode,
              decoration: const InputDecoration(
                hintText: 'Type the title here',
              ),
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: TextFormField(
                  controller: _descriptionController,
                  enabled: widget.editMode,
                  initialValue: null,
                  maxLines: null,
                  expands: true,
                  decoration: const InputDecoration(
                    hintText: 'Type the description',
                  ),
                  onChanged: (value) {}),
            ),
          ],
        ),
      ),
    );
  }
}
