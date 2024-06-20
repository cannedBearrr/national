import '/flutter_flow/flutter_flow_util.dart';
import 'project_form_widget.dart' show ProjectFormWidget;
import 'package:flutter/material.dart';

class ProjectFormModel extends FlutterFlowModel<ProjectFormWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
