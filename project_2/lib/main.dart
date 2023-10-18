import 'package:flutter/material.dart';
import 'package:project_2/config/theme/app_theme.dart';
import 'package:project_2/presentation/providers/chat_provider.dart';
import 'package:project_2/presentation/screens/chat/chat_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_)=>ChatProvider())],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectorColor: 0).theme(),
        home: const ChatScreen(),
      ),
    );
  }
}