import 'package:flutter/material.dart';

import '../modal/note_model.dart';

class CreateNotes extends StatefulWidget {
  const CreateNotes({super.key, required this.onNewNoteCreated});
   final Function(Note) onNewNoteCreated;
  @override
  State<CreateNotes> createState() => _CreateNotesState();
}

class _CreateNotesState extends State<CreateNotes> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Notes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),
              decoration: InputDecoration(border: InputBorder.none,
              hintText: "Title"),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: bodyController,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(border: InputBorder.none,
                  hintText: "Story"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        if(titleController.text.isEmpty){
          return;
        }
        if(bodyController.text.isEmpty){
          return;
        }
        final note = Note(
          body: bodyController.text,
          title: titleController.text,
        );
        widget.onNewNoteCreated(note);
        Navigator.of(context).pop();
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
