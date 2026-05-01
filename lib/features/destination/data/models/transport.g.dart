// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTransportCollection on Isar {
  IsarCollection<Transport> get transports => this.collection();
}

const TransportSchema = CollectionSchema(
  name: r'Transport',
  id: 6878705723785060898,
  properties: {
    r'approxCost': PropertySchema(
      id: 0,
      name: r'approxCost',
      type: IsarType.string,
    ),
    r'destinationId': PropertySchema(
      id: 1,
      name: r'destinationId',
      type: IsarType.long,
    ),
    r'duration': PropertySchema(
      id: 2,
      name: r'duration',
      type: IsarType.string,
    ),
    r'fromCity': PropertySchema(
      id: 3,
      name: r'fromCity',
      type: IsarType.string,
    ),
    r'mode': PropertySchema(
      id: 4,
      name: r'mode',
      type: IsarType.string,
    ),
    r'operator': PropertySchema(
      id: 5,
      name: r'operator',
      type: IsarType.string,
    ),
    r'tips': PropertySchema(
      id: 6,
      name: r'tips',
      type: IsarType.stringList,
    )
  },
  estimateSize: _transportEstimateSize,
  serialize: _transportSerialize,
  deserialize: _transportDeserialize,
  deserializeProp: _transportDeserializeProp,
  idName: r'id',
  indexes: {
    r'destinationId': IndexSchema(
      id: -6641374924133285701,
      name: r'destinationId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'destinationId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'mode': IndexSchema(
      id: 7416084707875161816,
      name: r'mode',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'mode',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _transportGetId,
  getLinks: _transportGetLinks,
  attach: _transportAttach,
  version: '3.1.0+1',
);

int _transportEstimateSize(
  Transport object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.approxCost;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.duration;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fromCity;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.mode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.operator;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.tips;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  return bytesCount;
}

void _transportSerialize(
  Transport object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.approxCost);
  writer.writeLong(offsets[1], object.destinationId);
  writer.writeString(offsets[2], object.duration);
  writer.writeString(offsets[3], object.fromCity);
  writer.writeString(offsets[4], object.mode);
  writer.writeString(offsets[5], object.operator);
  writer.writeStringList(offsets[6], object.tips);
}

Transport _transportDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Transport();
  object.approxCost = reader.readStringOrNull(offsets[0]);
  object.destinationId = reader.readLongOrNull(offsets[1]);
  object.duration = reader.readStringOrNull(offsets[2]);
  object.fromCity = reader.readStringOrNull(offsets[3]);
  object.id = id;
  object.mode = reader.readStringOrNull(offsets[4]);
  object.operator = reader.readStringOrNull(offsets[5]);
  object.tips = reader.readStringList(offsets[6]);
  return object;
}

P _transportDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _transportGetId(Transport object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _transportGetLinks(Transport object) {
  return [];
}

void _transportAttach(IsarCollection<dynamic> col, Id id, Transport object) {
  object.id = id;
}

extension TransportQueryWhereSort
    on QueryBuilder<Transport, Transport, QWhere> {
  QueryBuilder<Transport, Transport, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Transport, Transport, QAfterWhere> anyDestinationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'destinationId'),
      );
    });
  }
}

