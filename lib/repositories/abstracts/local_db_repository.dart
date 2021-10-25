abstract class LocalDBRepository {
  Future<List<Map<String, dynamic>>> queryTable(
    String tableName, {
    String? whereQuery,
    List<String>? whereArgs,
  });

  Future<bool> insertDataTable(
    String tableName,
    List<Map<String, dynamic>> dataRows, {
    bool needDeletion = false,
  });
}
