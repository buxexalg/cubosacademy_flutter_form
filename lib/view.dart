import 'package:flutter/material.dart';

class View extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String surName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: TextFormField(
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Nome é obrigatório';
                          }

                          return null;
                        },
                        decoration: InputDecoration(hintText: 'Nome'),
                        onChanged: (text) {
                          name = text;
                        },
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: TextFormField(
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Sobrenome é obrigatório';
                          }

                          return null;
                        },
                        decoration: InputDecoration(hintText: 'Sobrenome'),
                        onChanged: (text) {
                          surName = text;
                        },
                      )),
                  Expanded(
                      child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                        onPressed: () {
                          final isValid = _formKey.currentState!.validate();

                          if (isValid) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                      title: Text('Olá $name $surName'));
                                });
                          }
                        },
                        child: Text('Validar')),
                  ))
                ],
              )),
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }
}
