import 'package:flutter/material.dart';
import 'package:net_flix/presentation/common_widgets/utils/text.dart';

class PopularMovies extends StatelessWidget {
  

  const PopularMovies({Key? key, required this.popular }) : super(key: key);
   final List popular;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            ModifyText(text: 'Popular Movies', size: 22),
      
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: popular.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: (){
      
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Container(
                        height: 250,
                       width: 120,
                        
                        decoration: BoxDecoration(
                         
                          image: DecorationImage(image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500'+popular[index]['poster_path'],
                        )))
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
