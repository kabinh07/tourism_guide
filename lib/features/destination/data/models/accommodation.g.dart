// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accommodation.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAccommodationCollection on Isar {
  IsarCollection<Accommodation> get accommodations => this.collection();
}

const AccommodationSchema = CollectionSchema(
  name: r'Accommodation',
  id: -597814903064070159,
  properties: {
    r'amenities': PropertySchema(
      id: 0,
      name: r'amenities',
      type: IsarType.stringList,
    ),
    r'destinationId': PropertySchema(
      id: 1,
      name: r'destinationId',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'priceRange': PropertySchema(
      id: 3,
      name: r'priceRange',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 4,
      name: r'type',
      type: IsarType.string,
    )
  },
  estimateSize: _accommodationEstimateSize,
  serialize: _accommodationSerialize,
  deserialize: _accommodationDeserialize,
  deserializeProp: _accommodationDeserializeProp,
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
    r'type': IndexSchema(
      id: 5117122708147080838,
      name: r'type',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'type',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _accommodationGetId,
  getLinks: _accommodationGetLinks,
  attach: _accommodationAttach,
  version: '3.1.0+1',
);

int _accommodationEstimateSize(
  Accommodation object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.amenities;
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
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.priceRange;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.type;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _accommodationSerialize(
  Accommodation object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.amenities);
  writer.writeLong(offsets[1], object.destinationId);
  writer.writeString(offsets[2], object.name);
  writer.writeString(offsets[3], object.priceRange);
  writer.writeString(offsets[4], object.type);
}

Accommodation _accommodationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Accommodation();
  object.amenities = reader.readStringList(offsets[0]);
  object.destinationId = reader.readLongOrNull(offsets[1]);
  object.id = id;
  object.name = reader.readStringOrNull(offsets[2]);
  object.priceRange = reader.readStringOrNull(offsets[3]);
  object.type = reader.readStringOrNull(offsets[4]);
  return object;
}

P _accommodationDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _accommodationGetId(Accommodation object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _accommodationGetLinks(Accommodation object) {
  return [];
}

void _accommodationAttach(
    IsarCollection<dynamic> col, Id id, Accommodation object) {
  object.id = id;
}

extension AccommodationQueryWhereSort
    on QueryBuilder<Accommodation, Accommodation, QWhere> {
  QueryBuilder<Accommodation, Accommodation, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterWhere> anyDestinationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'destinationId'),
      );
    });
  }
}

extension AccommodationQueryWhere
    on QueryBuilder<Accommodation, Accommodation, QWhereClause> {
  QueryBuilder<Accommodation, Accommodation, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<Accommodation, Accommodation, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterWhereClause> idBetween(
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

  QueryBuilder<Accommodation, Accommodation, QAfterWhereClause>
      destinationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'destinationId',
        value: [null],
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterWhereClause>
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

  QueryBuilder<Accommodation, Accommodation, QAfterWhereClause>
      destinationIdEqualTo(int? destinationId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'destinationId',
        value: [destinationId],
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterWhereClause>
      destinationIdNotEqualTo(int? destinationId) {
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

  QueryBuilder<Accommodation, Accommodation, QAfterWhereClause>
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

  QueryBuilder<Accommodation, Accommodation, QAfterWhereClause>
      destinationIdLessThan(
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

  QueryBuilder<Accommodation, Accommodation, QAfterWhereClause>
      destinationIdBetween(
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

  QueryBuilder<Accommodation, Accommodation, QAfterWhereClause> typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'type',
        value: [null],
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterWhereClause>
      typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'type',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterWhereClause> typeEqualTo(
      String? type) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'type',
        value: [type],
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterWhereClause> typeNotEqualTo(
      String? type) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'type',
              lower: [],
              upper: [type],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'type',
              lower: [type],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'type',
              lower: [type],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'type',
              lower: [],
              upper: [type],
              includeUpper: false,
            ));
      }
    });
  }
}

extension AccommodationQueryFilter
    on QueryBuilder<Accommodation, Accommodation, QFilterCondition> {
  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      amenitiesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'amenities',
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      amenitiesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'amenities',
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      amenitiesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amenities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      amenitiesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amenities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      amenitiesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amenities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      amenitiesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amenities',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      amenitiesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'amenities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      amenitiesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'amenities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      amenitiesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'amenities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      amenitiesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'amenities',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      amenitiesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amenities',
        value: '',
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      amenitiesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'amenities',
        value: '',
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      amenitiesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'amenities',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      amenitiesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'amenities',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      amenitiesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'amenities',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      amenitiesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'amenities',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      amenitiesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'amenities',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      amenitiesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'amenities',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      destinationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'destinationId',
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      destinationIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'destinationId',
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      destinationIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destinationId',
        value: value,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
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

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
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

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
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

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      nameGreaterThan(
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

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      nameLessThan(
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

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      nameStartsWith(
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

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      nameEndsWith(
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

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      priceRangeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'priceRange',
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      priceRangeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'priceRange',
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      priceRangeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      priceRangeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priceRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      priceRangeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priceRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      priceRangeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priceRange',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      priceRangeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'priceRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      priceRangeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'priceRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      priceRangeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'priceRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      priceRangeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'priceRange',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      priceRangeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceRange',
        value: '',
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      priceRangeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'priceRange',
        value: '',
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition> typeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      typeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      typeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition> typeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension AccommodationQueryObject
    on QueryBuilder<Accommodation, Accommodation, QFilterCondition> {}

extension AccommodationQueryLinks
    on QueryBuilder<Accommodation, Accommodation, QFilterCondition> {}

extension AccommodationQuerySortBy
    on QueryBuilder<Accommodation, Accommodation, QSortBy> {
  QueryBuilder<Accommodation, Accommodation, QAfterSortBy>
      sortByDestinationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationId', Sort.asc);
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterSortBy>
      sortByDestinationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationId', Sort.desc);
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterSortBy> sortByPriceRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceRange', Sort.asc);
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterSortBy>
      sortByPriceRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceRange', Sort.desc);
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension AccommodationQuerySortThenBy
    on QueryBuilder<Accommodation, Accommodation, QSortThenBy> {
  QueryBuilder<Accommodation, Accommodation, QAfterSortBy>
      thenByDestinationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationId', Sort.asc);
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterSortBy>
      thenByDestinationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationId', Sort.desc);
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterSortBy> thenByPriceRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceRange', Sort.asc);
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterSortBy>
      thenByPriceRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceRange', Sort.desc);
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Accommodation, Accommodation, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension AccommodationQueryWhereDistinct
    on QueryBuilder<Accommodation, Accommodation, QDistinct> {
  QueryBuilder<Accommodation, Accommodation, QDistinct> distinctByAmenities() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amenities');
    });
  }

  QueryBuilder<Accommodation, Accommodation, QDistinct>
      distinctByDestinationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destinationId');
    });
  }

  QueryBuilder<Accommodation, Accommodation, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Accommodation, Accommodation, QDistinct> distinctByPriceRange(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priceRange', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Accommodation, Accommodation, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension AccommodationQueryProperty
    on QueryBuilder<Accommodation, Accommodation, QQueryProperty> {
  QueryBuilder<Accommodation, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Accommodation, List<String>?, QQueryOperations>
      amenitiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amenities');
    });
  }

  QueryBuilder<Accommodation, int?, QQueryOperations> destinationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destinationId');
    });
  }

  QueryBuilder<Accommodation, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Accommodation, String?, QQueryOperations> priceRangeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priceRange');
    });
  }

  QueryBuilder<Accommodation, String?, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
