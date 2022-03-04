import 'dart:convert';

import 'package:json_by_path/json_by_path.dart';

void main() {
  Map<String, dynamic> _json = {
    'key 1': 'value 1',
    'key 2': 'value 2',
    'key 3': {
      'key 3_1': {'key 3_1_1': 'value 3.1.1'}
    },
    'key 4': {
      'key 4.1': {'key 4.1.1': 'value 4.1.1'}
    },
    'key 5': 4,
    'key 6': true
  };

  JsonByPath jbp = JsonByPath();
  print(_json.runtimeType);
  _json = json.decode(json.encode(_json));
  print(_json.runtimeType);

  print(jbp.getValue(_json, 'key 3.key 3_1'));
  jbp.setValue(_json, 'key 3.key 3_1.key 3_1_1', 4);
  jbp.setValue(_json, 'key 3.key 3_1.key 3_1_2.key 3_1_2_a', 4);
  print(jbp.getValue(_json, 'key 3.key 3_1'));
}
