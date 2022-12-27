import 'package:flutter/material.dart';

InputDecoration MyTextField (label){
  return InputDecoration(
    filled: true,
    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
    labelText: label,
    contentPadding: EdgeInsets.all(15),
  );
}

ButtonStyle MyButtonStyle (){
  return ElevatedButton.styleFrom(
    padding: EdgeInsets.all(15),
  );
}