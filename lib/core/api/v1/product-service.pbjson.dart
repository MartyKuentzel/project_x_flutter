///
//  Generated code. Do not modify.
//  source: product-service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const ProductProto$json = const {
  '1': 'ProductProto',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'price', '3': 3, '4': 1, '5': 9, '10': 'price'},
    const {'1': 'creator', '3': 4, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'unit', '3': 5, '4': 1, '5': 9, '10': 'unit'},
    const {'1': 'description', '3': 6, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'category', '3': 7, '4': 1, '5': 9, '10': 'category'},
    const {'1': 'date', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'date'},
  ],
};

const CreateRequest$json = const {
  '1': 'CreateRequest',
  '2': const [
    const {'1': 'api', '3': 1, '4': 1, '5': 9, '10': 'api'},
    const {'1': 'product', '3': 2, '4': 1, '5': 11, '6': '.v1.ProductProto', '10': 'product'},
  ],
};

const CreateResponse$json = const {
  '1': 'CreateResponse',
  '2': const [
    const {'1': 'api', '3': 1, '4': 1, '5': 9, '10': 'api'},
    const {'1': 'id', '3': 2, '4': 1, '5': 3, '10': 'id'},
  ],
};

const ReadRequest$json = const {
  '1': 'ReadRequest',
  '2': const [
    const {'1': 'api', '3': 1, '4': 1, '5': 9, '10': 'api'},
    const {'1': 'id', '3': 2, '4': 1, '5': 3, '10': 'id'},
  ],
};

const ReadResponse$json = const {
  '1': 'ReadResponse',
  '2': const [
    const {'1': 'api', '3': 1, '4': 1, '5': 9, '10': 'api'},
    const {'1': 'product', '3': 2, '4': 1, '5': 11, '6': '.v1.ProductProto', '10': 'product'},
  ],
};

const UpdateRequest$json = const {
  '1': 'UpdateRequest',
  '2': const [
    const {'1': 'api', '3': 1, '4': 1, '5': 9, '10': 'api'},
    const {'1': 'product', '3': 2, '4': 1, '5': 11, '6': '.v1.ProductProto', '10': 'product'},
  ],
};

const UpdateResponse$json = const {
  '1': 'UpdateResponse',
  '2': const [
    const {'1': 'api', '3': 1, '4': 1, '5': 9, '10': 'api'},
    const {'1': 'updated', '3': 2, '4': 1, '5': 3, '10': 'updated'},
  ],
};

const DeleteRequest$json = const {
  '1': 'DeleteRequest',
  '2': const [
    const {'1': 'api', '3': 1, '4': 1, '5': 9, '10': 'api'},
    const {'1': 'id', '3': 2, '4': 1, '5': 3, '10': 'id'},
  ],
};

const DeleteResponse$json = const {
  '1': 'DeleteResponse',
  '2': const [
    const {'1': 'api', '3': 1, '4': 1, '5': 9, '10': 'api'},
    const {'1': 'deleted', '3': 2, '4': 1, '5': 3, '10': 'deleted'},
  ],
};

const ReadAllRequest$json = const {
  '1': 'ReadAllRequest',
  '2': const [
    const {'1': 'api', '3': 1, '4': 1, '5': 9, '10': 'api'},
  ],
};

const ReadAllResponse$json = const {
  '1': 'ReadAllResponse',
  '2': const [
    const {'1': 'api', '3': 1, '4': 1, '5': 9, '10': 'api'},
    const {'1': 'products', '3': 2, '4': 3, '5': 11, '6': '.v1.ProductProto', '10': 'products'},
  ],
};

