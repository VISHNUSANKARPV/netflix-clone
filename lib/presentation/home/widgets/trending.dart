import 'package:flutter/material.dart';
import 'package:net_flix/presentation/common_widgets/utils/text.dart';
import 'package:net_flix/presentation/home/description.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({Key? key, required this.trending}) : super(key: key);
  final List trending;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ModifyText(text: 'Trending Movies', size: 22),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: trending.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                    name: trending[index]['title']??'',
                                    description:
                                        
                                            trending[index]['overview'],
                                    bannerurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['backdrop_path'],
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['poster_path'],
                                    vote: 
                                        trending[index]['vote_average'].toString()
                                            ,
                                    lauch_on:
                                        
                                            trending[index]['release_date'].toString(),
                                  )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Container(
                          height: 250,
                          width: 120,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500' +
                                trending[index]['poster_path'],
                          )))),
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
