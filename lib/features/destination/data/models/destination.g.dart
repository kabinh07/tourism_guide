// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destination.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDestinationCollection on Isar {
  IsarCollection<Destination> get destinations => this.collection();
}

const DestinationSchema = CollectionSchema(
  name: r'Destination',
  id: -1376359499316704103,
  properties: {
    r'activityList': PropertySchema(
      id: 0,
      name: r'activityList',
      type: IsarType.stringList,
    ),
    r'averageTripDays': PropertySchema(
      id: 1,
      name: r'averageTripDays',
      type: IsarType.long,
    ),
    r'bestSeason': PropertySchema(
      id: 2,
      name: r'bestSeason',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 3,
      name: r'description',
      type: IsarType.string,
    ),
    r'district': PropertySchema(
      id: 4,
      name: r'district',
      type: IsarType.string,
    ),
    r'division': PropertySchema(
      id: 5,
      name: r'division',
      type: IsarType.string,
    ),
    r'estimatedBudget': PropertySchema(
      id: 6,
      name: r'estimatedBudget',
      type: IsarType.double,
    ),
    r'foodBudgetRange': PropertySchema(
      id: 7,
      name: r'foodBudgetRange',
      type: IsarType.string,
    ),
    r'hotelPriceRange': PropertySchema(
      id: 8,
      name: r'hotelPriceRange',
      type: IsarType.string,
    ),
    r'imageUrl': PropertySchema(
      id: 9,
      name: r'imageUrl',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 10,
      name: r'name',
      type: IsarType.string,
    ),
    r'popularityScore': PropertySchema(
      id: 11,
      name: r'popularityScore',
      type: IsarType.double,
    ),
    r'tags': PropertySchema(
      id: 12,
      name: r'tags',
      type: IsarType.stringList,
    ),
    r'travelMethods': PropertySchema(
      id: 13,
      name: r'travelMethods',
      type: IsarType.stringList,
    ),
    r'vectorEmbedding': PropertySchema(
      id: 14,
      name: r'vectorEmbedding',
      type: IsarType.doubleList,
    )
  },
  estimateSize: _destinationEstimateSize,
  serialize: _destinationSerialize,
  deserialize: _destinationDeserialize,
  deserializeProp: _destinationDeserializeProp,
  idName: r'id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'popularityScore': IndexSchema(
      id: -4157020465213378998,
      name: r'popularityScore',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'popularityScore',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _destinationGetId,
  getLinks: _destinationGetLinks,
  attach: _destinationAttach,
  version: '3.1.0+1',
);

int _destinationEstimateSize(
  Destination object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.activityList;
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
  {
    final value = object.bestSeason;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.district;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.division;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.foodBudgetRange;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.hotelPriceRange;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imageUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.tags;
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
  {
    final list = object.travelMethods;
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
  {
    final value = object.vectorEmbedding;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  return bytesCount;
}

void _destinationSerialize(
  Destination object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.activityList);
  writer.writeLong(offsets[1], object.averageTripDays);
  writer.writeString(offsets[2], object.bestSeason);
  writer.writeString(offsets[3], object.description);
  writer.writeString(offsets[4], object.district);
  writer.writeString(offsets[5], object.division);
  writer.writeDouble(offsets[6], object.estimatedBudget);
  writer.writeString(offsets[7], object.foodBudgetRange);
  writer.writeString(offsets[8], object.hotelPriceRange);
  writer.writeString(offsets[9], object.imageUrl);
  writer.writeString(offsets[10], object.name);
  writer.writeDouble(offsets[11], object.popularityScore);
  writer.writeStringList(offsets[12], object.tags);
  writer.writeStringList(offsets[13], object.travelMethods);
  writer.writeDoubleList(offsets[14], object.vectorEmbedding);
}

Destination _destinationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Destination();
  object.activityList = reader.readStringList(offsets[0]);
  object.averageTripDays = reader.readLongOrNull(offsets[1]);
  object.bestSeason = reader.readStringOrNull(offsets[2]);
  object.description = reader.readStringOrNull(offsets[3]);
  object.district = reader.readStringOrNull(offsets[4]);
  object.division = reader.readStringOrNull(offsets[5]);
  object.estimatedBudget = reader.readDoubleOrNull(offsets[6]);
  object.foodBudgetRange = reader.readStringOrNull(offsets[7]);
  object.hotelPriceRange = reader.readStringOrNull(offsets[8]);
  object.id = id;
  object.imageUrl = reader.readStringOrNull(offsets[9]);
  object.name = reader.readStringOrNull(offsets[10]);
  object.popularityScore = reader.readDoubleOrNull(offsets[11]);
  object.tags = reader.readStringList(offsets[12]);
  object.travelMethods = reader.readStringList(offsets[13]);
  object.vectorEmbedding = reader.readDoubleList(offsets[14]);
  return object;
}

P _destinationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset)) as P;
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
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readStringList(offset)) as P;
    case 13:
      return (reader.readStringList(offset)) as P;
    case 14:
      return (reader.readDoubleList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _destinationGetId(Destination object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _destinationGetLinks(Destination object) {
  return [];
}

void _destinationAttach(
    IsarCollection<dynamic> col, Id id, Destination object) {
  object.id = id;
}

extension DestinationQueryWhereSort
    on QueryBuilder<Destination, Destination, QWhere> {
  QueryBuilder<Destination, Destination, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Destination, Destination, QAfterWhere> anyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'name'),
      );
    });
  }

  QueryBuilder<Destination, Destination, QAfterWhere> anyPopularityScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'popularityScore'),
      );
    });
  }
}

