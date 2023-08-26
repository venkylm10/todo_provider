import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/models/todo_model.dart';

class ToDoTile extends StatelessWidget {
  final Todo todo;
  final int index;
  const ToDoTile({
    super.key,
    required this.todo,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * .05,
        top: size.width * .01,
        bottom: 0,
      ),
      child: Consumer<TodoListProvider>(
          builder: (context, todoListProviderModel, child) {
        return Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {},
                icon: Icons.edit_rounded,
                backgroundColor: Colors.white54,
                borderRadius: BorderRadius.circular(5),
              ),
              SlidableAction(
                onPressed: (context) {
                  todoListProviderModel.deleteATodo(index);
                },
                icon: Icons.delete_rounded,
                backgroundColor: Colors.white54,
                borderRadius: BorderRadius.circular(5),
              ),
            ],
          ),
          child: Container(
            width: size.width * .9,
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: todo.isCompleted,
                  onChanged: (value) {
                    todoListProviderModel.todoDone(todo, index);
                  },
                  activeColor: Theme.of(context).primaryColor,
                  checkColor: Colors.white,
                ),
                SizedBox(
                  width: size.width * .75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo.head,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'DotMatrix',
                          fontWeight: FontWeight.w500,
                          decoration: todo.isCompleted ?? false
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      Text(
                        todo.body,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: GoogleFonts.robotoMono(
                          decoration: todo.isCompleted ?? false
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
