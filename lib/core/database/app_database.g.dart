// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SessionRecordsTable extends SessionRecords
    with TableInfo<$SessionRecordsTable, SessionRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'session_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<SessionRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  SessionRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionRecord(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $SessionRecordsTable createAlias(String alias) {
    return $SessionRecordsTable(attachedDatabase, alias);
  }
}

class SessionRecord extends DataClass implements Insertable<SessionRecord> {
  final String key;
  final String value;
  const SessionRecord({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  SessionRecordsCompanion toCompanion(bool nullToAbsent) {
    return SessionRecordsCompanion(key: Value(key), value: Value(value));
  }

  factory SessionRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionRecord(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  SessionRecord copyWith({String? key, String? value}) =>
      SessionRecord(key: key ?? this.key, value: value ?? this.value);
  SessionRecord copyWithCompanion(SessionRecordsCompanion data) {
    return SessionRecord(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SessionRecord(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionRecord &&
          other.key == this.key &&
          other.value == this.value);
}

class SessionRecordsCompanion extends UpdateCompanion<SessionRecord> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const SessionRecordsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SessionRecordsCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<SessionRecord> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SessionRecordsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return SessionRecordsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionRecordsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PreferencesTable extends Preferences
    with TableInfo<$PreferencesTable, Preference> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PreferencesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'preferences';
  @override
  VerificationContext validateIntegrity(
    Insertable<Preference> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  Preference map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Preference(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $PreferencesTable createAlias(String alias) {
    return $PreferencesTable(attachedDatabase, alias);
  }
}

class Preference extends DataClass implements Insertable<Preference> {
  final String key;
  final String value;
  const Preference({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  PreferencesCompanion toCompanion(bool nullToAbsent) {
    return PreferencesCompanion(key: Value(key), value: Value(value));
  }

  factory Preference.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Preference(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  Preference copyWith({String? key, String? value}) =>
      Preference(key: key ?? this.key, value: value ?? this.value);
  Preference copyWithCompanion(PreferencesCompanion data) {
    return Preference(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Preference(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Preference &&
          other.key == this.key &&
          other.value == this.value);
}

class PreferencesCompanion extends UpdateCompanion<Preference> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const PreferencesCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PreferencesCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<Preference> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PreferencesCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return PreferencesCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PreferencesCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CommandQueueEntriesTable extends CommandQueueEntries
    with TableInfo<$CommandQueueEntriesTable, CommandQueueEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CommandQueueEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _commandIdMeta = const VerificationMeta(
    'commandId',
  );
  @override
  late final GeneratedColumn<String> commandId = GeneratedColumn<String>(
    'command_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<int> entityId = GeneratedColumn<int>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _errorMeta = const VerificationMeta('error');
  @override
  late final GeneratedColumn<String> error = GeneratedColumn<String>(
    'error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviceOccurredAtMeta = const VerificationMeta(
    'deviceOccurredAt',
  );
  @override
  late final GeneratedColumn<DateTime> deviceOccurredAt =
      GeneratedColumn<DateTime>(
        'device_occurred_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    commandId,
    entityType,
    entityId,
    payload,
    status,
    error,
    deviceOccurredAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'command_queue_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<CommandQueueEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('command_id')) {
      context.handle(
        _commandIdMeta,
        commandId.isAcceptableOrUnknown(data['command_id']!, _commandIdMeta),
      );
    } else if (isInserting) {
      context.missing(_commandIdMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('error')) {
      context.handle(
        _errorMeta,
        error.isAcceptableOrUnknown(data['error']!, _errorMeta),
      );
    }
    if (data.containsKey('device_occurred_at')) {
      context.handle(
        _deviceOccurredAtMeta,
        deviceOccurredAt.isAcceptableOrUnknown(
          data['device_occurred_at']!,
          _deviceOccurredAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_deviceOccurredAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CommandQueueEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CommandQueueEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      commandId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}command_id'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}entity_id'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      error: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error'],
      ),
      deviceOccurredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}device_occurred_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CommandQueueEntriesTable createAlias(String alias) {
    return $CommandQueueEntriesTable(attachedDatabase, alias);
  }
}

class CommandQueueEntry extends DataClass
    implements Insertable<CommandQueueEntry> {
  final int id;
  final String commandId;
  final String entityType;
  final int entityId;
  final String payload;
  final String status;
  final String? error;
  final DateTime deviceOccurredAt;
  final DateTime updatedAt;
  const CommandQueueEntry({
    required this.id,
    required this.commandId,
    required this.entityType,
    required this.entityId,
    required this.payload,
    required this.status,
    this.error,
    required this.deviceOccurredAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['command_id'] = Variable<String>(commandId);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<int>(entityId);
    map['payload'] = Variable<String>(payload);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || error != null) {
      map['error'] = Variable<String>(error);
    }
    map['device_occurred_at'] = Variable<DateTime>(deviceOccurredAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CommandQueueEntriesCompanion toCompanion(bool nullToAbsent) {
    return CommandQueueEntriesCompanion(
      id: Value(id),
      commandId: Value(commandId),
      entityType: Value(entityType),
      entityId: Value(entityId),
      payload: Value(payload),
      status: Value(status),
      error: error == null && nullToAbsent
          ? const Value.absent()
          : Value(error),
      deviceOccurredAt: Value(deviceOccurredAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CommandQueueEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CommandQueueEntry(
      id: serializer.fromJson<int>(json['id']),
      commandId: serializer.fromJson<String>(json['commandId']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<int>(json['entityId']),
      payload: serializer.fromJson<String>(json['payload']),
      status: serializer.fromJson<String>(json['status']),
      error: serializer.fromJson<String?>(json['error']),
      deviceOccurredAt: serializer.fromJson<DateTime>(json['deviceOccurredAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'commandId': serializer.toJson<String>(commandId),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<int>(entityId),
      'payload': serializer.toJson<String>(payload),
      'status': serializer.toJson<String>(status),
      'error': serializer.toJson<String?>(error),
      'deviceOccurredAt': serializer.toJson<DateTime>(deviceOccurredAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CommandQueueEntry copyWith({
    int? id,
    String? commandId,
    String? entityType,
    int? entityId,
    String? payload,
    String? status,
    Value<String?> error = const Value.absent(),
    DateTime? deviceOccurredAt,
    DateTime? updatedAt,
  }) => CommandQueueEntry(
    id: id ?? this.id,
    commandId: commandId ?? this.commandId,
    entityType: entityType ?? this.entityType,
    entityId: entityId ?? this.entityId,
    payload: payload ?? this.payload,
    status: status ?? this.status,
    error: error.present ? error.value : this.error,
    deviceOccurredAt: deviceOccurredAt ?? this.deviceOccurredAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CommandQueueEntry copyWithCompanion(CommandQueueEntriesCompanion data) {
    return CommandQueueEntry(
      id: data.id.present ? data.id.value : this.id,
      commandId: data.commandId.present ? data.commandId.value : this.commandId,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      payload: data.payload.present ? data.payload.value : this.payload,
      status: data.status.present ? data.status.value : this.status,
      error: data.error.present ? data.error.value : this.error,
      deviceOccurredAt: data.deviceOccurredAt.present
          ? data.deviceOccurredAt.value
          : this.deviceOccurredAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CommandQueueEntry(')
          ..write('id: $id, ')
          ..write('commandId: $commandId, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('payload: $payload, ')
          ..write('status: $status, ')
          ..write('error: $error, ')
          ..write('deviceOccurredAt: $deviceOccurredAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    commandId,
    entityType,
    entityId,
    payload,
    status,
    error,
    deviceOccurredAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CommandQueueEntry &&
          other.id == this.id &&
          other.commandId == this.commandId &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.payload == this.payload &&
          other.status == this.status &&
          other.error == this.error &&
          other.deviceOccurredAt == this.deviceOccurredAt &&
          other.updatedAt == this.updatedAt);
}

class CommandQueueEntriesCompanion extends UpdateCompanion<CommandQueueEntry> {
  final Value<int> id;
  final Value<String> commandId;
  final Value<String> entityType;
  final Value<int> entityId;
  final Value<String> payload;
  final Value<String> status;
  final Value<String?> error;
  final Value<DateTime> deviceOccurredAt;
  final Value<DateTime> updatedAt;
  const CommandQueueEntriesCompanion({
    this.id = const Value.absent(),
    this.commandId = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.payload = const Value.absent(),
    this.status = const Value.absent(),
    this.error = const Value.absent(),
    this.deviceOccurredAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CommandQueueEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String commandId,
    required String entityType,
    required int entityId,
    required String payload,
    required String status,
    this.error = const Value.absent(),
    required DateTime deviceOccurredAt,
    required DateTime updatedAt,
  }) : commandId = Value(commandId),
       entityType = Value(entityType),
       entityId = Value(entityId),
       payload = Value(payload),
       status = Value(status),
       deviceOccurredAt = Value(deviceOccurredAt),
       updatedAt = Value(updatedAt);
  static Insertable<CommandQueueEntry> custom({
    Expression<int>? id,
    Expression<String>? commandId,
    Expression<String>? entityType,
    Expression<int>? entityId,
    Expression<String>? payload,
    Expression<String>? status,
    Expression<String>? error,
    Expression<DateTime>? deviceOccurredAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (commandId != null) 'command_id': commandId,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (payload != null) 'payload': payload,
      if (status != null) 'status': status,
      if (error != null) 'error': error,
      if (deviceOccurredAt != null) 'device_occurred_at': deviceOccurredAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CommandQueueEntriesCompanion copyWith({
    Value<int>? id,
    Value<String>? commandId,
    Value<String>? entityType,
    Value<int>? entityId,
    Value<String>? payload,
    Value<String>? status,
    Value<String?>? error,
    Value<DateTime>? deviceOccurredAt,
    Value<DateTime>? updatedAt,
  }) {
    return CommandQueueEntriesCompanion(
      id: id ?? this.id,
      commandId: commandId ?? this.commandId,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      payload: payload ?? this.payload,
      status: status ?? this.status,
      error: error ?? this.error,
      deviceOccurredAt: deviceOccurredAt ?? this.deviceOccurredAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (commandId.present) {
      map['command_id'] = Variable<String>(commandId.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<int>(entityId.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (error.present) {
      map['error'] = Variable<String>(error.value);
    }
    if (deviceOccurredAt.present) {
      map['device_occurred_at'] = Variable<DateTime>(deviceOccurredAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommandQueueEntriesCompanion(')
          ..write('id: $id, ')
          ..write('commandId: $commandId, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('payload: $payload, ')
          ..write('status: $status, ')
          ..write('error: $error, ')
          ..write('deviceOccurredAt: $deviceOccurredAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ReadMessagesTable extends ReadMessages
    with TableInfo<$ReadMessagesTable, ReadMessage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReadMessagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _messageIdMeta = const VerificationMeta(
    'messageId',
  );
  @override
  late final GeneratedColumn<int> messageId = GeneratedColumn<int>(
    'message_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _readAtMeta = const VerificationMeta('readAt');
  @override
  late final GeneratedColumn<DateTime> readAt = GeneratedColumn<DateTime>(
    'read_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [messageId, readAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'read_messages';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReadMessage> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('message_id')) {
      context.handle(
        _messageIdMeta,
        messageId.isAcceptableOrUnknown(data['message_id']!, _messageIdMeta),
      );
    }
    if (data.containsKey('read_at')) {
      context.handle(
        _readAtMeta,
        readAt.isAcceptableOrUnknown(data['read_at']!, _readAtMeta),
      );
    } else if (isInserting) {
      context.missing(_readAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {messageId};
  @override
  ReadMessage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReadMessage(
      messageId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}message_id'],
      )!,
      readAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}read_at'],
      )!,
    );
  }

  @override
  $ReadMessagesTable createAlias(String alias) {
    return $ReadMessagesTable(attachedDatabase, alias);
  }
}

class ReadMessage extends DataClass implements Insertable<ReadMessage> {
  final int messageId;
  final DateTime readAt;
  const ReadMessage({required this.messageId, required this.readAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['message_id'] = Variable<int>(messageId);
    map['read_at'] = Variable<DateTime>(readAt);
    return map;
  }

  ReadMessagesCompanion toCompanion(bool nullToAbsent) {
    return ReadMessagesCompanion(
      messageId: Value(messageId),
      readAt: Value(readAt),
    );
  }

  factory ReadMessage.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReadMessage(
      messageId: serializer.fromJson<int>(json['messageId']),
      readAt: serializer.fromJson<DateTime>(json['readAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'messageId': serializer.toJson<int>(messageId),
      'readAt': serializer.toJson<DateTime>(readAt),
    };
  }

  ReadMessage copyWith({int? messageId, DateTime? readAt}) => ReadMessage(
    messageId: messageId ?? this.messageId,
    readAt: readAt ?? this.readAt,
  );
  ReadMessage copyWithCompanion(ReadMessagesCompanion data) {
    return ReadMessage(
      messageId: data.messageId.present ? data.messageId.value : this.messageId,
      readAt: data.readAt.present ? data.readAt.value : this.readAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReadMessage(')
          ..write('messageId: $messageId, ')
          ..write('readAt: $readAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(messageId, readAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReadMessage &&
          other.messageId == this.messageId &&
          other.readAt == this.readAt);
}

class ReadMessagesCompanion extends UpdateCompanion<ReadMessage> {
  final Value<int> messageId;
  final Value<DateTime> readAt;
  const ReadMessagesCompanion({
    this.messageId = const Value.absent(),
    this.readAt = const Value.absent(),
  });
  ReadMessagesCompanion.insert({
    this.messageId = const Value.absent(),
    required DateTime readAt,
  }) : readAt = Value(readAt);
  static Insertable<ReadMessage> custom({
    Expression<int>? messageId,
    Expression<DateTime>? readAt,
  }) {
    return RawValuesInsertable({
      if (messageId != null) 'message_id': messageId,
      if (readAt != null) 'read_at': readAt,
    });
  }

  ReadMessagesCompanion copyWith({
    Value<int>? messageId,
    Value<DateTime>? readAt,
  }) {
    return ReadMessagesCompanion(
      messageId: messageId ?? this.messageId,
      readAt: readAt ?? this.readAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (messageId.present) {
      map['message_id'] = Variable<int>(messageId.value);
    }
    if (readAt.present) {
      map['read_at'] = Variable<DateTime>(readAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReadMessagesCompanion(')
          ..write('messageId: $messageId, ')
          ..write('readAt: $readAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SessionRecordsTable sessionRecords = $SessionRecordsTable(this);
  late final $PreferencesTable preferences = $PreferencesTable(this);
  late final $CommandQueueEntriesTable commandQueueEntries =
      $CommandQueueEntriesTable(this);
  late final $ReadMessagesTable readMessages = $ReadMessagesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    sessionRecords,
    preferences,
    commandQueueEntries,
    readMessages,
  ];
}

typedef $$SessionRecordsTableCreateCompanionBuilder =
    SessionRecordsCompanion Function({
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$SessionRecordsTableUpdateCompanionBuilder =
    SessionRecordsCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$SessionRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $SessionRecordsTable> {
  $$SessionRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SessionRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $SessionRecordsTable> {
  $$SessionRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SessionRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SessionRecordsTable> {
  $$SessionRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$SessionRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SessionRecordsTable,
          SessionRecord,
          $$SessionRecordsTableFilterComposer,
          $$SessionRecordsTableOrderingComposer,
          $$SessionRecordsTableAnnotationComposer,
          $$SessionRecordsTableCreateCompanionBuilder,
          $$SessionRecordsTableUpdateCompanionBuilder,
          (
            SessionRecord,
            BaseReferences<_$AppDatabase, $SessionRecordsTable, SessionRecord>,
          ),
          SessionRecord,
          PrefetchHooks Function()
        > {
  $$SessionRecordsTableTableManager(
    _$AppDatabase db,
    $SessionRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SessionRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SessionRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SessionRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) =>
                  SessionRecordsCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => SessionRecordsCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SessionRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SessionRecordsTable,
      SessionRecord,
      $$SessionRecordsTableFilterComposer,
      $$SessionRecordsTableOrderingComposer,
      $$SessionRecordsTableAnnotationComposer,
      $$SessionRecordsTableCreateCompanionBuilder,
      $$SessionRecordsTableUpdateCompanionBuilder,
      (
        SessionRecord,
        BaseReferences<_$AppDatabase, $SessionRecordsTable, SessionRecord>,
      ),
      SessionRecord,
      PrefetchHooks Function()
    >;
typedef $$PreferencesTableCreateCompanionBuilder =
    PreferencesCompanion Function({
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$PreferencesTableUpdateCompanionBuilder =
    PreferencesCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$PreferencesTableFilterComposer
    extends Composer<_$AppDatabase, $PreferencesTable> {
  $$PreferencesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PreferencesTableOrderingComposer
    extends Composer<_$AppDatabase, $PreferencesTable> {
  $$PreferencesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PreferencesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PreferencesTable> {
  $$PreferencesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$PreferencesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PreferencesTable,
          Preference,
          $$PreferencesTableFilterComposer,
          $$PreferencesTableOrderingComposer,
          $$PreferencesTableAnnotationComposer,
          $$PreferencesTableCreateCompanionBuilder,
          $$PreferencesTableUpdateCompanionBuilder,
          (
            Preference,
            BaseReferences<_$AppDatabase, $PreferencesTable, Preference>,
          ),
          Preference,
          PrefetchHooks Function()
        > {
  $$PreferencesTableTableManager(_$AppDatabase db, $PreferencesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PreferencesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PreferencesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PreferencesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PreferencesCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => PreferencesCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PreferencesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PreferencesTable,
      Preference,
      $$PreferencesTableFilterComposer,
      $$PreferencesTableOrderingComposer,
      $$PreferencesTableAnnotationComposer,
      $$PreferencesTableCreateCompanionBuilder,
      $$PreferencesTableUpdateCompanionBuilder,
      (
        Preference,
        BaseReferences<_$AppDatabase, $PreferencesTable, Preference>,
      ),
      Preference,
      PrefetchHooks Function()
    >;
typedef $$CommandQueueEntriesTableCreateCompanionBuilder =
    CommandQueueEntriesCompanion Function({
      Value<int> id,
      required String commandId,
      required String entityType,
      required int entityId,
      required String payload,
      required String status,
      Value<String?> error,
      required DateTime deviceOccurredAt,
      required DateTime updatedAt,
    });
typedef $$CommandQueueEntriesTableUpdateCompanionBuilder =
    CommandQueueEntriesCompanion Function({
      Value<int> id,
      Value<String> commandId,
      Value<String> entityType,
      Value<int> entityId,
      Value<String> payload,
      Value<String> status,
      Value<String?> error,
      Value<DateTime> deviceOccurredAt,
      Value<DateTime> updatedAt,
    });

class $$CommandQueueEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $CommandQueueEntriesTable> {
  $$CommandQueueEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get commandId => $composableBuilder(
    column: $table.commandId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get error => $composableBuilder(
    column: $table.error,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deviceOccurredAt => $composableBuilder(
    column: $table.deviceOccurredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CommandQueueEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CommandQueueEntriesTable> {
  $$CommandQueueEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get commandId => $composableBuilder(
    column: $table.commandId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get error => $composableBuilder(
    column: $table.error,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deviceOccurredAt => $composableBuilder(
    column: $table.deviceOccurredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CommandQueueEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CommandQueueEntriesTable> {
  $$CommandQueueEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get commandId =>
      $composableBuilder(column: $table.commandId, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get error =>
      $composableBuilder(column: $table.error, builder: (column) => column);

  GeneratedColumn<DateTime> get deviceOccurredAt => $composableBuilder(
    column: $table.deviceOccurredAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CommandQueueEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CommandQueueEntriesTable,
          CommandQueueEntry,
          $$CommandQueueEntriesTableFilterComposer,
          $$CommandQueueEntriesTableOrderingComposer,
          $$CommandQueueEntriesTableAnnotationComposer,
          $$CommandQueueEntriesTableCreateCompanionBuilder,
          $$CommandQueueEntriesTableUpdateCompanionBuilder,
          (
            CommandQueueEntry,
            BaseReferences<
              _$AppDatabase,
              $CommandQueueEntriesTable,
              CommandQueueEntry
            >,
          ),
          CommandQueueEntry,
          PrefetchHooks Function()
        > {
  $$CommandQueueEntriesTableTableManager(
    _$AppDatabase db,
    $CommandQueueEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CommandQueueEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CommandQueueEntriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CommandQueueEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> commandId = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<int> entityId = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> error = const Value.absent(),
                Value<DateTime> deviceOccurredAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => CommandQueueEntriesCompanion(
                id: id,
                commandId: commandId,
                entityType: entityType,
                entityId: entityId,
                payload: payload,
                status: status,
                error: error,
                deviceOccurredAt: deviceOccurredAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String commandId,
                required String entityType,
                required int entityId,
                required String payload,
                required String status,
                Value<String?> error = const Value.absent(),
                required DateTime deviceOccurredAt,
                required DateTime updatedAt,
              }) => CommandQueueEntriesCompanion.insert(
                id: id,
                commandId: commandId,
                entityType: entityType,
                entityId: entityId,
                payload: payload,
                status: status,
                error: error,
                deviceOccurredAt: deviceOccurredAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CommandQueueEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CommandQueueEntriesTable,
      CommandQueueEntry,
      $$CommandQueueEntriesTableFilterComposer,
      $$CommandQueueEntriesTableOrderingComposer,
      $$CommandQueueEntriesTableAnnotationComposer,
      $$CommandQueueEntriesTableCreateCompanionBuilder,
      $$CommandQueueEntriesTableUpdateCompanionBuilder,
      (
        CommandQueueEntry,
        BaseReferences<
          _$AppDatabase,
          $CommandQueueEntriesTable,
          CommandQueueEntry
        >,
      ),
      CommandQueueEntry,
      PrefetchHooks Function()
    >;
typedef $$ReadMessagesTableCreateCompanionBuilder =
    ReadMessagesCompanion Function({
      Value<int> messageId,
      required DateTime readAt,
    });
typedef $$ReadMessagesTableUpdateCompanionBuilder =
    ReadMessagesCompanion Function({
      Value<int> messageId,
      Value<DateTime> readAt,
    });

class $$ReadMessagesTableFilterComposer
    extends Composer<_$AppDatabase, $ReadMessagesTable> {
  $$ReadMessagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get messageId => $composableBuilder(
    column: $table.messageId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get readAt => $composableBuilder(
    column: $table.readAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReadMessagesTableOrderingComposer
    extends Composer<_$AppDatabase, $ReadMessagesTable> {
  $$ReadMessagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get messageId => $composableBuilder(
    column: $table.messageId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get readAt => $composableBuilder(
    column: $table.readAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReadMessagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReadMessagesTable> {
  $$ReadMessagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get messageId =>
      $composableBuilder(column: $table.messageId, builder: (column) => column);

  GeneratedColumn<DateTime> get readAt =>
      $composableBuilder(column: $table.readAt, builder: (column) => column);
}

class $$ReadMessagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReadMessagesTable,
          ReadMessage,
          $$ReadMessagesTableFilterComposer,
          $$ReadMessagesTableOrderingComposer,
          $$ReadMessagesTableAnnotationComposer,
          $$ReadMessagesTableCreateCompanionBuilder,
          $$ReadMessagesTableUpdateCompanionBuilder,
          (
            ReadMessage,
            BaseReferences<_$AppDatabase, $ReadMessagesTable, ReadMessage>,
          ),
          ReadMessage,
          PrefetchHooks Function()
        > {
  $$ReadMessagesTableTableManager(_$AppDatabase db, $ReadMessagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReadMessagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReadMessagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReadMessagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> messageId = const Value.absent(),
                Value<DateTime> readAt = const Value.absent(),
              }) => ReadMessagesCompanion(messageId: messageId, readAt: readAt),
          createCompanionCallback:
              ({
                Value<int> messageId = const Value.absent(),
                required DateTime readAt,
              }) => ReadMessagesCompanion.insert(
                messageId: messageId,
                readAt: readAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReadMessagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReadMessagesTable,
      ReadMessage,
      $$ReadMessagesTableFilterComposer,
      $$ReadMessagesTableOrderingComposer,
      $$ReadMessagesTableAnnotationComposer,
      $$ReadMessagesTableCreateCompanionBuilder,
      $$ReadMessagesTableUpdateCompanionBuilder,
      (
        ReadMessage,
        BaseReferences<_$AppDatabase, $ReadMessagesTable, ReadMessage>,
      ),
      ReadMessage,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SessionRecordsTableTableManager get sessionRecords =>
      $$SessionRecordsTableTableManager(_db, _db.sessionRecords);
  $$PreferencesTableTableManager get preferences =>
      $$PreferencesTableTableManager(_db, _db.preferences);
  $$CommandQueueEntriesTableTableManager get commandQueueEntries =>
      $$CommandQueueEntriesTableTableManager(_db, _db.commandQueueEntries);
  $$ReadMessagesTableTableManager get readMessages =>
      $$ReadMessagesTableTableManager(_db, _db.readMessages);
}
