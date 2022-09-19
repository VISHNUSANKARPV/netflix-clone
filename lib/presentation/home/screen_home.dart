import 'package:flutter/material.dart';
import 'package:net_flix/presentation/home/widgets/toprated.dart';
import 'package:net_flix/presentation/home/widgets/trending.dart';
import 'package:net_flix/presentation/home/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = '536ddbd96e937b073b3833670547e756';
  final String accesstocken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MzZkZGJkOTZlOTM3YjA3M2IzODMzNjcwNTQ3ZTc1NiIsInN1YiI6IjYyYWQ2YTJlOTQ0YTU3MDA1MDEyM2E2YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Ib4E5zl-Y9IBiLKCXkftyF38x9VGdwcXYNoCJhyTRJA';

  @override
  void initState() {
    loadMovie();
    super.initState();
  }

  loadMovie() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, accesstocken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });

    print(trendingresult);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: false,
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      'TV Show',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text('Movies', style: TextStyle(fontSize: 12)),
                    Text('Categories', style: TextStyle(fontSize: 12)),
                  ],
                ),
                background: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://i.pinimg.com/564x/09/6c/f9/096cf903787b6aeb81691a13a08b5e31.jpg'),
                            fit: BoxFit.cover)),
                    child: Column(
                      children: [
                        AppBar(
                          backgroundColor: Colors.transparent,
                          leading: Image.network(
                              'https://i.pinimg.com/564x/ee/a0/da/eea0da5d3dbd5b3bf4b46f2707613aa2.jpg'),
                          actions: <Widget>[
                            IconButton(
                              icon: const Icon(Icons.person),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.settings),
                              tooltip: 'Setting Icon',
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ))),
            expandedHeight: 500,
            backgroundColor: Colors.transparent,
          ),

          TrendingMovies(trending: trendingmovies),
          TopRated(toprated: topratedmovies),
          PopularMovies(popular: tv)
        ],
      ),
    );
  }
}
