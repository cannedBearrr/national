import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flip_card/flip_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'student_line_model.dart';
export 'student_line_model.dart';

class StudentLineWidget extends StatefulWidget {
  const StudentLineWidget({super.key});

  @override
  State<StudentLineWidget> createState() => _StudentLineWidgetState();
}

class _StudentLineWidgetState extends State<StudentLineWidget>
    with TickerProviderStateMixin {
  late StudentLineModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StudentLineModel());

    animationsMap.addAll({
      'buttonOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 550.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.0, 1.2),
          ),
        ],
      ),
      'buttonOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 550.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.0, 1.2),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        endDrawer: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.2,
          child: Drawer(
            elevation: 16.0,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(1.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 5.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (scaffoldKey.currentState!.isDrawerOpen ||
                            scaffoldKey.currentState!.isEndDrawerOpen) {
                          Navigator.pop(context);
                        }
                      },
                      child: Icon(
                        Icons.close_sharp,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 35.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300.0,
                  child: Divider(
                    height: 65.0,
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('studentLine');
                      },
                      child: Text(
                        'STUDENT',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Rubik',
                              color: const Color(0xFFEEB609),
                              fontSize: 31.0,
                              letterSpacing: 1.8,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('businessLine');
                      },
                      child: Text(
                        'BUSINESS',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Rubik',
                              color: const Color(0xB0000000),
                              fontSize: 31.0,
                              letterSpacing: 1.8,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('careerLine');
                      },
                      child: Text(
                        'CAREER',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Rubik',
                              color: const Color(0xB0000000),
                              fontSize: 31.0,
                              letterSpacing: 1.8,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                        tabletLandscape: false,
                      ))
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Visibility(
                            visible: responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                            ),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1713769931183-1537d9a8126b?q=80&w=4672&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              7.36,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          80.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.7,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.5,
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                'BY STUDENTS,\nFOR STUDENTS',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'NORD',
                                                          color: Colors.black,
                                                          fontSize: 60.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 1100.0,
                                              child: Divider(
                                                height: 65.0,
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                'We help students define their career paths through hands-on experiences and project-based learning, building practical skills, and immersive portfolios.',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Inria Serif',
                                                          fontSize: 30.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: MouseRegion(
                                                opaque: false,
                                                cursor: MouseCursor.defer ??
                                                    MouseCursor.defer,
                                                onEnter: ((event) async {
                                                  setState(() => _model
                                                          .mouseRegionHovered1 =
                                                      true);
                                                  if (animationsMap[
                                                          'buttonOnActionTriggerAnimation1'] !=
                                                      null) {
                                                    await animationsMap[
                                                            'buttonOnActionTriggerAnimation1']!
                                                        .controller
                                                        .forward(from: 0.0)
                                                        .whenComplete(animationsMap[
                                                                'buttonOnActionTriggerAnimation1']!
                                                            .controller
                                                            .reverse);
                                                  }
                                                }),
                                                onExit: ((event) async {
                                                  setState(() => _model
                                                          .mouseRegionHovered1 =
                                                      false);
                                                }),
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 20.0,
                                                                0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () {
                                                        print(
                                                            'Button pressed ...');
                                                      },
                                                      text: 'LEARN MORE',
                                                      options: FFButtonOptions(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.285,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.046,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            const Color(0xFFEEB609),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'NORD',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                        elevation: 5.0,
                                                        borderSide: const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        hoverTextColor:
                                                            Colors.black,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'buttonOnActionTriggerAnimation1']!,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (responsiveVisibility(
                                    context: context,
                                    tablet: false,
                                    tabletLandscape: false,
                                    desktop: false,
                                  ))
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(1.0, -1.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.35,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.05,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                          shape: BoxShape.rectangle,
                                        ),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'Business',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'NORD',
                                                  color: const Color(0xFFEEB609),
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Visibility(
                            visible: responsiveVisibility(
                              context: context,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1713769931183-1537d9a8126b?q=80&w=4672&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              7.36,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.84,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.6,
                                      decoration: const BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              'BY STUDENTS',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'NORD',
                                                        color: Colors.black,
                                                        fontSize: 35.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              'FOR STUDENTS',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'NORD',
                                                        color: Colors.black,
                                                        fontSize: 35.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 337.0,
                                            child: Divider(
                                              height: 65.0,
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              'We help students define their career paths through hands-on experiences and project-based learning, building practical skills, and immersive portfolios.',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Inria Serif',
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: MouseRegion(
                                              opaque: false,
                                              cursor: MouseCursor.defer ??
                                                  MouseCursor.defer,
                                              onEnter: ((event) async {
                                                setState(() =>
                                                    _model.mouseRegionHovered2 =
                                                        true);
                                                if (animationsMap[
                                                        'buttonOnActionTriggerAnimation2'] !=
                                                    null) {
                                                  await animationsMap[
                                                          'buttonOnActionTriggerAnimation2']!
                                                      .controller
                                                      .forward(from: 0.0)
                                                      .whenComplete(animationsMap[
                                                              'buttonOnActionTriggerAnimation2']!
                                                          .controller
                                                          .reverse);
                                                }
                                              }),
                                              onExit: ((event) async {
                                                setState(() =>
                                                    _model.mouseRegionHovered2 =
                                                        false);
                                              }),
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 1.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () {
                                                      print(
                                                          'Button pressed ...');
                                                    },
                                                    text: 'LEARN MORE',
                                                    options: FFButtonOptions(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.285,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.046,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: const Color(0xFFEEB609),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'NORD',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                      elevation: 5.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      hoverTextColor:
                                                          Colors.black,
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'buttonOnActionTriggerAnimation2']!,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                        tabletLandscape: false,
                      ))
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.1,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 0.1,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE7DCC6),
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'HOW YOU WILL LEARN',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'NORD',
                                          fontSize: 28.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlipCard(
                                    fill: Fill.fillBack,
                                    direction: FlipDirection.HORIZONTAL,
                                    speed: 400,
                                    front: SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.5,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.asset(
                                              'assets/images/2023NA_408.jpg',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'CAREER ORIENTED SKILLS',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'NORD',
                                                    color: const Color(0xFFEEB609),
                                                    fontSize: 48.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    back: SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.5,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      child: Stack(
                                        children: [
                                          ClipRect(
                                            child: ImageFiltered(
                                              imageFilter: ImageFilter.blur(
                                                sigmaX: 10.0,
                                                sigmaY: 10.0,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.asset(
                                                  'assets/images/2023NA_408.jpg',
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Empowering through Hands-On Discovery',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'NORD',
                                                        color:
                                                            const Color(0xFFEEB609),
                                                        fontSize: 28.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                const SizedBox(
                                                  width: 675.0,
                                                  child: Divider(
                                                    thickness: 3.0,
                                                    color: Color(0xCCFFFFFF),
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.83,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.24,
                                                  decoration: const BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(50.0, 0.0,
                                                                50.0, 0.0),
                                                    child: Text(
                                                      'Embark on a journey of empowerment through hands-on discovery with our project-based learning approach. Geared towards nurturing tomorrow\'s leaders, our methodology emphasizes critical thinking, problem-solving, and collaboration. By immersing students in real-world projects, we provide them with the practical skills and invaluable experience necessary to excel in both academia and their future careers.',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Inria Serif',
                                                            color: Colors.white,
                                                            fontSize: 24.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 675.0,
                                                  child: Divider(
                                                    thickness: 3.0,
                                                    color: Color(0xCCFFFFFF),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  FlipCard(
                                    fill: Fill.fillBack,
                                    direction: FlipDirection.HORIZONTAL,
                                    speed: 400,
                                    front: SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.5,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.asset(
                                              'assets/images/2023NA_039.webp',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              fit: BoxFit.cover,
                                              alignment: const Alignment(1.0, 0.0),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'PROJECT BASED LEARNING',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'NORD',
                                                    color: const Color(0xFFEEB609),
                                                    fontSize: 48.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    back: SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.5,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      child: Stack(
                                        children: [
                                          ClipRect(
                                            child: ImageFiltered(
                                              imageFilter: ImageFilter.blur(
                                                sigmaX: 10.0,
                                                sigmaY: 10.0,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.asset(
                                                  'assets/images/2023NA_039.webp',
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  fit: BoxFit.cover,
                                                  alignment:
                                                      const Alignment(1.0, 0.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Crafting Futures, One Skill at a Time',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'NORD',
                                                        color:
                                                            const Color(0xFFEEB609),
                                                        fontSize: 28.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                const SizedBox(
                                                  width: 675.0,
                                                  child: Divider(
                                                    thickness: 3.0,
                                                    color: Color(0xCCFFFFFF),
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.83,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.275,
                                                  decoration: const BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(50.0, 0.0,
                                                                50.0, 0.0),
                                                    child: Text(
                                                      'At Northern Horizon, we\'re dedicated to building futures, one skill at a time. Our comprehensive programs focus on developing a diverse range of career-oriented skills tailored to meet the dynamic demands of today\'s job market, empowering students to thrive in their chosen fields, equipping them with the tools they need to succeed and make a lasting impact in their professional endeavors. Join us in shaping the next generation of skilled professionals and crafting brighter futures together.',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Inria Serif',
                                                            color: Colors.white,
                                                            fontSize: 24.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 675.0,
                                                  child: Divider(
                                                    thickness: 3.0,
                                                    color: Color(0xCCFFFFFF),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 0.1,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE7DCC6),
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'HOW YOU WILL LEARN',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'NORD',
                                          fontSize: 28.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                              FlipCard(
                                fill: Fill.fillBack,
                                direction: FlipDirection.HORIZONTAL,
                                speed: 400,
                                front: SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.45,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/2023NA_408.jpg',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.45,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Text(
                                                'CAREER ORIENTED SKILLS',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'NORD',
                                                          color:
                                                              const Color(0xFFEEB609),
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                back: SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.45,
                                  child: Stack(
                                    children: [
                                      ClipRect(
                                        child: ImageFiltered(
                                          imageFilter: ImageFilter.blur(
                                            sigmaX: 10.0,
                                            sigmaY: 10.0,
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.asset(
                                              'assets/images/2023NA_408.jpg',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.45,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Empowering through Hands-On Discovery',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'NORD',
                                                        color:
                                                            const Color(0xFFEEB609),
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                            const SizedBox(
                                              width: 325.0,
                                              child: Divider(
                                                thickness: 1.0,
                                                color: Color(0xCCFFFFFF),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.83,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.19,
                                              decoration: const BoxDecoration(),
                                              child: Text(
                                                'Embark on a journey of empowerment through hands-on discovery with our project-based learning approach. Geared towards nurturing tomorrow\'s leaders, our methodology emphasizes critical thinking, problem-solving, and collaboration. By immersing students in real-world projects, we provide them with the practical skills and invaluable experience necessary to excel in both academia and their future careers.',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Inria Serif',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 325.0,
                                              child: Divider(
                                                thickness: 1.0,
                                                color: Color(0xCCFFFFFF),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              FlipCard(
                                fill: Fill.fillBack,
                                direction: FlipDirection.HORIZONTAL,
                                speed: 400,
                                front: SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.45,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/2023NA_039.webp',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.45,
                                          fit: BoxFit.cover,
                                          alignment: const Alignment(1.0, 0.0),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'PROJECT BASED LEARNING',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'NORD',
                                                color: const Color(0xFFEEB609),
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                back: SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.45,
                                  child: Stack(
                                    children: [
                                      ClipRect(
                                        child: ImageFiltered(
                                          imageFilter: ImageFilter.blur(
                                            sigmaX: 10.0,
                                            sigmaY: 10.0,
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.asset(
                                              'assets/images/2023NA_039.webp',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.45,
                                              fit: BoxFit.cover,
                                              alignment: const Alignment(1.0, 0.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Crafting Futures, One Skill at a Time',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'NORD',
                                                        color:
                                                            const Color(0xFFEEB609),
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                            const SizedBox(
                                              width: 325.0,
                                              child: Divider(
                                                thickness: 1.0,
                                                color: Color(0xCCFFFFFF),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.83,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.22,
                                              decoration: const BoxDecoration(),
                                              child: Text(
                                                'At Northern Horizon, we\'re dedicated to building futures, one skill at a time. Our comprehensive programs focus on developing a diverse range of career-oriented skills tailored to meet the dynamic demands of today\'s job market, empowering students to thrive in their chosen fields, equipping them with the tools they need to succeed and make a lasting impact in their professional endeavors. Join us in shaping the next generation of skilled professionals and crafting brighter futures together.',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Inria Serif',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 325.0,
                                              child: Divider(
                                                thickness: 1.0,
                                                color: Color(0xCCFFFFFF),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.8,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.2,
                                    child: Stack(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.asset(
                                            'assets/images/Trophie.jpg',
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            fit: BoxFit.cover,
                                            alignment: const Alignment(0.0, 0.0),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'REWARD',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'NORD',
                                                        color: Colors.white,
                                                        fontSize: 30.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () {
                                                    print('Button pressed ...');
                                                  },
                                                  text: 'VIEW',
                                                  options: FFButtonOptions(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.212,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.03,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: const Color(0xFFEEB609),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'NORD',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          useGoogleFonts: false,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                    hoverTextColor:
                                                        Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.2,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/20221021_NA_085.webp',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'NETWORKING',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'NORD',
                                                        color: Colors.white,
                                                        fontSize: 30.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () {
                                                  print('Button pressed ...');
                                                },
                                                text: 'VIEW',
                                                options: FFButtonOptions(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.212,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.03,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: const Color(0xFFEEB609),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'NORD',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        useGoogleFonts: false,
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                  hoverTextColor: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.2,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/2023NA_034.webp',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'PROFESSIONAL SKILLS',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'NORD',
                                                        color: Colors.white,
                                                        fontSize: 30.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () {
                                                  print('Button pressed ...');
                                                },
                                                text: 'VIEW',
                                                options: FFButtonOptions(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.212,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.03,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: const Color(0xFFEEB609),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'NORD',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        useGoogleFonts: false,
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                  hoverTextColor: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.2,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/2023NA_040.webp',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'BUILD PORTFOLIO',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'NORD',
                                                        color: Colors.white,
                                                        fontSize: 30.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () {
                                                  print('Button pressed ...');
                                                },
                                                text: 'VIEW',
                                                options: FFButtonOptions(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.212,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.03,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: const Color(0xFFEEB609),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'NORD',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        useGoogleFonts: false,
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                  hoverTextColor: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                        tabletLandscape: false,
                      ))
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.4,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.8,
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFF5F5F5),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, -1.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 40.0),
                                                child: PageView(
                                                  controller: _model
                                                          .pageViewController1 ??=
                                                      PageController(
                                                          initialPage: 0),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.1,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.1,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Image.asset(
                                                              'assets/images/Anson.webp',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'ANSON ZHAO',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'NORD',
                                                                            fontSize:
                                                                                36.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child: Text(
                                                                      '/Director',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'NORD',
                                                                            fontSize:
                                                                                36.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w100,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          50.0,
                                                                          0.0,
                                                                          50.0,
                                                                          0.0),
                                                              child: Text(
                                                                '\"Opting for Northern Horizon is the ideal decision for you children \nif you seek a direct and shortest path to successful careers.',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inria Serif',
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      30.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.1,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.1,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Image.asset(
                                                              'assets/images/richard-image.jpeg',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Richard Cui',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'NORD',
                                                                            fontSize:
                                                                                36.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child: Text(
                                                                      '/Undergraduate, Computer Science',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'NORD',
                                                                            fontSize:
                                                                                36.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w100,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          50.0,
                                                                          0.0,
                                                                          50.0,
                                                                          0.0),
                                                              child: Text(
                                                                '\"Northern Horizon gave me a valuable opportunity to explore different facets of web development\n and helped develop my problem solving and presentation skills.\nI think it\'d be nice to have more \ninvolvement from the mentors but I know they\'re busy. \nHonestly, I think it\'s the only reason I have a software engineering internship this summer.\"',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inria Serif',
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      30.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.1,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.1,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Image.asset(
                                                              'assets/images/giang-picture.jpeg',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'GIANG NGUYEN',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'NORD',
                                                                            fontSize:
                                                                                36.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child: Text(
                                                                      '/Undergraduate, Biomedical Sciences',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'NORD',
                                                                            fontSize:
                                                                                36.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w100,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          50.0,
                                                                          0.0,
                                                                          50.0,
                                                                          0.0),
                                                              child: Text(
                                                                '\"I have learned to solve problems more efficiently on my own.\nWith an experienced teacher and other friends, I have enjoyed working on Northern Horizon\'s projects with my peers!\"',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inria Serif',
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      30.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.1,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.1,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Image.asset(
                                                              'assets/images/minh-picture.jpg',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'minh pham',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'NORD',
                                                                            fontSize:
                                                                                36.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child: Text(
                                                                      '/Undergraduate, Data Science',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'NORD',
                                                                            fontSize:
                                                                                36.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w100,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          50.0,
                                                                          0.0,
                                                                          50.0,
                                                                          0.0),
                                                              child: Text(
                                                                '\"My time at Northern Horizon has been awesome. Northern Horizon has provided me with great opportunities \nto work on my passion which is programming that I otherwise would not have had the \ndiscipline to do. Ultimately, the program has helped me polish my resume with experiences and projects, \nas well as deciding my major and future career in the foreseeable future.\"',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inria Serif',
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      30.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.1,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.1,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Image.asset(
                                                              'assets/images/james-picture.jpg',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'JAMES ZHANG',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'NORD',
                                                                            fontSize:
                                                                                36.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child: Text(
                                                                      '/Senior Programmer at NH',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'NORD',
                                                                            fontSize:
                                                                                36.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w100,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          50.0,
                                                                          0.0,
                                                                          50.0,
                                                                          0.0),
                                                              child: Text(
                                                                '\"Thank you, Northern Horizon,for providing me with an intuitive course \nintroducing popular programming languages and giving me the opportunities \nto be involved in real-time projects which has prepared me for college and my future \ncareers. Here is a big Thank-You!\"',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inria Serif',
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 30.0),
                                                  child: smooth_page_indicator
                                                      .SmoothPageIndicator(
                                                    controller: _model
                                                            .pageViewController1 ??=
                                                        PageController(
                                                            initialPage: 0),
                                                    count: 5,
                                                    axisDirection:
                                                        Axis.horizontal,
                                                    onDotClicked: (i) async {
                                                      await _model
                                                          .pageViewController1!
                                                          .animateToPage(
                                                        i,
                                                        duration: const Duration(
                                                            milliseconds: 500),
                                                        curve: Curves.ease,
                                                      );
                                                      setState(() {});
                                                    },
                                                    effect: const smooth_page_indicator
                                                        .ExpandingDotsEffect(
                                                      expansionFactor: 1.1,
                                                      spacing: 8.0,
                                                      radius: 15.0,
                                                      dotWidth: 15.0,
                                                      dotHeight: 15.0,
                                                      dotColor:
                                                          Color(0x7FE0E3E7),
                                                      activeDotColor:
                                                          Color(0xFFEEB609),
                                                      paintStyle:
                                                          PaintingStyle.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.5,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.8,
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFF5F5F5),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, -1.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 40.0),
                                                child: PageView(
                                                  controller: _model
                                                          .pageViewController2 ??=
                                                      PageController(
                                                          initialPage: 0),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.3,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.3,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Image.asset(
                                                              'assets/images/Anson.webp',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'ANSON ZHAO',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Text(
                                                            'Director of Northern Horizon',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      50.0,
                                                                      0.0,
                                                                      50.0,
                                                                      0.0),
                                                          child: Text(
                                                            '\"Opting for Northern Horizon is the ideal decision for you children if you seek a direct and shortest path to successful careers.',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.3,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.3,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Image.asset(
                                                              'assets/images/richard-image.jpeg',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'RICHARD CUI',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Text(
                                                            'Undergraduate, Computer Science',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      50.0,
                                                                      0.0,
                                                                      50.0,
                                                                      0.0),
                                                          child: Text(
                                                            '\"Northern Horizon gave me a valuable opportunity to explore different facets of web development and helped develop my problem solving and presentation skills.\nI think it\'d be nice to have more involvement from the mentors but I know they\'re busy. Honestly, I think it\'s the only reason I have a software engineering internship this summer.\"',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.3,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.3,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Image.asset(
                                                              'assets/images/giang-picture.jpeg',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'GIANG NGUYEN',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Text(
                                                            'Undergraduate, Biomedical Sciences',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      50.0,
                                                                      0.0,
                                                                      50.0,
                                                                      0.0),
                                                          child: Text(
                                                            '\"I have learned to solve problems more efficiently on my own.\nWith an experienced teacher and other friends, I have enjoyed working on Northern Horizon\'s projects with my peers!\"',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.3,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.3,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Image.asset(
                                                              'assets/images/minh-picture.jpg',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'MINH PHAM',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Text(
                                                            'Undergraduate, Data Science',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      50.0,
                                                                      0.0,
                                                                      50.0,
                                                                      0.0),
                                                          child: Text(
                                                            '\"My time at Northern Horizon has been awesome. Northern Horizon has provided me with great opportunities to work on my passion which is programming that I otherwise would not have had the discipline to do. Ultimately, the program has helped me polish my resume with experiences and projects, as well as deciding my major and future career in the foreseeable future.\"',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.3,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.3,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Image.asset(
                                                              'assets/images/james-picture.jpg',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'ANSON ZHAO',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Text(
                                                            'Senior Programmer at NH',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      50.0,
                                                                      0.0,
                                                                      50.0,
                                                                      0.0),
                                                          child: Text(
                                                            '\"Thank you, Northern Horizon,for providing me with an intuitive course introducing popular programming languages and giving me the opportunities to be involved in real-time projects which has prepared me for college and my future careers. Here is a big Thank-You!\"',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 30.0),
                                                  child: smooth_page_indicator
                                                      .SmoothPageIndicator(
                                                    controller: _model
                                                            .pageViewController2 ??=
                                                        PageController(
                                                            initialPage: 0),
                                                    count: 5,
                                                    axisDirection:
                                                        Axis.horizontal,
                                                    onDotClicked: (i) async {
                                                      await _model
                                                          .pageViewController2!
                                                          .animateToPage(
                                                        i,
                                                        duration: const Duration(
                                                            milliseconds: 500),
                                                        curve: Curves.ease,
                                                      );
                                                      setState(() {});
                                                    },
                                                    effect: const smooth_page_indicator
                                                        .ExpandingDotsEffect(
                                                      expansionFactor: 1.1,
                                                      spacing: 8.0,
                                                      radius: 15.0,
                                                      dotWidth: 15.0,
                                                      dotHeight: 15.0,
                                                      dotColor:
                                                          Color(0x7FE0E3E7),
                                                      activeDotColor:
                                                          Color(0xFFEEB609),
                                                      paintStyle:
                                                          PaintingStyle.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                        tabletLandscape: false,
                      ))
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width:
                                MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height *
                                    0.333,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context)
                                          .width *
                                          1.0,
                                      height: MediaQuery.sizeOf(context)
                                          .height *
                                          0.333,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFEEB609),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              0.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(
                                                0.0, 0.0, 200.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  0.0),
                                              child: Image.asset(
                                                'images/7422495_nasa_space_shuttle_universe_explore_icon_1.png',
                                                width: MediaQuery.sizeOf(
                                                    context)
                                                    .width *
                                                    0.3,
                                                height: MediaQuery.sizeOf(
                                                    context)
                                                    .height *
                                                    1.0,
                                                fit: BoxFit.contain,
                                                alignment:
                                                const Alignment(0.0, 0.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'WHERE IT ALL BEGAN',
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'NORD',
                                                color: Colors.white,
                                                fontSize: 36.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                            ),
                                            Text(
                                              'In 2019, Northern Horizon embarked on a \ngroundbreaking journey by partnering with NASA. \nThis collaboration provided our students with unparalleled \nopportunities to work on cutting-edge space projects, \nsetting the foundation for our mission to bridge the gap \nbetween education and real-world applications.',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily:
                                                'Inria Serif',
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.w300,
                                              ),
                                            ),
                                            Text(
                                              '2019',
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily:
                                                'Inria Serif',
                                                color: Colors.white,
                                                fontSize: 96.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width:
                                MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height *
                                    0.333,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context)
                                          .width *
                                          1.0,
                                      height: MediaQuery.sizeOf(context)
                                          .height *
                                          0.333,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFE7DDC6),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'THE GREAT LEAP FORWARD',
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'NORD',
                                                color: Colors.white,
                                                fontSize: 36.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                            ),
                                            Text(
                                              'In 2020, we took a significant step forward by \npartnering with the United Nations. This collaboration \nenabled our students to engage in global initiatives, enhancing \ntheir skills and perspectives while preparing them for \nimpactful careers on the international stage.',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily:
                                                'Inria Serif',
                                                color: Colors.white,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.w300,
                                              ),
                                            ),
                                            Text(
                                              '2020',
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily:
                                                'Inria Serif',
                                                color: Colors.white,
                                                fontSize: 96.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              0.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(
                                                200.0, 0.0, 0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  8.0),
                                              child: Image.asset(
                                                'images/Mask_group.png',
                                                width: MediaQuery.sizeOf(
                                                    context)
                                                    .width *
                                                    0.3,
                                                height: MediaQuery.sizeOf(
                                                    context)
                                                    .height *
                                                    1.0,
                                                fit: BoxFit.contain,
                                                alignment:
                                                const Alignment(0.0, 0.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width:
                                MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height *
                                    0.333,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context)
                                          .width *
                                          1.0,
                                      height: MediaQuery.sizeOf(context)
                                          .height *
                                          0.333,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFD9D9D9),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              0.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(
                                                0.0, 0.0, 200.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  8.0),
                                              child: Image.asset(
                                                'images/USGS.png',
                                                width: MediaQuery.sizeOf(
                                                    context)
                                                    .width *
                                                    0.3,
                                                height: MediaQuery.sizeOf(
                                                    context)
                                                    .height *
                                                    1.0,
                                                fit: BoxFit.contain,
                                                alignment:
                                                const Alignment(0.0, 0.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'OUR LATEST PARTNER',
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'NORD',
                                                color: Colors.white,
                                                fontSize: 36.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                            ),
                                            Text(
                                              'In 2021, we formed a partnership with the USGS, \nfurther broadening the scope of hands-on experiences available to \nour students. This collaboration allows our students to work on real-world \nenvironmental and scientific projects, developing critical skills and \ngaining valuable insights into the field of science and technology.',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily:
                                                'Inria Serif',
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.w300,
                                              ),
                                            ),
                                            Text(
                                              '2021',
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily:
                                                'Inria Serif',
                                                color: Colors.white,
                                                fontSize: 96.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.9,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Stack(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    width:
                                    MediaQuery.sizeOf(context).width *
                                        1.0,
                                    height:
                                    MediaQuery.sizeOf(context).height *
                                        0.3,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: MediaQuery.sizeOf(context)
                                              .width *
                                              1.0,
                                          height: MediaQuery.sizeOf(context)
                                              .height *
                                              0.333,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFEEB609),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              0.0, 0.0),
                                          child: Container(
                                            width:
                                            MediaQuery.sizeOf(context)
                                                .width *
                                                0.9,
                                            height:
                                            MediaQuery.sizeOf(context)
                                                .height *
                                                0.255,
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisSize:
                                              MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                              children: [
                                                Align(
                                                  alignment:
                                                  const AlignmentDirectional(
                                                      1.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(8.0),
                                                    child: Image.asset(
                                                      'images/7422495_nasa_space_shuttle_universe_explore_icon_1.png',
                                                      width:
                                                      MediaQuery.sizeOf(
                                                          context)
                                                          .width *
                                                          0.45,
                                                      height:
                                                      MediaQuery.sizeOf(
                                                          context)
                                                          .height *
                                                          0.1,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'WHERE IT ALL BEGAN',
                                                  textAlign:
                                                  TextAlign.start,
                                                  style: FlutterFlowTheme
                                                      .of(context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily: 'NORD',
                                                    color: FlutterFlowTheme
                                                        .of(context)
                                                        .secondaryBackground,
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts:
                                                    false,
                                                  ),
                                                ),
                                                Text(
                                                  'In 2019, Northern Horizon embarked on a \ngroundbreaking journey by partnering with NASA. \nThis collaboration provided our students with unparalleled \nopportunities to work on cutting-edge space projects, \nsetting the foundation for our mission to bridge the gap \nbetween education and real-world applications.',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily:
                                                    'Inria Serif',
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                    FontWeight.w300,
                                                  ),
                                                ),
                                                Text(
                                                  '2019',
                                                  style: FlutterFlowTheme
                                                      .of(context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily:
                                                    'Inria Serif',
                                                    color: Colors.white,
                                                    fontSize: 50.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                    MediaQuery.sizeOf(context).width *
                                        1.0,
                                    height:
                                    MediaQuery.sizeOf(context).height *
                                        0.3,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: MediaQuery.sizeOf(context)
                                              .width *
                                              1.0,
                                          height: MediaQuery.sizeOf(context)
                                              .height *
                                              0.333,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFE7DDC6),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              0.0, 0.0),
                                          child: Container(
                                            width:
                                            MediaQuery.sizeOf(context)
                                                .width *
                                                0.9,
                                            height:
                                            MediaQuery.sizeOf(context)
                                                .height *
                                                0.255,
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisSize:
                                              MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                              children: [
                                                Align(
                                                  alignment:
                                                  const AlignmentDirectional(
                                                      1.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(8.0),
                                                    child: Image.asset(
                                                      'images/Mask_group.png',
                                                      width:
                                                      MediaQuery.sizeOf(
                                                          context)
                                                          .width *
                                                          0.45,
                                                      height:
                                                      MediaQuery.sizeOf(
                                                          context)
                                                          .height *
                                                          0.1,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'THE GREAT LEAP FORWARD',
                                                  textAlign:
                                                  TextAlign.start,
                                                  style: FlutterFlowTheme
                                                      .of(context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily: 'NORD',
                                                    color: FlutterFlowTheme
                                                        .of(context)
                                                        .secondaryBackground,
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts:
                                                    false,
                                                  ),
                                                ),
                                                Text(
                                                  'In 2020, we took a significant step forward by \npartnering with the United Nations. This collaboration \nenabled our students to engage in global initiatives, enhancing \ntheir skills and perspectives while preparing them for \nimpactful careers on the international stage.',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily:
                                                    'Inria Serif',
                                                    color: Colors.white,
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                    FontWeight.w300,
                                                  ),
                                                ),
                                                Text(
                                                  '2020',
                                                  style: FlutterFlowTheme
                                                      .of(context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily:
                                                    'Inria Serif',
                                                    color: Colors.white,
                                                    fontSize: 45.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                    MediaQuery.sizeOf(context).width *
                                        1.0,
                                    height:
                                    MediaQuery.sizeOf(context).height *
                                        0.3,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: MediaQuery.sizeOf(context)
                                              .width *
                                              1.0,
                                          height: MediaQuery.sizeOf(context)
                                              .height *
                                              0.333,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFD9D9D9),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              0.0, 0.0),
                                          child: Container(
                                            width:
                                            MediaQuery.sizeOf(context)
                                                .width *
                                                0.9,
                                            height:
                                            MediaQuery.sizeOf(context)
                                                .height *
                                                0.255,
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisSize:
                                              MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                              children: [
                                                Align(
                                                  alignment:
                                                  const AlignmentDirectional(
                                                      1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0,
                                                        0.0,
                                                        0.0,
                                                        10.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          8.0),
                                                      child: Image.asset(
                                                        'images/USGS.png',
                                                        width: MediaQuery
                                                            .sizeOf(
                                                            context)
                                                            .width *
                                                            0.328,
                                                        height: MediaQuery
                                                            .sizeOf(
                                                            context)
                                                            .height *
                                                            0.1,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'Our Latest Partner',
                                                  textAlign:
                                                  TextAlign.start,
                                                  style: FlutterFlowTheme
                                                      .of(context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily: 'NORD',
                                                    color: FlutterFlowTheme
                                                        .of(context)
                                                        .secondaryBackground,
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts:
                                                    false,
                                                  ),
                                                ),
                                                Text(
                                                  'In 2021, we formed a partnership with the USGS, \nfurther broadening the scope of hands-on experiences available to \nour students. This collaboration allows our students to work on real-world \nenvironmental and scientific projects, developing critical skills and \ngaining valuable insights into the field of science and technology.',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily:
                                                    'Inria Serif',
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                    FontWeight.w300,
                                                  ),
                                                ),
                                                Text(
                                                  '2021',
                                                  style: FlutterFlowTheme
                                                      .of(context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily:
                                                    'Inria Serif',
                                                    color: Colors.white,
                                                    fontSize: 50.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                        tabletLandscape: false,
                      ))
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.22,
                          decoration: const BoxDecoration(
                            color: Color(0xFFE7DCC6),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('homePage');
                                  },
                                  child: Text(
                                    'NORTHERN HORIZON',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'NORD',
                                          color: const Color(0xFFEEB609),
                                          fontSize: 40.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 50.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('legalPage');
                                      },
                                      child: Text(
                                        'LEGAL',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'NORD',
                                              color: const Color(0xFFEEB609),
                                              fontSize: 36.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      'PRIVACY POLICY',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inria Serif',
                                            color: Colors.black,
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'Terms and Conditions',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inria Serif',
                                          color: Colors.black,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 50.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('contactUs');
                                      },
                                      child: Text(
                                        'CONTACT US',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'NORD',
                                              color: const Color(0xFFEEB609),
                                              fontSize: 36.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      '(845)-281-9257',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inria Serif',
                                            color: Colors.black,
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'azhao@northernacademy.org',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inria Serif',
                                          color: Colors.black,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    '1 Ashley Ave Middletown, NY',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inria Serif',
                                          color: Colors.black,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.14,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                decoration: const BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 0.0,
                                      borderWidth: 1.0,
                                      buttonSize:
                                          MediaQuery.sizeOf(context).width *
                                              0.035,
                                      fillColor: const Color(0x004B39EF),
                                      icon: FaIcon(
                                        FontAwesomeIcons.facebook,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 40.0,
                                      ),
                                      onPressed: () async {
                                        await launchURL(
                                            'https://www.facebook.com/nh122223/');
                                      },
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 0.0,
                                      borderWidth: 1.0,
                                      buttonSize:
                                          MediaQuery.sizeOf(context).width *
                                              0.035,
                                      fillColor: const Color(0x004B39EF),
                                      icon: FaIcon(
                                        FontAwesomeIcons.instagram,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 40.0,
                                      ),
                                      onPressed: () async {
                                        await launchURL(
                                            'https://www.instagram.com/northernhorizonn/');
                                      },
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 0.0,
                                      borderWidth: 1.0,
                                      buttonSize:
                                          MediaQuery.sizeOf(context).width *
                                              0.035,
                                      fillColor: const Color(0x004B39EF),
                                      icon: FaIcon(
                                        FontAwesomeIcons.youtube,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 40.0,
                                      ),
                                      onPressed: () async {
                                        await launchURL(
                                            'https://www.youtube.com/@ansonz6701/featured');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.15,
                          decoration: const BoxDecoration(
                            color: Color(0xFFE7DCC6),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('homePage');
                                  },
                                  child: Text(
                                    'NORTHERN HORIZON',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'NORD',
                                          color: const Color(0xFFEEB609),
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('legalPage');
                                    },
                                    child: Text(
                                      'LEGAL',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'NORD',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                    child: VerticalDivider(
                                      thickness: 1.0,
                                      color: Color(0xCC000000),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('contactUs');
                                    },
                                    child: Text(
                                      'CONTACT US',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 0.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor: const Color(0x004B39EF),
                                    icon: FaIcon(
                                      FontAwesomeIcons.facebook,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      await launchURL(
                                          'https://www.facebook.com/nh122223/');
                                    },
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 0.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor: const Color(0x004B39EF),
                                    icon: FaIcon(
                                      FontAwesomeIcons.instagram,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      await launchURL(
                                          'https://www.instagram.com/northernhorizonn/');
                                    },
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 0.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor: const Color(0x004B39EF),
                                    icon: FaIcon(
                                      FontAwesomeIcons.youtube,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      await launchURL(
                                          'https://www.youtube.com/@ansonz6701/featured');
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                ))
                  Align(
                    alignment: const AlignmentDirectional(1.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 25.0, 25.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed('GPTFlow');
                        },
                        text: 'Questions?',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.16,
                          height: MediaQuery.sizeOf(context).height * 0.06,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFFEEB609),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'NORD',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                          hoverTextColor: Colors.black,
                        ),
                      ),
                    ),
                  ),
                if (responsiveVisibility(
                  context: context,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  Align(
                    alignment: const AlignmentDirectional(1.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 25.0, 25.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed('GPTFlow');
                        },
                        text: 'Questions?',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          height: MediaQuery.sizeOf(context).height * 0.06,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFFEEB609),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'NORD',
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                          hoverTextColor: Colors.black,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
              tabletLandscape: false,
            ))
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.1,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(1.0, 0.0),
                            child: Text(
                              'Student',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'NORD',
                                    color: const Color(0xFFEEB609),
                                    fontSize: 36.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SvgPicture.network(
                            'https://northernhorizon.org/public/assets/logo-blue.svg',
                            width: MediaQuery.sizeOf(context).width * 0.3,
                            height: MediaQuery.sizeOf(context).height * 0.08,
                            fit: BoxFit.contain,
                            alignment: const Alignment(0.0, 0.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (responsiveVisibility(
              context: context,
              tablet: false,
              tabletLandscape: false,
              desktop: false,
            ))
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.1,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              40.0, 0.0, 0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: SvgPicture.network(
                              'https://northernhorizon.org/public/assets/logo-blue.svg',
                              width: MediaQuery.sizeOf(context).width * 0.25,
                              height: MediaQuery.sizeOf(context).height * 0.08,
                              fit: BoxFit.contain,
                              alignment: const Alignment(0.0, 0.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                    top: 40.0,
                    right: 10.0,
                    child: IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: (){
                        scaffoldKey.currentState!.openEndDrawer();
                      }
                    )
                  )
          ],
        ),
      ),
    );
  }
}
