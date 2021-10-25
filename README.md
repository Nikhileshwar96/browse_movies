# browse_movies

App to browse through OMDB API.

## Pattern used

BLoC pattern is used to maintaain architecture within thhe app.

## Features add

- Search module handle successful search, failure due to too many results,  
- Storage of alredy fetched movie details in local DB
- Filter content based on types `movie` and `series`

## Major packages used
- `bloc` and `flutter_bloc` - for maintaining architecture
- `http` - for making http requests
- `sqflite` - for local storage interactions