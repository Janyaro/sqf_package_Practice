import 'package:flutter/material.dart';

import 'package:sqll/Component/ReuseAbleBtn.dart';
import 'package:sqll/Model/listModel.dart';
import 'package:sqll/Screens/showScreen.dart';
import 'package:sqll/dbHelper.dart';

class EnteringPoint extends StatefulWidget {
  const EnteringPoint({super.key});

  @override
  State<EnteringPoint> createState() => _EnteringPointState();
}

class _EnteringPointState extends State<EnteringPoint> {
  DBHelper dbHelper = DBHelper();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController ownerController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  FocusNode titleNode = FocusNode();
  FocusNode desNode = FocusNode();
  FocusNode ownerNode = FocusNode();
  FocusNode weightNode = FocusNode();
  FocusNode priceNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text(
            ' Data Entery Page ',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  focusNode: ownerNode,
                  controller: ownerController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      labelText: 'Enter Owner',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(weightNode);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  focusNode: weightNode,
                  controller: weightController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      labelText: 'Enter Weight',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(priceNode);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  focusNode: priceNode,
                  controller: priceController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      labelText: 'Enter Price',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(titleNode);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  focusNode: titleNode,
                  controller: titleController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      hintText: 'Enter title ',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(desNode);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  focusNode: desNode,
                  controller: descriptionController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      hintText: 'Enter Description',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ReUseBtn(
                        title: 'Save',
                        ontap: () {
                          if (titleController.text.toString().isEmpty &&
                              ownerController.text.toString().isEmpty &&
                              descriptionController.text.toString().isEmpty &&
                              weightController.text.toString().isEmpty &&
                              priceController.text.toString().isEmpty) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Please fill the form'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Go Back'))
                                    ],
                                  );
                                });
                          } else {
                            dbHelper.insert(ListData(
                                title: titleController.text.toString(),
                                description:
                                    descriptionController.text.toString(),
                                Owner: ownerController.text.toString(),
                                weight:
                                    int.parse(weightController.text.toString()),
                                price: int.parse(
                                    priceController.text.toString())));
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text(
                                        'Data saved in the data base'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Ok'))
                                    ],
                                  );
                                });
                          }
                        }),
                    ReUseBtn(
                        title: 'List',
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ShowScreen()));
                        })
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
