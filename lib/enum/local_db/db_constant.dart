class DBConfig {
  static const String name = 'MoneyDB';
  static const String path = './';
}

class DBCommand {
  static const String createTransactionTable = 'CREATE TABLE IF NOT EXISTS ${TableName.transaction} (id TEXT PRIMARY KEY, description TEXT, groupId TEXT, groupName TEXT, value INTEGER, type INTEGER, createdTime INTEGER, updateTime INTEGER, mode INTEGER, year INTEGER, month INTEGER)';
  static const String createGroupTable = 'CREATE TABLE IF NOT EXISTS ${TableName.group} (id TEXT PRIMARY KEY, name TEXT, description TEXT, createdTime INTEGER, updateTime INTEGER, mode INTEGER, year INTEGER, month INTEGER)';
}

class TableName {
  static const String transaction = '${DBConfig.name}Transaction';
  static const String group = '${DBConfig.name}Group';
}

class DBConstant {
  static const String name = 'name';
}
