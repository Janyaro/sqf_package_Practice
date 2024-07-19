import 'package:flutter/material.dart';
import 'package:sqll/Component/ReuseAbleBtn.dart';
import 'package:sqll/dbHelper.dart';

class ShowScreen extends StatefulWidget {
  const ShowScreen({super.key});

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  DBHelper helper = DBHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data saved in the data base'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Table(
            children: const [
              TableRow(children: [
                TableCell(
                    child: Center(
                  child: Text(
                    'Owner',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                )),
                TableCell(
                    child: Center(
                  child: Text(
                    'title',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                )),
                TableCell(
                    child: Center(
                  child: Text(
                    'description',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                )),
                TableCell(
                    child: Center(
                  child: Text(
                    'price',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                )),
                TableCell(
                    child: Center(
                  child: Text(
                    'Weight',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                )),
              ]),
            ],
          ),
          FutureBuilder(
              future: helper.getCartList(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: Text('Data nhi aa rha hai '));
                } else if (snapshot.data!.length <= 0) {
                  return const Center(
                      child: Text(
                    'Please add some data in the data list  ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ));
                }
                return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Center(
                            child: Table(
                          border: TableBorder.all(),
                          children: [
                            TableRow(children: [
                              TableCell(
                                  child: Center(
                                child: Text(
                                    snapshot.data![index].Owner.toString()),
                              )),
                              TableCell(
                                  child: Center(
                                child: Text(
                                    snapshot.data![index].title.toString()),
                              )),
                              TableCell(
                                  child: Center(
                                child: Text(snapshot.data![index].description
                                    .toString()),
                              )),
                              TableCell(
                                  child: Center(
                                child: Text(
                                    snapshot.data![index].price.toString()),
                              )),
                              TableCell(
                                  child: Center(
                                child: Text(
                                    snapshot.data![index].weight.toString()),
                              )),
                            ])
                          ],
                        ));
                      }),
                );
              }),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: ReUseBtn(
                title: 'Go Back',
                ontap: () {
                  Navigator.pop(context);
                }),
          )
        ],
      ),
    );
  }
}
