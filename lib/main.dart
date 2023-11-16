import 'package:done_done_dance/database/tasks_provider.dart';
import 'package:done_done_dance/screens/home_screen.dart';
import 'package:done_done_dance/screens/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => TaskListProvider(),
      ),
    ],
    child: const DailyTodoApp(),
  ));
}

class DailyTodoApp extends StatelessWidget {
  const DailyTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    return MaterialApp(
        title: "Daily Todo App",
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: const Color(0xFF5AA566),
          focusColor: Colors.black,
        ),
        home: FutureBuilder(
          future: Future.delayed(
              const Duration(seconds: 4), () => "Intro Completed."),
          builder: (context, snapshot) {
            return AnimatedSwitcher(
                duration: const Duration(milliseconds: 1000),
                child: _splashLoadingWidget(snapshot));
          },
        ));
  }
}

Widget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
  if (snapshot.hasError) {
    return const Text("Error!!");
  } else if (snapshot.hasData) {
    return const HomeScreen();
  } else {
    return const IntroScreen();
  }
}
