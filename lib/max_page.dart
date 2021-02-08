import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:people_counter/home_page.dart';

class MaxPage extends StatefulWidget {
  MaxPage({Key key}) : super(key: key);

  @override
  _MaxPageState createState() => _MaxPageState();
}

TextEditingController _maxController = TextEditingController();

class _MaxPageState extends State<MaxPage> {
  bool showError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [ 
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/rest-1.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Color.fromRGBO(0, 0, 0, 0.5),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Digite a quantidade máxima de pessoas permitidas no restaurante",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _maxController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    //border: OutlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:Colors.black),
                    ),
                    labelText: 'Quantidade máxima',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true,                    
                  ),
                  cursorColor: Colors.black,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  showError == true ? "Número Digitado inválido" : "",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.arrow_forward, color: 
          Colors.black,
        ),
        onPressed: (){
          int value = int.parse(_maxController.value.text) ?? 0;
          print (value);

          if (value > 0){
            setState(() {
              showError = false;
            });
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => HomePage(max: value,)),
            );
          }else{
             setState(() {
              showError = true;
            });
          }

        },
      ),
    );
  }
}