extension DestinationQueryWhere
    on QueryBuilder<Destination, Destination, QWhereClause> {
  QueryBuilder<Destination, Destination, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<Destination, Destination, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Destination, Destination, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Destination, Destination, QAfterWhereClause> idBetween(
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

  QueryBuilder<Destination, Destination, QAfterWhereClause> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [null],
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterWhereClause> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterWhereClause> nameEqualTo(
      String? name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterWhereClause> nameNotEqualTo(
      String? name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Destination, Destination, QAfterWhereClause> nameGreaterThan(
    String? name, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [name],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterWhereClause> nameLessThan(
    String? name, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [],
        upper: [name],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterWhereClause> nameBetween(
    String? lowerName,
    String? upperName, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [lowerName],
        includeLower: includeLower,
        upper: [upperName],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterWhereClause> nameStartsWith(
      String NamePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [NamePrefix],
        upper: ['$NamePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterWhereClause> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [''],
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterWhereClause> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'name',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'name',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'name',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'name',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<Destination, Destination, QAfterWhereClause>
      popularityScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'popularityScore',
        value: [null],
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterWhereClause>
      popularityScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'popularityScore',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterWhereClause>
      popularityScoreEqualTo(double? popularityScore) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'popularityScore',
        value: [popularityScore],
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterWhereClause>
      popularityScoreNotEqualTo(double? popularityScore) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'popularityScore',
              lower: [],
              upper: [popularityScore],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'popularityScore',
              lower: [popularityScore],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'popularityScore',
              lower: [popularityScore],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'popularityScore',
              lower: [],
              upper: [popularityScore],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Destination, Destination, QAfterWhereClause>
      popularityScoreGreaterThan(
    double? popularityScore, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'popularityScore',
        lower: [popularityScore],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterWhereClause>
      popularityScoreLessThan(
    double? popularityScore, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'popularityScore',
        lower: [],
        upper: [popularityScore],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterWhereClause>
      popularityScoreBetween(
    double? lowerPopularityScore,
    double? upperPopularityScore, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'popularityScore',
        lower: [lowerPopularityScore],
        includeLower: includeLower,
        upper: [upperPopularityScore],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DestinationQueryFilter
    on QueryBuilder<Destination, Destination, QFilterCondition> {
  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      activityListIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'activityList',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      activityListIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'activityList',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      activityListElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activityList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      activityListElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activityList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      activityListElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activityList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      activityListElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activityList',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      activityListElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'activityList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      activityListElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'activityList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      activityListElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'activityList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      activityListElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'activityList',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      activityListElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activityList',
        value: '',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      activityListElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'activityList',
        value: '',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      activityListLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activityList',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      activityListIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activityList',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      activityListIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activityList',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      activityListLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activityList',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      activityListLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activityList',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      activityListLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activityList',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      averageTripDaysIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'averageTripDays',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      averageTripDaysIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'averageTripDays',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      averageTripDaysEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'averageTripDays',
        value: value,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      averageTripDaysGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'averageTripDays',
        value: value,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      averageTripDaysLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'averageTripDays',
        value: value,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      averageTripDaysBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'averageTripDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      bestSeasonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bestSeason',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      bestSeasonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bestSeason',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      bestSeasonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bestSeason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      bestSeasonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bestSeason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      bestSeasonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bestSeason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      bestSeasonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bestSeason',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      bestSeasonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bestSeason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      bestSeasonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bestSeason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      bestSeasonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bestSeason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      bestSeasonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bestSeason',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      bestSeasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bestSeason',
        value: '',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      bestSeasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bestSeason',
        value: '',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      districtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'district',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      districtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'district',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition> districtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      districtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      districtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition> districtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'district',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      districtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      districtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      districtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition> districtMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'district',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      districtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'district',
        value: '',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      districtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'district',
        value: '',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      divisionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'division',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      divisionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'division',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition> divisionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'division',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      divisionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'division',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      divisionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'division',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition> divisionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'division',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      divisionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'division',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      divisionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'division',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      divisionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'division',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition> divisionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'division',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      divisionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'division',
        value: '',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      divisionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'division',
        value: '',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      estimatedBudgetIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'estimatedBudget',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      estimatedBudgetIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'estimatedBudget',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      estimatedBudgetEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatedBudget',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      estimatedBudgetGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimatedBudget',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      estimatedBudgetLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimatedBudget',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      estimatedBudgetBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimatedBudget',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      foodBudgetRangeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'foodBudgetRange',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      foodBudgetRangeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'foodBudgetRange',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      foodBudgetRangeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodBudgetRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      foodBudgetRangeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'foodBudgetRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      foodBudgetRangeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'foodBudgetRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      foodBudgetRangeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'foodBudgetRange',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      foodBudgetRangeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'foodBudgetRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      foodBudgetRangeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'foodBudgetRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      foodBudgetRangeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'foodBudgetRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      foodBudgetRangeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'foodBudgetRange',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      foodBudgetRangeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodBudgetRange',
        value: '',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      foodBudgetRangeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'foodBudgetRange',
        value: '',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      hotelPriceRangeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hotelPriceRange',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      hotelPriceRangeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hotelPriceRange',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      hotelPriceRangeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hotelPriceRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      hotelPriceRangeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hotelPriceRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      hotelPriceRangeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hotelPriceRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      hotelPriceRangeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hotelPriceRange',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      hotelPriceRangeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hotelPriceRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      hotelPriceRangeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hotelPriceRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      hotelPriceRangeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hotelPriceRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      hotelPriceRangeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hotelPriceRange',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      hotelPriceRangeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hotelPriceRange',
        value: '',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      hotelPriceRangeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hotelPriceRange',
        value: '',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Destination, Destination, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Destination, Destination, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      imageUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      imageUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition> imageUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      imageUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      imageUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition> imageUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      imageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      imageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      imageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition> imageUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      popularityScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'popularityScore',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      popularityScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'popularityScore',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      popularityScoreEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'popularityScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      popularityScoreGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'popularityScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      popularityScoreLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'popularityScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      popularityScoreBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'popularityScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition> tagsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      tagsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      tagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      tagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      tagsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition> tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      travelMethodsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'travelMethods',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      travelMethodsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'travelMethods',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      travelMethodsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'travelMethods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      travelMethodsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'travelMethods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      travelMethodsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'travelMethods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      travelMethodsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'travelMethods',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      travelMethodsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'travelMethods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      travelMethodsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'travelMethods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      travelMethodsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'travelMethods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      travelMethodsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'travelMethods',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      travelMethodsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'travelMethods',
        value: '',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      travelMethodsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'travelMethods',
        value: '',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      travelMethodsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'travelMethods',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      travelMethodsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'travelMethods',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      travelMethodsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'travelMethods',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      travelMethodsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'travelMethods',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      travelMethodsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'travelMethods',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      travelMethodsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'travelMethods',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      vectorEmbeddingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vectorEmbedding',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      vectorEmbeddingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vectorEmbedding',
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      vectorEmbeddingElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vectorEmbedding',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      vectorEmbeddingElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vectorEmbedding',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      vectorEmbeddingElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vectorEmbedding',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      vectorEmbeddingElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vectorEmbedding',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      vectorEmbeddingLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'vectorEmbedding',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      vectorEmbeddingIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'vectorEmbedding',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      vectorEmbeddingIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'vectorEmbedding',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      vectorEmbeddingLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'vectorEmbedding',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      vectorEmbeddingLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'vectorEmbedding',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Destination, Destination, QAfterFilterCondition>
      vectorEmbeddingLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'vectorEmbedding',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension DestinationQueryObject
    on QueryBuilder<Destination, Destination, QFilterCondition> {}

extension DestinationQueryLinks
    on QueryBuilder<Destination, Destination, QFilterCondition> {}

extension DestinationQuerySortBy
    on QueryBuilder<Destination, Destination, QSortBy> {
  QueryBuilder<Destination, Destination, QAfterSortBy> sortByAverageTripDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageTripDays', Sort.asc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy>
      sortByAverageTripDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageTripDays', Sort.desc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> sortByBestSeason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bestSeason', Sort.asc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> sortByBestSeasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bestSeason', Sort.desc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> sortByDistrict() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.asc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> sortByDistrictDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.desc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> sortByDivision() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'division', Sort.asc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> sortByDivisionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'division', Sort.desc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> sortByEstimatedBudget() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedBudget', Sort.asc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy>
      sortByEstimatedBudgetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedBudget', Sort.desc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> sortByFoodBudgetRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodBudgetRange', Sort.asc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy>
      sortByFoodBudgetRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodBudgetRange', Sort.desc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> sortByHotelPriceRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hotelPriceRange', Sort.asc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy>
      sortByHotelPriceRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hotelPriceRange', Sort.desc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> sortByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> sortByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> sortByPopularityScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'popularityScore', Sort.asc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy>
      sortByPopularityScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'popularityScore', Sort.desc);
    });
  }
}

extension DestinationQuerySortThenBy
    on QueryBuilder<Destination, Destination, QSortThenBy> {
  QueryBuilder<Destination, Destination, QAfterSortBy> thenByAverageTripDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageTripDays', Sort.asc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy>
      thenByAverageTripDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageTripDays', Sort.desc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> thenByBestSeason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bestSeason', Sort.asc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> thenByBestSeasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bestSeason', Sort.desc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> thenByDistrict() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.asc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> thenByDistrictDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.desc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> thenByDivision() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'division', Sort.asc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> thenByDivisionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'division', Sort.desc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> thenByEstimatedBudget() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedBudget', Sort.asc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy>
      thenByEstimatedBudgetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedBudget', Sort.desc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> thenByFoodBudgetRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodBudgetRange', Sort.asc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy>
      thenByFoodBudgetRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodBudgetRange', Sort.desc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> thenByHotelPriceRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hotelPriceRange', Sort.asc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy>
      thenByHotelPriceRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hotelPriceRange', Sort.desc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> thenByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> thenByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy> thenByPopularityScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'popularityScore', Sort.asc);
    });
  }

  QueryBuilder<Destination, Destination, QAfterSortBy>
      thenByPopularityScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'popularityScore', Sort.desc);
    });
  }
}

extension DestinationQueryWhereDistinct
    on QueryBuilder<Destination, Destination, QDistinct> {
  QueryBuilder<Destination, Destination, QDistinct> distinctByActivityList() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activityList');
    });
  }

  QueryBuilder<Destination, Destination, QDistinct>
      distinctByAverageTripDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageTripDays');
    });
  }

  QueryBuilder<Destination, Destination, QDistinct> distinctByBestSeason(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bestSeason', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Destination, Destination, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Destination, Destination, QDistinct> distinctByDistrict(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'district', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Destination, Destination, QDistinct> distinctByDivision(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'division', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Destination, Destination, QDistinct>
      distinctByEstimatedBudget() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedBudget');
    });
  }

  QueryBuilder<Destination, Destination, QDistinct> distinctByFoodBudgetRange(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'foodBudgetRange',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Destination, Destination, QDistinct> distinctByHotelPriceRange(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hotelPriceRange',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Destination, Destination, QDistinct> distinctByImageUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Destination, Destination, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Destination, Destination, QDistinct>
      distinctByPopularityScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'popularityScore');
    });
  }

  QueryBuilder<Destination, Destination, QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }

  QueryBuilder<Destination, Destination, QDistinct> distinctByTravelMethods() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'travelMethods');
    });
  }

  QueryBuilder<Destination, Destination, QDistinct>
      distinctByVectorEmbedding() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vectorEmbedding');
    });
  }
}

