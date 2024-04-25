import '/flutter_flow/flutter_flow_util.dart';
import 'periodcalender_widget.dart' show PeriodcalenderWidget;
import 'package:flutter/material.dart';

class PeriodcalenderModel extends FlutterFlowModel<PeriodcalenderWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
