// ignore_for_file: directives_ordering
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:build_runner_core/build_runner_core.dart' as _i1;
import 'package:source_gen/builder.dart' as _i2;
import 'package:auto_route_generator/builder.dart' as _i3;
import 'package:flutter_gen_runner/flutter_gen_runner.dart' as _i4;
import 'dart:isolate' as _i5;
import 'package:build_runner/build_runner.dart' as _i6;
import 'dart:io' as _i7;

final _builders = <_i1.BuilderApplication>[
  _i1.apply(r'source_gen:combining_builder', [_i2.combiningBuilder],
      _i1.toNoneByDefault(),
      hideOutput: false, appliesBuilders: const [r'source_gen:part_cleanup']),
  _i1.apply(r'auto_route_generator:autoRouteGenerator',
      [_i3.autoRouteGenerator], _i1.toDependentsOf(r'auto_route_generator'),
      hideOutput: false),
  _i1.apply(r'flutter_gen_runner:flutter_gen_runner', [_i4.build],
      _i1.toDependentsOf(r'flutter_gen_runner'),
      hideOutput: false),
  _i1.applyPostProcess(r'source_gen:part_cleanup', _i2.partCleanup)
];
void main(List<String> args, [_i5.SendPort? sendPort]) async {
  var result = await _i6.run(args, _builders);
  sendPort?.send(result);
  _i7.exitCode = result;
}
