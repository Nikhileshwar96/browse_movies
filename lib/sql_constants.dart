int sqlVersion = 1;
var searchTableName = 'searched_movies';
var movieDetailsTablename = 'movie_details';
var searchTableCreationQuery =
    "CREATE TABLE $searchTableName(imdbID TEXT PRIMARY KEY, Title TEXT, Year TEXT, Type TEXT, Poster TEXT)";
var movieDetailstableCreationQuery =
    "CREATE TABLE $movieDetailsTablename(imdbID TEXT PRIMARY KEY, Title TEXT, Year TEXT, Rated TEXT, Released TEXT, Runtime TEXT, Genre TEXT, Director TEXT, Writer TEXT, Actors TEXT, Plot TEXT, Type TEXT, Poster TEXT, imdbRating TEXT)";
