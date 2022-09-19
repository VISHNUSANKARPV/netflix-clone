import 'package:flutter/material.dart';


class AppbarCommon extends StatelessWidget {
  const AppbarCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Downloads',style: TextStyle(fontSize: 22)),
        Spacer(),
        Icon(Icons.cast,color: Colors.white,),
        SizedBox(width: 10,),
        Icon(Icons.person,color: Colors.white,),
         SizedBox(width: 10,),
      ],
    );
  }
}
