import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN SELECTALLPRODUTOS
Future<List<SelectAllProdutosRow>> performSelectAllProdutos(
  Database database,
) {
  final query = '''
select * from Produtos
''';
  return _readQuery(database, query, (d) => SelectAllProdutosRow(d));
}

class SelectAllProdutosRow extends SqliteRow {
  SelectAllProdutosRow(Map<String, dynamic> data) : super(data);

  int? get id => data['id'] as int?;
  String? get apelido => data['apelido'] as String?;
}

/// END SELECTALLPRODUTOS
