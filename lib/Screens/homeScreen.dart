import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, snapshot) {
                    return const Card(
                      elevation: 40,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(5),
                        minVerticalPadding: 22,
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.amber,
                          child: Icon(Icons.arrow_right),
                        ),
                        title: Text('Title'),
                        subtitle: Text('sub title '),
                        trailing: Icon(Icons.delete),
                      ),
                    );
                  }),
            )
          ],
        ),
      )),
    );
  }
}
