import '/flutter_flow/flutter_flow_util.dart';
import 'application_form_widget.dart' show ApplicationFormWidget;
import 'package:flutter/material.dart';

class ApplicationFormModel extends FlutterFlowModel<ApplicationFormWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
