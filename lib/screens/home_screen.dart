import 'package:flutter/material.dart';
import 'package:notepad_app/modal/note_model.dart';
import 'package:notepad_app/screens/create_notes.dart';
import 'package:notepad_app/screens/widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Notes"),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index){
          return NoteCard(note: notes[index], index: index,onNoteDeleted: onNoteDeleted,);
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  CreateNotes(onNewNoteCreated: onNewNoteCreated,)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
  void onNewNoteCreated(Note note){
    notes.add(note);
    setState(() {
      
    });
  }
  onNoteDeleted(index){
    notes.removeAt(index);
    setState(() {

    });
  }
}
