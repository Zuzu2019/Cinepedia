import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: (moviedb.backdropPath != '')
        ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
        : 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJQAAACUCAMAAABC4vDmAAAAY1BMVEX///8AAAD+/v75+flqamqqqqrDw8MuLi7d3d2CgoLg4OA2NjYoKChISEjKysro6OjT09Py8vIZGRmampoTExOkpKRlZWWQkJB1dXUiIiILCwtTU1OysrK9vb1eXl57e3tAQEDg8cbiAAAFbklEQVR4nO2ciZKiOhRAEwKIrAn7Kv7/V757A7SCiFt47czkVLVLguEYws1mNWFfCDG+EKLRaDQajUaj0Wg0Go1Go3mfd1ZXotLclTx7w8o90H05viPlaak/Xqo+7IBffyZ1dh3luK3/mVTw+gcfE36FFJuf//elRFuauVkW7rdIGUQUP3dbw79Dijjn6yBgfYWUO3OitP0CKVYu4qXPd5US/Iki3ZsonuwpxYqqYA+LaG+kTmxHqRCyzOhREcWNlCd2lArk1xYPirBupJoda6obTvGorpwbqcLYTYpNo5rG2SyCmQuneMe7L/s5y3nbylkMqTOym1QUXE4TbFvxmVPC9pNKZvcTXznigjCr8cA0sKfEHaSi+SWpwu1ynKTPT6fyaF8cdpA6Llqv/8CKMBGJWaRVL+XGCykady8WrVzK6JdO9Kf3/zUp7q9I0dfqSrWUsWxRI9ZqGf+TFF93mgYlMyJ+ZyChWup0T2qK1he6IL5J20XqbkXRqbOdEA2mrd8BaqWMfEOKHq+UsnpIs8kKaqXCmxg1r6vpON5MSdVaL6RUiq3FqGt62bJFUV+S1npspVJbLWqgFITZ8/FKczsSVCrVrGgsrfhNIDvtKvW4ooCVVlfuKGXcj1EPWJ5eoZRdbZ96g2JetDqpmzn4K8yDqDqp8AMnWs2CqDqpJ269DQ7X4UqZ1FO33gbp1YhBlZTxWUXR2SRflVSXfip1NYpQJCWWE/B3+LkFFUl1CpwonUYMiqQ+blGSQKiU+ihGXVEydVLGeftcz5OpkxLbA84XULnmGebACWiaBv+Q4Ifz2RuZts7uUB1sdTWlmr9SyrPVEybVZ1I7oqX+OSnn/XnCc/RvSInW2pXs0fqtRqPR3EdwzlkEDxHh8hETOI76XSvrYPDo4nvXkEdG+A6ybMviYw4mEja9CDPMwLdsLFdAsY7hwIPzaBv6Aj9UsTjGflyQCgaMFslS309h2oY/fKoDh/Sx78e9wJFRXLA+rggrYbYKx2MO5FmERB58traEzDgSN/ap8CufZymURGNTBFi2Vzwb1zmUI3CZsBTYH1hETkUz/PFDdappPmwamUJOc2pRUoobkw1ML+xxvQgmCJEcyVktDBQDmIjiLqGoKXUSXNqjNBfQt3rV85tNPB6lmnCQkvuzBS5yNNBPnyOQym3c5MB8Du9wE7At4Bje5dDVdq6UipPOhe/TZpQmUiqlNUqlYpBK235lp+KRlJcNUh5tDtRkNnxrkDo4x2klH6VKkCHlINXLPUq5ewRSFZcLI91SioajVFisbupsSvl1mcJFsMSBHgOoIJRidmfjevopdIxBqgYhY5IyrqXixBajVOFeS5mjlF28XlMmrfwTnA1GMQk8o9Q5TJJMyDZ1HC8fTe9JAe5pTSqt35eCz5+xsdipPKODUvBcOXKtvGCX+fxLUjVuSLwt1cHlSsaGCh/vQCGwD4s2Jff416Wu2tS1lJfXV1Kvtim829rhbLJqUAoaiZTqJ6kWh82kHw47zqVCwiapqaFzkEq8T6TOtOkuUrmDUsEglXN7iFOhOUpZhVwwn0sZU0gQQ5zCmjqEp0Eqto+vXz4IMn1H6wyuje0OhcYNHaQgTLtSqsMlWvxVUnCQ23tzKczwzrjzDbkQwnwIsz4vxuCJPB08UQC+e3SkGVy+Ai8BShktNIaexo68+6pBqmUoNfx0soDKK8cvH6XScbhTM0Y4RuCqIwWtQ47rssO2ffnwp2EjLIoiQ8g/Bq/hVcQMeCBG1EGPGjFMgSd5pCCYQ5hr25hCBCYBxnAEHGKH2HcT4XTYP4uhMGFEUyEajUaj0Wg0Go1Go9FoNJp/l9/+h6JrkN/+16tr/AeHxnYJMA1kfgAAAABJRU5ErkJggg==',
    genreIds: [],
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: (moviedb.posterPath != '')
        ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
        : 'no-poster',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );

  static Movie movieDetailsToEntity(MovieDetails moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: (moviedb.backdropPath != '')
        ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
        : 'data:image/png;base64,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',
    genreIds: moviedb.genres.map((e) => e.name).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: (moviedb.posterPath != '')
        ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
        : 'no-poster',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );
}
