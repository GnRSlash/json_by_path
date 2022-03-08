# A way to get and set json Map values using key paths!

> NOTE: A valid Map<String, dynamic> can be obtained using json encode/decode functions. This package will not work properly if your Map variable was initialized using Map Literals

## Features

Now you can read and write your json files without converting them to a model mapped version. Just use the key path to go directly where you want and **get**, **set**, **delete** or **create** keys and values!

# Installing

Add `JsonByPath` to your pubspec.yaml file:

```yaml
dependencies:
  json_by_path:
```

Import `JsonByPath` in files that it will be used:

```dart
import 'package:json_by_path/json_by_path.dart';
```

## Getting started

Just create an instance of `JsonByPath` and start working:
```dart
    JsonByPath jbp = JsonByPath();
    String v = jbp.getValue(target, 'config.tcp.url');
    int i = jbp.getValue(target, 'config.tcp.port');
    jbp.setValue(target)
```

## Usage

```dart
import 'dart:convert';
// just to use as an example, this is Map Literals initialization
Map<String, dynamic> target = {
    'config': {
        'tcp': {
            'url': 'http://localhost',
            'port': 8083
        }
    }
};

// this package does not work with Map Literals
// convert your map to json string and to Map again
// (if this is the case)
target = json.decode(json.encode(target));

JsonByPath jbp = JsonByPath();

print(jbp.getValue(target, 'config.tcp.url'));
jbp.setValue(target, 'config.tcp.doLog', true);
print(target);

```

## Additional information

**Show some ❤️ and star the repo to support the project**

