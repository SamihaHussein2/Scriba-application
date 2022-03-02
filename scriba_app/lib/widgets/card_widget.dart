import 'package:flutter/material.dart';
import '/defaults/theme.dart';


class CardWidget extends StatelessWidget {
  const CardWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.darkRed,
          child: ListTile(
            title: Text('Le Lorem Ipsum'),
            subtitle: Text("Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression..."),
            textColor: AppTheme.moderateOrange,
          ),
          elevation: 5,
        //  shadowColor: Colors.green,
          margin: EdgeInsets.all(20),
          shape:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppTheme.moderateOrange, width: 1)
          ),
        );
  }
}