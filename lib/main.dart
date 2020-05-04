import 'package:flutter/material.dart';
import 'package:newproviders/src/pages/tabs_page.dart';
import 'package:newproviders/src/services/news_service.dart';
import 'package:newproviders/src/theme/tema.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewsService(),
        )
      ],
      child: MaterialApp(
        title: 'Material App',
        theme: miTema,
        debugShowCheckedModeBanner: false,
        home: TabsPage(),
      ),
    );
  }
}