extension TransportQueryWhere
    on QueryBuilder<Transport, Transport, QWhereClause> {
  QueryBuilder<Transport, Transport, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Transport, Transport, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Transport, Transport, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Transport, Transport, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterWhereClause> destinationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'destinationId',
        value: [null],
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterWhereClause>
      destinationIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'destinationId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterWhereClause> destinationIdEqualTo(
      int? destinationId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'destinationId',
        value: [destinationId],
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterWhereClause> destinationIdNotEqualTo(
      int? destinationId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'destinationId',
              lower: [],
              upper: [destinationId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'destinationId',
              lower: [destinationId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'destinationId',
              lower: [destinationId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'destinationId',
              lower: [],
              upper: [destinationId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Transport, Transport, QAfterWhereClause>
      destinationIdGreaterThan(
    int? destinationId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'destinationId',
        lower: [destinationId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterWhereClause> destinationIdLessThan(
    int? destinationId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'destinationId',
        lower: [],
        upper: [destinationId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterWhereClause> destinationIdBetween(
    int? lowerDestinationId,
    int? upperDestinationId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'destinationId',
        lower: [lowerDestinationId],
        includeLower: includeLower,
        upper: [upperDestinationId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterWhereClause> modeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'mode',
        value: [null],
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterWhereClause> modeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'mode',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterWhereClause> modeEqualTo(
      String? mode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'mode',
        value: [mode],
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterWhereClause> modeNotEqualTo(
      String? mode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'mode',
              lower: [],
              upper: [mode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'mode',
              lower: [mode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'mode',
              lower: [mode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'mode',
              lower: [],
              upper: [mode],
              includeUpper: false,
            ));
      }
    });
  }
}

extension TransportQueryFilter
    on QueryBuilder<Transport, Transport, QFilterCondition> {
  QueryBuilder<Transport, Transport, QAfterFilterCondition> approxCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'approxCost',
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition>
      approxCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'approxCost',
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> approxCostEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'approxCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition>
      approxCostGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'approxCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> approxCostLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'approxCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> approxCostBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'approxCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition>
      approxCostStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'approxCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> approxCostEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'approxCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> approxCostContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'approxCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> approxCostMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'approxCost',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition>
      approxCostIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'approxCost',
        value: '',
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition>
      approxCostIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'approxCost',
        value: '',
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition>
      destinationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'destinationId',
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition>
      destinationIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'destinationId',
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition>
      destinationIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destinationId',
        value: value,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition>
      destinationIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'destinationId',
        value: value,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition>
      destinationIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'destinationId',
        value: value,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition>
      destinationIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'destinationId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> durationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'duration',
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition>
      durationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'duration',
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> durationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> durationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> durationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> durationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'duration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> durationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> durationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> durationContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> durationMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'duration',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> durationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'duration',
        value: '',
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition>
      durationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'duration',
        value: '',
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> fromCityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fromCity',
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition>
      fromCityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fromCity',
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> fromCityEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromCity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> fromCityGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fromCity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> fromCityLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fromCity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> fromCityBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fromCity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> fromCityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fromCity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> fromCityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fromCity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> fromCityContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fromCity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> fromCityMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fromCity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> fromCityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromCity',
        value: '',
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition>
      fromCityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fromCity',
        value: '',
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> modeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mode',
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> modeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mode',
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> modeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> modeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> modeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> modeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> modeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> modeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> modeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> modeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> modeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mode',
        value: '',
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> modeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mode',
        value: '',
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> operatorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'operator',
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition>
      operatorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'operator',
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> operatorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'operator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> operatorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'operator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> operatorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'operator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> operatorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'operator',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> operatorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'operator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> operatorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'operator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> operatorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'operator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> operatorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'operator',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> operatorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'operator',
        value: '',
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition>
      operatorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'operator',
        value: '',
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> tipsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tips',
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> tipsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tips',
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> tipsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tips',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition>
      tipsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tips',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> tipsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tips',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> tipsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tips',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition>
      tipsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tips',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> tipsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tips',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> tipsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tips',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> tipsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tips',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition>
      tipsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tips',
        value: '',
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition>
      tipsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tips',
        value: '',
      ));
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> tipsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tips',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> tipsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tips',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> tipsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tips',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> tipsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tips',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition>
      tipsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tips',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Transport, Transport, QAfterFilterCondition> tipsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tips',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension TransportQueryObject
    on QueryBuilder<Transport, Transport, QFilterCondition> {}

extension TransportQueryLinks
    on QueryBuilder<Transport, Transport, QFilterCondition> {}

extension TransportQuerySortBy on QueryBuilder<Transport, Transport, QSortBy> {
  QueryBuilder<Transport, Transport, QAfterSortBy> sortByApproxCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approxCost', Sort.asc);
    });
  }

  QueryBuilder<Transport, Transport, QAfterSortBy> sortByApproxCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approxCost', Sort.desc);
    });
  }

  QueryBuilder<Transport, Transport, QAfterSortBy> sortByDestinationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationId', Sort.asc);
    });
  }

  QueryBuilder<Transport, Transport, QAfterSortBy> sortByDestinationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationId', Sort.desc);
    });
  }

  QueryBuilder<Transport, Transport, QAfterSortBy> sortByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<Transport, Transport, QAfterSortBy> sortByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<Transport, Transport, QAfterSortBy> sortByFromCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromCity', Sort.asc);
    });
  }

  QueryBuilder<Transport, Transport, QAfterSortBy> sortByFromCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromCity', Sort.desc);
    });
  }

  QueryBuilder<Transport, Transport, QAfterSortBy> sortByMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mode', Sort.asc);
    });
  }

  QueryBuilder<Transport, Transport, QAfterSortBy> sortByModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mode', Sort.desc);
    });
  }

  QueryBuilder<Transport, Transport, QAfterSortBy> sortByOperator() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operator', Sort.asc);
    });
  }

  QueryBuilder<Transport, Transport, QAfterSortBy> sortByOperatorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operator', Sort.desc);
    });
  }
}

