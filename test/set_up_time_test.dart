import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:foyg/core/providers/time_provider.dart';

void main() {
  var timeProvider = TimeProvider();

  test("update counter - 1 from remaining time", () {
    var time = timeProvider.remainingTime;
    timeProvider.updateCounter();
    expect(timeProvider.remainingTime, time - 1);
  });

  test("check the img type (is changble)", () {
    var img = timeProvider.currentImageType;
    expect(img, 'focus_time1');
  });
}
