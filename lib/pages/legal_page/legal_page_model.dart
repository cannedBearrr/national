import '/flutter_flow/flutter_flow_util.dart';
import 'legal_page_widget.dart' show LegalPageWidget;
import 'package:flutter/material.dart';

class LegalPageModel extends FlutterFlowModel<LegalPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
