import 'package:flutter/material.dart';
import 'package:net_flix/presentation/common_widgets/utils/text.dart';

class Description extends StatelessWidget {
  const Description({Key? key, required this.name, required this.description, required this.bannerurl, required this.posterurl, required this.vote, required this.lauch_on}) : super(key: key);

  final String name, description, bannerurl, posterurl, vote, lauch_on;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                Positioned(child: SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,

                  child: Image.network(bannerurl, fit: BoxFit.cover,),
                )),

                Positioned(bottom: 12,
                  child: ModifyText(text: ' ⭐  Average Rating -' +vote, size: 16)),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          if (name!= null)
          Container(
            padding: const EdgeInsets.all(10),
            child:  ModifyText(text: name, size: 24) ,
            
          )
          else const Text('not loading'),
          ModifyText(text: 'Releasing_On -'+ lauch_on, size: 14),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                height: 200,
                width: 100,
                child: Image.network(posterurl,fit: BoxFit.cover,),
              ),
              Flexible(child: ModifyText(text: description, size: 18))
            ],
          )
        ],
      ),
    );
  }
}
