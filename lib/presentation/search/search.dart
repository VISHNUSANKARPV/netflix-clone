import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const TextField(
            decoration:  InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))
              ),
              hintText: 'search here',
              fillColor: Colors.white,
              filled: true,
              suffixIcon:  Icon(Icons.search_rounded),iconColor: Colors.red,
              
            ),
          ),
          
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 16,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 100,
              width: 50,
              child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIhv4uQ9M6gq6JDeOhl9fuRyPXePuh11H6vA&usqp=CAU'),
            );
          },
        ),
      ),
    );
  }
}