extension TransportQuerySortThenBy
    on QueryBuilder<Transport, Transport, QSortThenBy> {
  QueryBuilder<Transport, Transport, QAfterSortBy> thenByApproxCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approxCost', Sort.asc);
    });
  }

  QueryBuilder<Transport, Transport, QAfterSortBy> thenByApproxCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approxCost', Sort.desc);
    });
  }

  QueryBuilder<Transport, Transport, QAfterSortBy> thenByDestinationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationId', Sort.asc);
    });
  }

  QueryBuilder<Transport, Transport, QAfterSortBy> thenByDestinationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationId', Sort.desc);
    });
  }

  QueryBuilder<Transport, Transport, QAfterSortBy> thenByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<Transport, Transport, QAfterSortBy> thenByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<Transport, Transport, QAfterSortBy> thenByFromCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromCity', Sort.asc);
    });
  }

  QueryBuilder<Transport, Transport, QAfterSortBy> thenByFromCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromCity', Sort.desc);
    });
  }

  QueryBuilder<Transport, Transport, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Transport, Transport, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Transport, Transport, QAfterSortBy> thenByMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mode', Sort.asc);
    });
  }

  QueryBuilder<Transport, Transport, QAfterSortBy> thenByModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mode', Sort.desc);
    });
  }

  QueryBuilder<Transport, Transport, QAfterSortBy> thenByOperator() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operator', Sort.asc);
    });
  }

  QueryBuilder<Transport, Transport, QAfterSortBy> thenByOperatorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operator', Sort.desc);
    });
  }
}

extension TransportQueryWhereDistinct
    on QueryBuilder<Transport, Transport, QDistinct> {
  QueryBuilder<Transport, Transport, QDistinct> distinctByApproxCost(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'approxCost', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Transport, Transport, QDistinct> distinctByDestinationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destinationId');
    });
  }

  QueryBuilder<Transport, Transport, QDistinct> distinctByDuration(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'duration', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Transport, Transport, QDistinct> distinctByFromCity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fromCity', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Transport, Transport, QDistinct> distinctByMode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Transport, Transport, QDistinct> distinctByOperator(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'operator', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Transport, Transport, QDistinct> distinctByTips() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tips');
    });
  }
}

extension TransportQueryProperty
    on QueryBuilder<Transport, Transport, QQueryProperty> {
  QueryBuilder<Transport, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Transport, String?, QQueryOperations> approxCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'approxCost');
    });
  }

  QueryBuilder<Transport, int?, QQueryOperations> destinationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destinationId');
    });
  }

  QueryBuilder<Transport, String?, QQueryOperations> durationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'duration');
    });
  }

  QueryBuilder<Transport, String?, QQueryOperations> fromCityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fromCity');
    });
  }

  QueryBuilder<Transport, String?, QQueryOperations> modeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mode');
    });
  }

  QueryBuilder<Transport, String?, QQueryOperations> operatorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'operator');
    });
  }

  QueryBuilder<Transport, List<String>?, QQueryOperations> tipsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tips');
    });
  }
}
