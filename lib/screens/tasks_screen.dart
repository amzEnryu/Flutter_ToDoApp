import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/todo_provider.dart';
import '../widgets/todo_item.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 239, 245),
      appBar: _appbar(),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            searchBox(),
            Expanded(child: Consumer<ToDoProvider>(
              builder: (context, toDoProvider, child) {
                return ListView.builder(
                    itemCount: toDoProvider.tasks.length,
                    itemBuilder: (context, index) {
                      final task = toDoProvider.tasks[index];
                      return ToDoItem(
                        task: task,
                        onCheck: () {
                          toDoProvider.toggleTask(index);
                        },
                        isChecked: task.isDone,
                        onDelete: () {
                          toDoProvider.removeTask(index);
                        },
                      );
                    });
              },
            )),
            _addTask(context),
          ],
        ),
      ),
    );
  }

  Widget _addTask(BuildContext context) {
    final TextEditingController _textController = TextEditingController();

    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Add new task...',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: () {
            String newTaskTitle = _textController.text;
            if (newTaskTitle.isNotEmpty) {
              Provider.of<ToDoProvider>(context, listen: false)
                  .addTask(newTaskTitle);
              _textController.clear();
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
            // contentPadding: EdgeInsets.all(5),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey)),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 238, 239, 245),
      elevation: 0,
      leading: const Icon(
        Icons.menu,
        color: Colors.black,
        size: 30,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CircleAvatar(
            radius: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset('assets/images/ryo.jpg'),
            ),
          ),
        )
      ],
    );
  }
}
