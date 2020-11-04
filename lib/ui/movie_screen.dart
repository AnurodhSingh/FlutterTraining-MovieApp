import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'movie_detail_screen.dart';

/// Quotes screen
class MovieScreen extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();

  final List<String> movies = [
    'Titanic',
    'Blade Runner',
    'Rambo',
    'The Avengers',
    'Avatar',
    'I Am Legend',
    '300',
    'The Wolf of Wall Street',
    'Interstellar',
    'Game of Thrones',
    'Vikings',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: <Widget>[
              movieCard(movieList[index], context),
              Positioned(
                  top: 10.0, child: movieImage(movieList[index].images[0])),
            ]);
          }),
    );
  }

  InkWell movieCard(Movie movie, BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => MovieDetailScreen(movieName: movie.title, movie: movie)
          )
        )
      },
      child: Container(
        margin: EdgeInsets.only(left: 40),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .15,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 40.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: Colors.white),
                        ),
                      ),
                    ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Rating: ${movie.imdbRating} / 10',
                        style: TextStyle(fontSize: 15.0, color: Colors.grey),
                      ),
                      Text('Released: ${movie.released}',
                          style: mainTextStyle()),
                    ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Runtime: ${movie.runtime}',
                          style: mainTextStyle()),
                      Text('Rated: ${movie.rated}', style: mainTextStyle(), textAlign: TextAlign.left,),
                    ]
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle mainTextStyle() {
    return TextStyle(
      fontSize: 13.0,
      color: Colors.grey,
    );
  }

  Widget movieImage(String imageUrl) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl ?? 
            'https://images-na.ssl-images-amazon.com/images/M/MV5BMTc0NzAxODAyMl5BMl5BanBnXkFtZTgwMDg0MzQ4MDE@._V1_SX1500_CR0,0,1500,999_AL_.jpg'),
          fit: BoxFit.cover
        )
      ),
    );
  }
}
