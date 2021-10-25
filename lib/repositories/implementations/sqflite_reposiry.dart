import 'package:browse_movies/repositories/abstracts/local_db_repository.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../sql_constants.dart';

class SqfLiteRepository extends LocalDBRepository {
  Database? dbInstance;

  Future<Database> initializeLocalStorage() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'movies.db'),
      onCreate: (db, version) {
        db.execute(searchTableCreationQuery);
        db.execute(movieDetailstableCreationQuery);
      },
      version: sqlVersion,
    );
  }

  Future checkIfInitialized() async {
    dbInstance ??= await initializeLocalStorage();
  }

  @override
  Future<bool> insertDataTable(
    String tableName,
    List<Map<String, dynamic>> dataRows, {
    bool needDeletion = false,
  }) async {
    try {
      await checkIfInitialized();
      var batch = dbInstance!.batch();
      if (needDeletion) {
        batch.delete(tableName);
      }

      for (var dataRow in dataRows) {
        batch.insert(tableName, dataRow);
      }

      await batch.commit();
      return true;
    } on Exception {
      return false;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> queryTable(
    String tableName, {
    String? whereQuery,
    List<String>? whereArgs,
  }) async {
    try {
      await checkIfInitialized();
      return await dbInstance!.query(
        tableName,
        where: whereQuery,
        whereArgs: whereArgs,
      );
    } on Exception {
      return [];
    }
  }
}
