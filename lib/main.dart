import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/models/todo_model.dart';
import 'package:todo_provider/screens/navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoListProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: Theme.of(context).primaryColor,
        ),
      ),
        home: const NavigationScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}




