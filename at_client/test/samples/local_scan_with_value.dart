import 'package:at_client/at_client.dart';
import 'package:at_client/src/manager/at_client_manager.dart';
import 'package:at_commons/at_commons.dart';

import 'test_util.dart';

void main() async {
  try {
    final atSign = '@alice🛠';
    var atClientManager = await AtClientManager.getInstance()
        .setCurrentAtSign(atSign, 'wavi', TestUtil.getAlicePreference());
    final atClient = atClientManager.atClient;
    // Option 1. Get string keys and convert to AtKey
    var result = await atClient?.getKeys();
    if(result != null) {
      for (var key in result) {
        var atKey = AtKey.fromString(key);
        var value = await atClient?.get(atKey);
        print('$key --> ${value?.value}');
      }
    }

    // Option 2. Get AtKeys
    var atKeys = await atClient?.getAtKeys();
    if(atKeys != null) {
      for (var key in atKeys) {
        var value = await atClient?.get(key);
        print('$key --> ${value?.value}');
      }
    }
  } on Exception catch (e, trace) {
    print(e.toString());
    print(trace);
  }
}

void process() {}
