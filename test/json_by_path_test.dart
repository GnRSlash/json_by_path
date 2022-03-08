import 'package:json_by_path/json_by_path.dart';
import 'package:test/test.dart';

void main() {
  Map<String, dynamic> _json = {};
  Map<String, dynamic> _json2 = {};
  final JsonByPath jbp = JsonByPath();

  group('Testing json get/set methods', () {
    setUp(() {
      _json = {
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

      _json2 = {
        'key 1': 'value 1',
        'key 2': 'value 2',
        'key 3': {
          'key 3_1': {'key 3_1_1': 'value 3.1.1'}
        },
        'key 4': {
          'key 4.1': {'key 4.1.1': 'value 4.1.1'}
        },
        'key 5': 4,
        'key 6': 19
      };
    });

    test('get using . and returning map', () {
      expect(jbp.getValue(_json, 'key 3.key 3_1'),
          equals({'key 3_1_1': 'value 3.1.1'}));
    });

    test('get using . and returning string', () {
      expect(jbp.getValue(_json, 'key 3.key 3_1.key 3_1_1'),
          equals('value 3.1.1'));
    });

    test('get using . and returning int', () {
      expect(jbp.getValue(_json, 'key 5'), equals(4));
    });

    test('get using . and returning bool', () {
      expect(jbp.getValue(_json, 'key 6'), isTrue);
    });

    test('get using / and returning string', () {
      jbp.splitChar = '/';
      expect(jbp.getValue(_json, 'key 4/key 4.1/key 4.1.1'),
          equals('value 4.1.1'));
    });

    test('set using . and int value', () {
      jbp.splitChar = '.';
      expect(jbp.setValue(_json, 'key 6', 19), equals(_json2));
    });

    test('get with . an invalid key', () {
      expect(jbp.getValue(_json, 'key 7'), isNull);
    });

    test('creating two new keys', () {
      Map<String, dynamic> origin = Map<String, dynamic>.from(_json);
      expect(jbp.setValue(_json, 'key 6.key 6_1.key 6_1_1', 10), isNot(origin));
      expect(jbp.getValue(_json, 'key 6.key 6_1.key 6_1_1'), equals(10));
    });

    test('getting default value', () {
      expect(jbp.getValue(_json, 'key 99', <String>[]), equals(<String>[]));
    });
  });
}
