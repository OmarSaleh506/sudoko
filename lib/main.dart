// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

int num = Random().nextInt(9);

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('Sudoku')),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Box(),
                  Padding(
                    padding: const EdgeInsets.all(90.0),
                    child: Row(
                      children: [
                        ElevatedButton(
                            onPressed: (() {
                              setState(() {
                                print('restart');
                              });
                            }),
                            child: Text('restart')),
                        SizedBox(
                          width: 50,
                        ),
                        ElevatedButton(
                            onPressed: (() {
                              print('check');
                            }),
                            child: Text('check')),
                      ],
                    ),
                  )
                ],
              ))),
    ));
  }
}

class Box extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder(
        left: BorderSide(width: 3.0, color: Colors.black),
        top: BorderSide(width: 3.0, color: Colors.black),
      ),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: rows(),
    );
  }

  List<TableRow> rows() {
    return List.generate(9, (int rowNumber) {
      return TableRow(children: getRow(rowNumber));
    });
  }

  List<Widget> getRow(int rowNumber) {
    return List.generate(9, (int colNumber) {
      return Container(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              width: (colNumber % 3 == 2) ? 3.0 : 1.0,
              color: Colors.black,
            ),
            bottom: BorderSide(
              width: (rowNumber % 3 == 2) ? 3.0 : 1.0,
              color: Colors.black,
            ),
          ),
        ),
        child: SudokuCell(rowNumber, colNumber),
      );
    });
  }
}

class SudokuCell extends StatelessWidget {
  final int row, col;

  SudokuCell(this.row, this.col);

  @override
  Widget build(BuildContext context) {
    int num = Random().nextInt(9);

    return TextField(
      onTap: () {
        print('index($row ,$col) = ${num + 1}');
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
      ),
      controller: TextEditingController(text: "${num + 1}"),
      style: TextStyle(fontSize: 22),
    );
  }
}
