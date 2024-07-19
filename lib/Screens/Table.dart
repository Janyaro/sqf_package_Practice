import 'package:flutter/material.dart';

class TableData extends StatefulWidget {
  const TableData({super.key});

  @override
  State<TableData> createState() => _TableDataState();
}

class _TableDataState extends State<TableData> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Center(
                child: Text(
              'Data table screen',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(children: [
                  TableCell(
                      child: Center(
                    child: Text(
                      'Row 1, Column 1 ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  )),
                  TableCell(
                      child: Center(
                    child: Text(
                      'Row 1, Column 1 ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  )),
                  TableCell(
                      child: Center(
                    child: Text(
                      'Row 1, Column 1 ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ))
                ]),
                TableRow(children: [
                  TableCell(
                      child: Center(
                    child: Text(
                      'data',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  )),
                  TableCell(
                      child: Center(
                    child: Text(
                      'data',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  )),
                  TableCell(
                      child: Center(
                    child: Text(
                      'data',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  )),
                ])
              ],
            )
          ],
        ),
      ),
    );
  }
}
