import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/core/di/injection.dart';
import 'package:flutter_movie/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:flutter_movie/features/todo/data/models/todo_model.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TodoBloc>(),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Todo List'),
            actions: [
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: () => _showFilterDialog(context),
              ),
            ],
          ),
          body: BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              return state.when(
                initial: () {
                  context.read<TodoBloc>().add(const TodoEvent.loadTodos());
                  return const Center(child: CircularProgressIndicator());
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: (todos) => _buildTodoList(todos),
                error: (message) => Center(child: Text('Error: $message')),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTodoList(List<TodoModel> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: CircleAvatar(child: Text('${todo.userId}')),
            title: Text(
              todo.title,
              style: TextStyle(
                decoration: todo.completed ? TextDecoration.lineThrough : null,
              ),
            ),
            trailing: Icon(
              todo.completed ? Icons.check_circle : Icons.circle_outlined,
              color: todo.completed ? Colors.green : Colors.grey,
            ),
          ),
        );
      },
    );
  }

  void _showFilterDialog(BuildContext context) {
    final blocContext = context;
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Filter by User ID'),
        content: TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'Enter User ID',
          ),
          onSubmitted: (value) {
            final userId = int.tryParse(value);
            if (userId != null) {
              blocContext.read<TodoBloc>().add(TodoEvent.filterByUserId(userId));
            }
            Navigator.pop(dialogContext);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              blocContext.read<TodoBloc>().add(const TodoEvent.loadTodos());
              Navigator.pop(dialogContext);
            },
            child: const Text('Show All'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