extension DestinationQueryProperty
    on QueryBuilder<Destination, Destination, QQueryProperty> {
  QueryBuilder<Destination, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Destination, List<String>?, QQueryOperations>
      activityListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activityList');
    });
  }

  QueryBuilder<Destination, int?, QQueryOperations> averageTripDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageTripDays');
    });
  }

  QueryBuilder<Destination, String?, QQueryOperations> bestSeasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bestSeason');
    });
  }

  QueryBuilder<Destination, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Destination, String?, QQueryOperations> districtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'district');
    });
  }

  QueryBuilder<Destination, String?, QQueryOperations> divisionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'division');
    });
  }

  QueryBuilder<Destination, double?, QQueryOperations>
      estimatedBudgetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedBudget');
    });
  }

  QueryBuilder<Destination, String?, QQueryOperations>
      foodBudgetRangeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'foodBudgetRange');
    });
  }

  QueryBuilder<Destination, String?, QQueryOperations>
      hotelPriceRangeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hotelPriceRange');
    });
  }

  QueryBuilder<Destination, String?, QQueryOperations> imageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageUrl');
    });
  }

  QueryBuilder<Destination, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Destination, double?, QQueryOperations>
      popularityScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'popularityScore');
    });
  }

  QueryBuilder<Destination, List<String>?, QQueryOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }

  QueryBuilder<Destination, List<String>?, QQueryOperations>
      travelMethodsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'travelMethods');
    });
  }

  QueryBuilder<Destination, List<double>?, QQueryOperations>
      vectorEmbeddingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vectorEmbedding');
    });
  }
}
