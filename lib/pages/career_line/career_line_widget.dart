import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'career_line_model.dart';
import 'package:http/http.dart' as http;

export 'career_line_model.dart';

String? job = '';

Future<http.Response> sendEmail(String email, String? job) {
  return http.post(
    Uri.parse('https://129.213.117.186/email.php'),
    headers: <String, String>{'Access-Control-Allow-Origin': "*", 'Content-Type': 'application/json'},
    body: jsonEncode(<String, String?>{
      'email': email,
      'job': job,
    }),
  );
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.moveTo(60, height * 0.8);
    path.lineTo(60, height - 24);
    path.arcToPoint(Offset(60 + 24, height), radius: const Radius.circular(24), clockwise: false);
    path.lineTo(width - 60 - 24, height);
    path.arcToPoint(Offset(width - 60, height - 24), radius: const Radius.circular(24), clockwise: false);
    path.lineTo(width - 60, height * 0.8);
    path.conicTo(width - 60, 60, width, 0, 1);
    path.lineTo(0, 0);
    path.conicTo(60, 60, 60, height * 0.8, 1);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class EmailDialog extends StatefulWidget {
  const EmailDialog({super.key});

  @override
  State<StatefulWidget> createState() => _EmailWidgetState();
}

class _EmailWidgetState extends State<EmailDialog> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  bool isEmailSent = false;

  String? _validateEmail(String value) {
    if (value.isEmpty && !isEmailSent) {
      return 'Enter an email';
    } else if (!isEmailValid(value) && !isEmailSent) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  bool isEmailValid(String email) {
    return RegExp(r'.+@.+').hasMatch(email);
  }

  Future<bool>? resetForm() {
    Future.delayed(const Duration(seconds: 10), () {
      _formKey.currentState?.reset();
      setState(() {
        isEmailSent = false;
      });
      job = '';
      Navigator.pop(context);
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: const EdgeInsetsDirectional.all(12.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 150),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 25),
            Text(
              'In order to apply, please verify your email',
              style: FlutterFlowTheme.of(context).bodyLarge,
            ),
            const SizedBox(height: 7),
            SizedBox(
              width: screenWidth * 0.8,
              child: Form(
                key: _formKey,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onFieldSubmitted: (value) async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        sendEmail(value, job);
                        isEmailSent = true;
                      });
                      _controller.clear();
                      await resetForm();
                    }
                  },
                  controller: _controller,
                  focusNode: _focusNode,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: isEmailSent ? 'Sent' : 'Submit mail for enrollment form',
                    labelStyle: FlutterFlowTheme.of(context).labelMedium,
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    errorStyle: FlutterFlowTheme.of(context).labelSmall.override(
                      color: const Color(0xffbd434a),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xffbd434a),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xffd60035),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          setState(() {
                            sendEmail(_controller.text, job);
                            isEmailSent = true;
                          });
                          _controller.clear();
                          await resetForm();
                        }
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                      ),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(

                    letterSpacing: 1.0,
                    lineHeight: 1.0,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.start,
                  validator: (value) {
                    return _validateEmail(value!);
                  },
                ),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              isEmailSent ? 'Nice! A confirmation email was sent to you and will expire in 30 minutes.' : '',
              style: FlutterFlowTheme.of(context).bodySmall.override(
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class CareerLineWidget extends StatefulWidget {
  const CareerLineWidget({super.key});

  @override
  State<CareerLineWidget> createState() => _CareerLineWidgetState();
}

class _CareerLineWidgetState extends State<CareerLineWidget>
    with TickerProviderStateMixin {
  late CareerLineModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CareerLineModel());

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


  List<bool> exp1 = [false, false, false, false];
  bool _exp1 = false;
  List<bool> exp2 = [false, false, false];
  bool _exp2 = false;
  List<bool> exp3 = [false, false, false, false];
  bool _exp3 = false;
  List<bool> exp4 = [false, false, false, false, false, false, false];
  bool _exp4 = false;


  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        endDrawer: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.85,
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
                              color: const Color(0xAB000000),
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
                              color: const Color(0xFFEEB609),
                              fontSize: 31.0,
                              letterSpacing: 1.8,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Stack(
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
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                7.36,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            80.0, 0.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.7,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
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
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  'We help students define their career paths through hands-on experiences and project-based learning, building practical skills, and immersive portfolios.',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                          .whenComplete(
                                                              animationsMap[
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
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () {
                                                          print(
                                                              'Button pressed ...');
                                                        },
                                                        text: 'LEARN MORE',
                                                        options:
                                                            FFButtonOptions(
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
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
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
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
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
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1713769931183-1537d9a8126b?q=80&w=4672&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: MediaQuery.sizeOf(context).height *
                                        7.36,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.84,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.6,
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
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'NORD',
                                                  color: Colors.black,
                                                  fontSize: 35.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w900,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            'FOR STUDENTS',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'NORD',
                                                  color: Colors.black,
                                                  fontSize: 35.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w900,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 337.0,
                                          child: Divider(
                                            height: 65.0,
                                            thickness: 1.0,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            'We help students define their career paths through hands-on experiences and project-based learning, building practical skills, and immersive portfolios.',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inria Serif',
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
                                              setState(() => _model
                                                  .mouseRegionHovered2 = true);
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
                                              setState(() => _model
                                                  .mouseRegionHovered2 = false);
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
                                                    print('Button pressed ...');
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
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
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
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                                    elevation: 5.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
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
                                    alignment: const AlignmentDirectional(0.0, -1.0),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'WORK LIFE',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'NORD',
                                              fontSize: 110.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w900,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 150.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      60.0, 0.0, 0.0, 0.0),
                                              child: SizedBox(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.3,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.7,
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  40.0),
                                                      child: PageView(
                                                        controller: _model
                                                                .pageViewController1 ??=
                                                            PageController(
                                                                initialPage: 0),
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  'https://images.unsplash.com/photo-1549692520-acc6669e2f0c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxTT0ZUV0FSRSUyMERFVkVMT1BFUnxlbnwwfHx8fDE3MTY1OTg2MzZ8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.5,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            20.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'SOFTWARE DEVELOPER',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'NORD',
                                                                        fontSize:
                                                                            25.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  'https://images.unsplash.com/photo-1581291518857-4e27b48ff24e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNHx8R1JBUEhJQyUyMERFU0lHTkVSfGVufDB8fHx8MTcxNjU5ODY1OHww&ixlib=rb-4.0.3&q=80&w=1080',
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.5,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            20.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'GRAPHIC DESIGNER',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'NORD',
                                                                        fontSize:
                                                                            25.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  'https://images.unsplash.com/photo-1557804506-669a67965ba0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxTQUxFUyUyME1BTkFHRVJ8ZW58MHx8fHwxNzE2NTk4Njc2fDA&ixlib=rb-4.0.3&q=80&w=1080',
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.5,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            20.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'SALES MANAGER',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'NORD',
                                                                        fontSize:
                                                                            25.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .network(
                                                                    'https://images.unsplash.com/photo-1534030347209-467a5b0ad3e6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxMnx8TUFSS0VUSU5HJTIwRElSRUNUT1J8ZW58MHx8fHwxNzE2NTk4Njk4fDA&ixlib=rb-4.0.3&q=80&w=1080',
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.5,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    alignment:
                                                                        const Alignment(
                                                                            0.0,
                                                                            -1.0),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            20.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'MARKETING DIRECTOR',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'NORD',
                                                                        fontSize:
                                                                            25.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: smooth_page_indicator
                                                            .SmoothPageIndicator(
                                                          controller: _model
                                                                  .pageViewController1 ??=
                                                              PageController(
                                                                  initialPage:
                                                                      0),
                                                          count: 4,
                                                          axisDirection:
                                                              Axis.vertical,
                                                          onDotClicked:
                                                              (i) async {
                                                            await _model
                                                                .pageViewController1!
                                                                .animateToPage(
                                                              i,
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      500),
                                                              curve:
                                                                  Curves.ease,
                                                            );
                                                            setState(() {});
                                                          },
                                                          effect: const smooth_page_indicator
                                                              .ExpandingDotsEffect(
                                                            expansionFactor:
                                                                1.1,
                                                            spacing: 8.0,
                                                            radius: 15.0,
                                                            dotWidth: 15.0,
                                                            dotHeight: 15.0,
                                                            dotColor: Color(
                                                                0x7FE0E3E7),
                                                            activeDotColor:
                                                                Color(
                                                                    0xFFEEB609),
                                                            paintStyle:
                                                                PaintingStyle
                                                                    .fill,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'WORKING ENVIRONMENT',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'NORD',
                                                          color:
                                                              const Color(0xFFEEB609),
                                                          fontSize: 25.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Nulla nec metus rutrum, iaculis massa et, \nbibendum mi. Vivamus efficitur hendrerit ligula \nnec vestibulum. Donec lobortis eget diam in \negestas. Nulla facilisis ligula et lobortis luctus. \nNulla luctus laoreet magna a consequat. \nPhasellus convallis interdum ultricies. Nam \nrhoncus lorem at venenatis elementum. \nCurabitur facilisis volutpat erat, sit amet \nultricies velit. Vestibulum finibus hendrerit \nlectus, quis pulvinar diam molestie ut. \nSuspendisse potenti.',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Inria Serif',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'INCENTIVES',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'NORD',
                                                        color:
                                                            const Color(0xFFEEB609),
                                                        fontSize: 25.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Nulla nec metus rutrum, iaculis massa et, \nbibendum mi. Vivamus efficitur hendrerit ligula \nnec vestibulum. Donec lobortis eget diam in \negestas. Nulla facilisis ligula et lobortis luctus. \nNulla luctus laoreet magna a consequat. \nPhasellus convallis interdum ultricies. ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Inria Serif',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'WORKING HOUR',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'NORD',
                                                        color:
                                                            const Color(0xFFEEB609),
                                                        fontSize: 25.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Vivamus efficitur hendrerit ligula nec vestibulum. \nDonec lobortis eget diam in egestas. Nulla facilisis \nligula et lobortis luctus. \n',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Inria Serif',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ],
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
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.2,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 23.0, 0.0, 23.0),
                                  child: Text(
                                    'WORK LIFE',
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'NORD',
                                          fontSize: 30.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.9,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.5,
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 40.0),
                                          child: PageView(
                                            controller: _model
                                                    .pageViewController2 ??=
                                                PageController(initialPage: 0),
                                            scrollDirection: Axis.horizontal,
                                            children: [
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.85,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.63,
                                                decoration: const BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.network(
                                                        'https://picsum.photos/seed/256/600',
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.847,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.364,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Software Developer',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'NORD',
                                                            color: Colors.black,
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.85,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.628,
                                                decoration: const BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.network(
                                                        'https://images.unsplash.com/photo-1510972527921-ce03766a1cf1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyMXx8Y29mZmVlfGVufDB8fHx8MTcxNTU0MTcxMHww&ixlib=rb-4.0.3&q=80&w=1080',
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.847,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.364,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Graphic Designer',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'NORD',
                                                            color: Colors.black,
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.85,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.628,
                                                decoration: const BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.network(
                                                        'https://images.unsplash.com/photo-1618890334461-c33a04c4c916?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxzdGFycnklMjBuaWdodHxlbnwwfHx8fDE3MTU1MzkyODd8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.847,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.364,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Sales Manager',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'NORD',
                                                            color: Colors.black,
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.85,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.628,
                                                decoration: const BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.network(
                                                        'https://images.unsplash.com/photo-1505322033502-1f4385692e6a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNHx8bGVnb3xlbnwwfHx8fDE3MTU2MTQ3NzV8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.847,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.364,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Marketing Director',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'NORD',
                                                            color: Colors.black,
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 100.0),
                                            child: smooth_page_indicator
                                                .SmoothPageIndicator(
                                              controller:
                                                  _model.pageViewController2 ??=
                                                      PageController(
                                                          initialPage: 0),
                                              count: 4,
                                              axisDirection: Axis.horizontal,
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
                                                dotColor: Color(0x7FE0E3E7),
                                                activeDotColor:
                                                    Color(0xFFEEB609),
                                                paintStyle: PaintingStyle.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        18.0, 0.0, 18.0, 0.0),
                                    child: Container(
                                      decoration: const BoxDecoration(),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 10.0),
                                                child: Text(
                                                  'WORKING ENVIRONMENT',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'NORD',
                                                        color:
                                                            const Color(0xFFEEB609),
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                'Nulla nec metus rutrum, iaculis massa et, bibendum\nmi. Vivamus efficitur hendrerit ligula nec vestibulum. \nDonec lobortis eget diam in egestas. Nulla facilis hendrerit lectus, quis pulvinar diam \nmolestie ut. Suspendisse potenti.\n',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Inria Serif',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 10.0),
                                                child: Text(
                                                  'incentives',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'NORD',
                                                        color:
                                                            const Color(0xFFEEB609),
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                'Nulla nec metus rutrum, iaculis massa et, bibendum\nmi. Vivamus efficitur hendrerit ligula nec vestibulum. \nDonec lobortis eget diam in egestas. Nulla facilisis ligula \n\nVestibulum finibus hendrerit lectus, quis pulvinar diam \nmolestie ut. Suspendisse potenti.\n',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Inria Serif',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
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
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 0.3,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.25,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      18.0, 0.0, 18.0, 0.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Text(
                                              'WORKING HOUR',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'NORD',
                                                    color: const Color(0xFFEEB609),
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w900,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            'Nulla nec metus rutrum, iaculis massa et, bibendum\nmi. Vivamus efficitur hendrerit ligula nec vestibulum. \nDonec lobortis eget diam in egestas. Nulla facilisis ligula \net lobortis luctus. Nulla luctus laoreet magna a \nconsequat. Phasellus convallis interdum ultricies. Nam \nrhoncus lorem at venenatis elementum. Curabitur \nfacilisis volutpat erat, sit amet ultricies velit. \nVestibulum finibus hendrerit lectus, quis pulvinar ',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inria Serif',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
                                      width: MediaQuery.sizeOf(context).width *
                                          0.8,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
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
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
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
                                                            .pageViewController3 ??=
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
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/Anson.webp',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'ANSON ZHAO',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'NORD',
                                                                              fontSize: 36.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
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
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                                      child:
                                                                          Text(
                                                                        '/Director',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'NORD',
                                                                              fontSize: 36.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w100,
                                                                              fontStyle: FontStyle.italic,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsetsDirectional
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
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/richard-image.jpeg',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'Richard Cui',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'NORD',
                                                                              fontSize: 36.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
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
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                                      child:
                                                                          Text(
                                                                        '/Undergraduate, Computer Science',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'NORD',
                                                                              fontSize: 36.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w100,
                                                                              fontStyle: FontStyle.italic,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsetsDirectional
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
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/giang-picture.jpeg',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'GIANG NGUYEN',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'NORD',
                                                                              fontSize: 36.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
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
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                                      child:
                                                                          Text(
                                                                        '/Undergraduate, Biomedical Sciences',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'NORD',
                                                                              fontSize: 36.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w100,
                                                                              fontStyle: FontStyle.italic,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsetsDirectional
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
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/minh-picture.jpg',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'minh pham',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'NORD',
                                                                              fontSize: 36.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
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
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                                      child:
                                                                          Text(
                                                                        '/Undergraduate, Data Science',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'NORD',
                                                                              fontSize: 36.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w100,
                                                                              fontStyle: FontStyle.italic,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsetsDirectional
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
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/james-picture.jpg',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'JAMES ZHANG',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'NORD',
                                                                              fontSize: 36.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
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
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                                      child:
                                                                          Text(
                                                                        '/Senior Programmer at NH',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'NORD',
                                                                              fontSize: 36.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w100,
                                                                              fontStyle: FontStyle.italic,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsetsDirectional
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
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 30.0),
                                                    child: smooth_page_indicator
                                                        .SmoothPageIndicator(
                                                      controller: _model
                                                              .pageViewController3 ??=
                                                          PageController(
                                                              initialPage: 0),
                                                      count: 5,
                                                      axisDirection:
                                                          Axis.horizontal,
                                                      onDotClicked: (i) async {
                                                        await _model
                                                            .pageViewController3!
                                                            .animateToPage(
                                                          i,
                                                          duration: const Duration(
                                                              milliseconds:
                                                                  500),
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
                                      width: MediaQuery.sizeOf(context).width *
                                          0.8,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
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
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
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
                                                            .pageViewController4 ??=
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
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/Anson.webp',
                                                                fit: BoxFit
                                                                    .cover,
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
                                                              textAlign:
                                                                  TextAlign
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
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/richard-image.jpeg',
                                                                fit: BoxFit
                                                                    .cover,
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
                                                              textAlign:
                                                                  TextAlign
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
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/giang-picture.jpeg',
                                                                fit: BoxFit
                                                                    .cover,
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
                                                              textAlign:
                                                                  TextAlign
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
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/minh-picture.jpg',
                                                                fit: BoxFit
                                                                    .cover,
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
                                                              textAlign:
                                                                  TextAlign
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
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/james-picture.jpg',
                                                                fit: BoxFit
                                                                    .cover,
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
                                                              textAlign:
                                                                  TextAlign
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
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 30.0),
                                                    child: smooth_page_indicator
                                                        .SmoothPageIndicator(
                                                      controller: _model
                                                              .pageViewController4 ??=
                                                          PageController(
                                                              initialPage: 0),
                                                      count: 5,
                                                      axisDirection:
                                                          Axis.horizontal,
                                                      onDotClicked: (i) async {
                                                        await _model
                                                            .pageViewController4!
                                                            .animateToPage(
                                                          i,
                                                          duration: const Duration(
                                                              milliseconds:
                                                                  500),
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
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 20.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(24.0),
                                  child: Container(
                                    width: screenWidth * 0.55 + 200,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ClipPath(
                                          clipper: CustomShape(),
                                          clipBehavior: Clip.antiAlias,
                                          child: Image.asset(
                                            'assets/images/DSC_1606.webp',
                                            width: screenWidth,
                                            height: 450,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(60.0, 15.0, 0.0, 0.0),
                                            child: Text(
                                              'Software Developer',
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                fontSize: 45,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          height: 0,
                                          indent: 60.0,
                                          endIndent: 60.0,
                                          color: FlutterFlowTheme.of(context).primaryText,
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(60.0, 10.0, 0.0, 15.0),
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    'Minimum qualifications',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const Padding(
                                                            padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                        Flexible(
                                                          child: Text(
                                                            'Bachelor’s degree or equivalent practical experience',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              fontSize: 15,
                                                              lineHeight: 1.17,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(width: 5)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const Padding(
                                                            padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                        Flexible(
                                                          child: Text(
                                                            '2 years of experience with software development in one or more programming languages, or 1 year of experience with an advanced degree',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              fontSize: 15,
                                                              lineHeight: 1.17,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(width: 5)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const Padding(
                                                            padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                        Flexible(
                                                          child: Text(
                                                            '2 years of experience with data structures or algorithms in either an academic or industry setting',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              fontSize: 15,
                                                              lineHeight: 1.17,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(width: 5)),
                                                    ),
                                                  ),
                                                  if (exp1[0]) ...[
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      'Preferred qualifications',
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                  if (exp1[1]) ...[
                                                    const SizedBox(height: 4),
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          const Padding(
                                                              padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                          Flexible(
                                                            child: Text(
                                                              'Master\'s degree or PhD in Computer Science or related technical field',
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontSize: 16,
                                                                lineHeight: 1.17,
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(width: 5)),
                                                      ),
                                                    ),
                                                  ],
                                                  if (exp1[2])
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          const Padding(
                                                              padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                          Flexible(
                                                            child: Text(
                                                              '2 years of experience with front-end frameworks, full-stack development, and/or API development',
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontSize: 16,
                                                                lineHeight: 1.17,
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(width: 5)),
                                                      ),
                                                    ),
                                                  if (exp1[3])
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          const Padding(
                                                              padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                          Flexible(
                                                            child: Text(
                                                              'Experience developing accessible technologies',
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontSize: 16,
                                                                lineHeight: 1.17,
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(width: 5)),
                                                      ),
                                                    ),
                                                ].divide(const SizedBox(height: 5.0))),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(1.0, 1.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 15.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () {
                                                    _exp1 = !_exp1;
                                                    for (int i = 0; i < exp1.length; i++) {
                                                      Future.delayed(Duration(milliseconds: i * 10), () {
                                                        if (_exp1) {
                                                          exp1[i] = !exp1[i];
                                                        } else {
                                                          exp1[exp1.length - i - 1] = !exp1[exp1.length - i - 1];
                                                        }
                                                        setState(() {});
                                                      });
                                                    }
                                                  },
                                                  text: _exp1 ? 'Read Less' : 'Read More',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                    color: Colors.white,
                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(

                                                      color: Colors.black87,
                                                    ),
                                                    elevation: 0.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.grey,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () {
                                                    job = 'Software Developer';
                                                    showDialog<String>(
                                                      context: context,
                                                      builder: (BuildContext context) => const Dialog(
                                                        shape: ContinuousRectangleBorder(),
                                                        surfaceTintColor: Colors.grey,
                                                        child: EmailDialog(),
                                                      ),
                                                    );
                                                  },
                                                  text: 'APPLY NOW',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                    color: const Color(0xFF1F4477),
                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(

                                                      color: Colors.white,
                                                    ),
                                                    elevation: 3.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 15)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(24.0),
                                  child: Container(
                                    width: screenWidth * 0.55 + 200,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ClipPath(
                                          clipper: CustomShape(),
                                          clipBehavior: Clip.antiAlias,
                                          child: Image.asset(
                                            'assets/images/2023NA_030.webp',
                                            width: screenWidth,
                                            height: 450,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(60.0, 15.0, 0.0, 0.0),
                                            child: Text(
                                              'Graphic Designer',
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                fontSize: 45,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          height: 0,
                                          indent: 60.0,
                                          endIndent: 60.0,
                                          color: FlutterFlowTheme.of(context).primaryText,
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(60.0, 10.0, 0.0, 15.0),
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    'Minimum qualifications',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const Padding(
                                                            padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                        Flexible(
                                                          child: Text(
                                                            'Bachelor’s degree or equivalent practical experience',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              fontSize: 15,
                                                              lineHeight: 1.17,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(width: 5)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const Padding(
                                                            padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                        Flexible(
                                                          child: Text(
                                                            'At least 3 years of graphic design experience with strong portfolio',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              fontSize: 15,
                                                              lineHeight: 1.17,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(width: 5)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const Padding(
                                                            padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                        Flexible(
                                                          child: Text(
                                                            'Excellent communication and interpersonal skills',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              fontSize: 15,
                                                              lineHeight: 1.17,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(width: 5)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const Padding(
                                                            padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                        Flexible(
                                                          child: Text(
                                                            'Strong attention to detail and ability to meet deadlines',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              fontSize: 15,
                                                              lineHeight: 1.17,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(width: 5)),
                                                    ),
                                                  ),
                                                  if (exp2[0]) ...[
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      'Preferred qualifications',
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                  if (exp2[1]) ...[
                                                    const SizedBox(height: 4),
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          const Padding(
                                                              padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                          Flexible(
                                                            child: Text(
                                                              '5+ years experience in production and graphic design',
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontSize: 16,
                                                                lineHeight: 1.17,
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(width: 5)),
                                                      ),
                                                    ),
                                                  ],
                                                  if (exp2[2])
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          const Padding(
                                                              padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                          Flexible(
                                                            child: Text(
                                                              'Expert knowledge of Adobe Creative Suite (InDesign, Illustrator, Photoshop), and/or Microsoft Office',
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontSize: 16,
                                                                lineHeight: 1.17,
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(width: 5)),
                                                      ),
                                                    ),
                                                ].divide(const SizedBox(height: 5.0))),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(1.0, 1.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 15.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () {
                                                    _exp2 = !_exp2;
                                                    for (int i = 0; i < exp2.length; i++) {
                                                      Future.delayed(Duration(milliseconds: i * 10), () {
                                                        if (_exp2) {
                                                          exp2[i] = !exp2[i];
                                                        } else {
                                                          exp2[exp2.length - i - 1] = !exp2[exp2.length - i - 1];
                                                        }
                                                        setState(() {});
                                                      });
                                                    }
                                                  },
                                                  text: _exp2 ? 'Read Less' : 'Read More',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                    color: Colors.white,
                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(

                                                      color: Colors.black87,
                                                    ),
                                                    elevation: 0.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.grey,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () {
                                                    job = 'Graphic Designer';
                                                    showDialog<String>(
                                                      context: context,
                                                      builder: (BuildContext context) => const Dialog(
                                                        shape: ContinuousRectangleBorder(),
                                                        surfaceTintColor: Colors.grey,
                                                        child: EmailDialog(),
                                                      ),
                                                    );
                                                  },
                                                  text: 'APPLY NOW',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                    color: const Color(0xFF1F4477),
                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(

                                                      color: Colors.white,
                                                    ),
                                                    elevation: 3.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 15)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(24.0),
                                  child: Container(
                                    width: screenWidth * 0.55 + 200,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ClipPath(
                                          clipper: CustomShape(),
                                          clipBehavior: Clip.antiAlias,
                                          child: Image.asset(
                                            'assets/images/2023NA_231.jpg',
                                            width: screenWidth,
                                            height: 450,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(60.0, 15.0, 0.0, 0.0),
                                            child: Text(
                                              'Sales Manager',
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                fontSize: 45,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          height: 0,
                                          indent: 60.0,
                                          endIndent: 60.0,
                                          color: FlutterFlowTheme.of(context).primaryText,
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(60.0, 10.0, 0.0, 15.0),
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    'Minimum qualifications',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const Padding(
                                                            padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                        Flexible(
                                                          child: Text(
                                                            'Bachelor’s degree or equivalent practical experience',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              fontSize: 15,
                                                              lineHeight: 1.17,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(width: 5)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const Padding(
                                                            padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                        Flexible(
                                                          child: Text(
                                                            '5 years of experience leading and managing a team',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              fontSize: 15,
                                                              lineHeight: 1.17,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(width: 5)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const Padding(
                                                            padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                        Flexible(
                                                          child: Text(
                                                            'Experience engaging with accounts, selling a portfolio of products at C-level',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              fontSize: 15,
                                                              lineHeight: 1.17,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(width: 5)),
                                                    ),
                                                  ),
                                                  if (exp3[0]) ...[
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      'Preferred qualifications',
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                  if (exp3[1]) ...[
                                                    const SizedBox(height: 4),
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          const Padding(
                                                              padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                          Flexible(
                                                            child: Text(
                                                              'Experience leading a team of sellers working with customers that span multiple industries and aligning technology solutions to drive high value business outcomes',
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontSize: 16,
                                                                lineHeight: 1.17,
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(width: 5)),
                                                      ),
                                                    ),
                                                  ],
                                                  if (exp3[2])
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          const Padding(
                                                              padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                          Flexible(
                                                            child: Text(
                                                              'Experience leveraging cross-functional leaders including engineering, marketing, partner sales managers, external partners, and solution specialists to build and implement business strategies that yield positive outcomes and results',
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontSize: 16,
                                                                lineHeight: 1.17,
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(width: 5)),
                                                      ),
                                                    ),
                                                  if (exp3[3])
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          const Padding(
                                                              padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                          Flexible(
                                                            child: Text(
                                                              'Knowledge of startup customers and the differentiated value that Nothern Horizon can provide in this industry',
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontSize: 16,
                                                                lineHeight: 1.17,
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(width: 5)),
                                                      ),
                                                    ),
                                                ].divide(const SizedBox(height: 5.0))),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(1.0, 1.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 15.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () {
                                                    _exp3 = !_exp3;
                                                    for (int i = 0; i < exp3.length; i++) {
                                                      Future.delayed(Duration(milliseconds: i * 10), () {
                                                        if (_exp3) {
                                                          exp3[i] = !exp3[i];
                                                        } else {
                                                          exp3[exp3.length - i - 1] = !exp3[exp3.length - i - 1];
                                                        }
                                                        setState(() {});
                                                      });
                                                    }
                                                  },
                                                  text: _exp3 ? 'Read Less' : 'Read More',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                    color: Colors.white,
                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(

                                                      color: Colors.black87,
                                                    ),
                                                    elevation: 0.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.grey,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () {
                                                    job = 'Sales Manager';
                                                    showDialog<String>(
                                                      context: context,
                                                      builder: (BuildContext context) => const Dialog(
                                                        shape: ContinuousRectangleBorder(),
                                                        surfaceTintColor: Colors.grey,
                                                        child: EmailDialog(),
                                                      ),
                                                    );
                                                  },
                                                  text: 'APPLY NOW',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                    color: const Color(0xFF1F4477),
                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(

                                                      color: Colors.white,
                                                    ),
                                                    elevation: 3.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 15)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 40.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(24.0),
                                  child: Container(
                                    width: screenWidth * 0.55 + 200,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ClipPath(
                                          clipper: CustomShape(),
                                          clipBehavior: Clip.antiAlias,
                                          child: Image.asset(
                                            'assets/images/2023NA_073.jpg',
                                            width: screenWidth,
                                            height: 450,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(60.0, 15.0, 0.0, 0.0),
                                            child: Text(
                                              'Marketing Director',
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                fontSize: 45,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          height: 0,
                                          indent: 60.0,
                                          endIndent: 60.0,
                                          color: FlutterFlowTheme.of(context).primaryText,
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(60.0, 10.0, 0.0, 15.0),
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    'Minimum qualifications',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const Padding(
                                                            padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                        Flexible(
                                                          child: Text(
                                                            'Bachelor\'s degree or equivalent experience',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              fontSize: 15,
                                                              lineHeight: 1.17,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(width: 5)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const Padding(
                                                            padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                        Flexible(
                                                          child: Text(
                                                            '4 years of experience in marketing',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              fontSize: 15,
                                                              lineHeight: 1.17,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(width: 5)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const Padding(
                                                            padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                        Flexible(
                                                          child: Text(
                                                            'Experience managing cross-functional or cross-team projects',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              fontSize: 15,
                                                              lineHeight: 1.17,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(width: 5)),
                                                    ),
                                                  ),
                                                  if (exp4[0]) ...[
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      'Preferred qualifications',
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                  if (exp4[1]) ...[
                                                    const SizedBox(height: 4),
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          const Padding(
                                                              padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                          Flexible(
                                                            child: Text(
                                                              'Experience translating complex ideas and making them human and relatable',
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontSize: 16,
                                                                lineHeight: 1.17,
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(width: 5)),
                                                      ),
                                                    ),
                                                  ],
                                                  if (exp4[2])
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          const Padding(
                                                              padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                          Flexible(
                                                            child: Text(
                                                              'Experience working with product/product marketing disciplines',
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontSize: 16,
                                                                lineHeight: 1.17,
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(width: 5)),
                                                      ),
                                                    ),
                                                  if (exp4[3])
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          const Padding(
                                                              padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                          Flexible(
                                                            child: Text(
                                                              'Experience working with creative agencies',
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontSize: 16,
                                                                lineHeight: 1.17,
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(width: 5)),
                                                      ),
                                                    ),
                                                  if (exp4[4])
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          const Padding(
                                                              padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                          Flexible(
                                                            child: Text(
                                                              'Experience in program management',
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontSize: 16,
                                                                lineHeight: 1.17,
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(width: 5)),
                                                      ),
                                                    ),
                                                  if (exp4[5])
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          const Padding(
                                                              padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                          Flexible(
                                                            child: Text(
                                                              'Experience managing cross-functional teams and stakeholders',
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontSize: 16,
                                                                lineHeight: 1.17,
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(width: 5)),
                                                      ),
                                                    ),
                                                  if (exp4[6])
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 35, 0),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          const Padding(
                                                              padding: EdgeInsets.only(top: 8), child: Icon(Icons.circle_sharp, size: 5)),
                                                          Flexible(
                                                            child: Text(
                                                              'Experience landing marketing programs across global, regional, and local audiences',
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontSize: 16,
                                                                lineHeight: 1.17,
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(width: 5)),
                                                      ),
                                                    ),
                                                ].divide(const SizedBox(height: 5.0))),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(1.0, 1.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 15.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () {
                                                    _exp4 = !_exp4;
                                                    for (int i = 0; i < exp4.length; i++) {
                                                      Future.delayed(Duration(milliseconds: i * 10), () {
                                                        if (_exp4) {
                                                          exp4[i] = !exp4[i];
                                                        } else {
                                                          exp4[exp4.length - i - 1] = !exp4[exp4.length - i - 1];
                                                        }
                                                        setState(() {});
                                                      });
                                                    }
                                                  },
                                                  text: _exp4 ? 'Read Less' : 'Read More',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                    color: Colors.white,
                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(

                                                      color: Colors.black87,
                                                    ),
                                                    elevation: 0.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.grey,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () {
                                                    job = 'Marketing Director';
                                                    showDialog<String>(
                                                      context: context,
                                                      builder: (BuildContext context) => const Dialog(
                                                        shape: ContinuousRectangleBorder(),
                                                        surfaceTintColor: Colors.grey,
                                                        child: EmailDialog(),
                                                      ),
                                                    );
                                                  },
                                                  text: 'APPLY NOW',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                    color: const Color(0xFF1F4477),
                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(

                                                      color: Colors.white,
                                                    ),
                                                    elevation: 3.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 15)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        if (responsiveVisibility(
                          context: context,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14.0),
                                  child: Container(
                                    width: screenWidth * 0.85,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset(
                                          'assets/images/DSC_1606.webp',
                                          width: screenWidth,
                                          height: 250,
                                          fit: BoxFit.cover,
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(25.0, 17.0, 0.0, 0.0),
                                            child: Text(
                                              'Software Developer',
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                fontSize: 24.5,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          height: 0,
                                          indent: 25.0,
                                          endIndent: 25.0,
                                          color: FlutterFlowTheme.of(context).primaryText,
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(25.0, 10.0, 25.0, 8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Minimum qualifications',
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                        child: Icon(Icons.circle_sharp, size: 4)),
                                                    Flexible(
                                                      child: Text(
                                                        'Bachelor’s degree or equivalent practical experience',
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          fontSize: 14,
                                                          lineHeight: 1.15,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                        child: Icon(Icons.circle_sharp, size: 4)),
                                                    Flexible(
                                                      child: Text(
                                                        '2 years of experience with software development in one or more programming languages, or 1 year of experience with an advanced degree',
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          fontSize: 14,
                                                          lineHeight: 1.15,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                        child: Icon(Icons.circle_sharp, size: 4)),
                                                    Flexible(
                                                      child: Text(
                                                        '2 years of experience with data structures or algorithms in either an academic or industry setting',
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          fontSize: 14,
                                                          lineHeight: 1.15,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                if (exp1[0])
                                                  Text(
                                                    'Preferred qualifications',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                if (exp1[1])
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                          child: Icon(Icons.circle_sharp, size: 4)),
                                                      Flexible(
                                                        child: Text(
                                                          'Master\'s degree or PhD in Computer Science or related technical field',
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontSize: 14,
                                                            lineHeight: 1.15,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                if (exp1[2])
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                          child: Icon(Icons.circle_sharp, size: 4)),
                                                      Flexible(
                                                        child: Text(
                                                          '2 years of experience with front-end frameworks, full-stack development, and/or API development',
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontSize: 14,
                                                            lineHeight: 1.15,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                if (exp1[3])
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                          child: Icon(Icons.circle_sharp, size: 4)),
                                                      Flexible(
                                                        child: Text(
                                                          'Experience developing accessible technologies',
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontSize: 14,
                                                            lineHeight: 1.15,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                              ].divide(const SizedBox(height: 6)),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () {
                                                    _exp1 = !_exp1;
                                                    for (int i = 0; i < exp1.length; i++) {
                                                      Future.delayed(Duration(milliseconds: i * 10), () {
                                                        if (_exp1) {
                                                          exp1[i] = !exp1[i];
                                                        } else {
                                                          exp1[exp1.length - i - 1] = !exp1[exp1.length - i - 1];
                                                        }
                                                        setState(() {});
                                                      });
                                                    }
                                                  },
                                                  text: _exp1 ? 'Read Less' : 'Read More',
                                                  options: FFButtonOptions(
                                                    height: 35.0,
                                                    padding: const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                    color: Colors.white70,
                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(

                                                      color: Colors.black87,
                                                      fontSize: 15.0,
                                                    ),
                                                    elevation: 0.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.grey,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () {
                                                    job = 'Software Developer';
                                                    showDialog<String>(
                                                      context: context,
                                                      builder: (BuildContext context) => const Dialog(
                                                        shape: ContinuousRectangleBorder(),
                                                        surfaceTintColor: Colors.grey,
                                                        child: EmailDialog(),
                                                      ),
                                                    );
                                                  },
                                                  text: 'APPLY NOW',
                                                  options: FFButtonOptions(
                                                    height: 35.0,
                                                    padding: const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                    color: const Color(0xFF1F4477),
                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(

                                                      color: Colors.white,
                                                      fontSize: 15.0,
                                                    ),
                                                    elevation: 3.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 10)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14.0),
                                  child: Container(
                                    width: screenWidth * 0.85,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset(
                                          'assets/images/2023NA_030.webp',
                                          width: screenWidth,
                                          height: 250,
                                          fit: BoxFit.cover,
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(25.0, 17.0, 0.0, 0.0),
                                            child: Text(
                                              'Graphic Designer',
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                fontSize: 24.5,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          height: 0,
                                          indent: 25.0,
                                          endIndent: 25.0,
                                          color: FlutterFlowTheme.of(context).primaryText,
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(25.0, 10.0, 25.0, 8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Minimum qualifications',
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                        child: Icon(Icons.circle_sharp, size: 4)),
                                                    Flexible(
                                                      child: Text(
                                                        'Bachelor’s degree or equivalent practical experience',
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          fontSize: 14,
                                                          lineHeight: 1.15,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                        child: Icon(Icons.circle_sharp, size: 4)),
                                                    Flexible(
                                                      child: Text(
                                                        'At least 3 years of graphic design experience with strong portfolio',
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          fontSize: 14,
                                                          lineHeight: 1.15,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                        child: Icon(Icons.circle_sharp, size: 4)),
                                                    Flexible(
                                                      child: Text(
                                                        'Excellent communication and interpersonal skills',
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          fontSize: 14,
                                                          lineHeight: 1.15,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                        child: Icon(Icons.circle_sharp, size: 4)),
                                                    Flexible(
                                                      child: Text(
                                                        '5+ years experience in production and graphic design',
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          fontSize: 14,
                                                          lineHeight: 1.15,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                if (exp2[0])
                                                  Text(
                                                    'Preferred qualifications',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                if (exp2[1])
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                          child: Icon(Icons.circle_sharp, size: 4)),
                                                      Flexible(
                                                        child: Text(
                                                          'Master\'s degree or PhD in Computer Science or related technical field',
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontSize: 14,
                                                            lineHeight: 1.15,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                if (exp2[2])
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                          child: Icon(Icons.circle_sharp, size: 4)),
                                                      Flexible(
                                                        child: Text(
                                                          'Expert knowledge of Adobe Creative Suite (InDesign, Illustrator, Photoshop), and/or Microsoft Office',
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontSize: 14,
                                                            lineHeight: 1.15,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                              ].divide(const SizedBox(height: 6)),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () {
                                                    _exp2 = !_exp2;
                                                    for (int i = 0; i < exp2.length; i++) {
                                                      Future.delayed(Duration(milliseconds: i * 10), () {
                                                        if (_exp2) {
                                                          exp2[i] = !exp2[i];
                                                        } else {
                                                          exp2[exp2.length - i - 1] = !exp2[exp2.length - i - 1];
                                                        }
                                                        setState(() {});
                                                      });
                                                    }
                                                  },
                                                  text: _exp2 ? 'Read Less' : 'Read More',
                                                  options: FFButtonOptions(
                                                    height: 35.0,
                                                    padding: const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                    color: Colors.white70,
                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(

                                                      color: Colors.black87,
                                                      fontSize: 15.0,
                                                    ),
                                                    elevation: 0.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.grey,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () {
                                                    job = 'Graphic Designer';
                                                    showDialog<String>(
                                                      context: context,
                                                      builder: (BuildContext context) => const Dialog(
                                                        shape: ContinuousRectangleBorder(),
                                                        surfaceTintColor: Colors.grey,
                                                        child: EmailDialog(),
                                                      ),
                                                    );
                                                  },
                                                  text: 'APPLY NOW',
                                                  options: FFButtonOptions(
                                                    height: 35.0,
                                                    padding: const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                    color: const Color(0xFF1F4477),
                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(

                                                      color: Colors.white,
                                                      fontSize: 15.0,
                                                    ),
                                                    elevation: 3.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 10)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14.0),
                                  child: Container(
                                    width: screenWidth * 0.85,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset(
                                          'assets/images/2023NA_231.jpg',
                                          width: screenWidth,
                                          height: 250,
                                          fit: BoxFit.cover,
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(25.0, 17.0, 0.0, 0.0),
                                            child: Text(
                                              'Sales Manager',
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                fontSize: 24.5,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          height: 0,
                                          indent: 25.0,
                                          endIndent: 25.0,
                                          color: FlutterFlowTheme.of(context).primaryText,
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(25.0, 10.0, 25.0, 8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Minimum qualifications',
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                        child: Icon(Icons.circle_sharp, size: 4)),
                                                    Flexible(
                                                      child: Text(
                                                        'Bachelor’s degree or equivalent practical experience',
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          fontSize: 14,
                                                          lineHeight: 1.15,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                        child: Icon(Icons.circle_sharp, size: 4)),
                                                    Flexible(
                                                      child: Text(
                                                        '5 years of experience leading and managing a team',
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          fontSize: 14,
                                                          lineHeight: 1.15,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                        child: Icon(Icons.circle_sharp, size: 4)),
                                                    Flexible(
                                                      child: Text(
                                                        'Experience engaging with accounts, selling a portfolio of products at C-level',
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          fontSize: 14,
                                                          lineHeight: 1.15,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                if (exp3[0])
                                                  Text(
                                                    'Preferred qualifications',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                if (exp3[1])
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                          child: Icon(Icons.circle_sharp, size: 4)),
                                                      Flexible(
                                                        child: Text(
                                                          'Experience leading a team of sellers working with customers that span multiple industries and aligning technology solutions to drive high value business outcomes',
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontSize: 14,
                                                            lineHeight: 1.15,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                if (exp3[2])
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                          child: Icon(Icons.circle_sharp, size: 4)),
                                                      Flexible(
                                                        child: Text(
                                                          'Experience leveraging cross-functional leaders including engineering, marketing, partner sales managers, external partners, and solution specialists to build and implement business strategies that yield positive outcomes and results',
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontSize: 14,
                                                            lineHeight: 1.15,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                if (exp3[3])
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                          child: Icon(Icons.circle_sharp, size: 4)),
                                                      Flexible(
                                                        child: Text(
                                                          'Knowledge of startup customers and the differentiated value that Northern Horizon can provide in this industry',
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontSize: 14,
                                                            lineHeight: 1.15,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                              ].divide(const SizedBox(height: 6)),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () {
                                                    _exp3 = !_exp3;
                                                    for (int i = 0; i < exp3.length; i++) {
                                                      Future.delayed(Duration(milliseconds: i * 10), () {
                                                        if (_exp3) {
                                                          exp3[i] = !exp3[i];
                                                        } else {
                                                          exp3[exp3.length - i - 1] = !exp3[exp3.length - i - 1];
                                                        }
                                                        setState(() {});
                                                      });
                                                    }
                                                  },
                                                  text: _exp3 ? 'Read Less' : 'Read More',
                                                  options: FFButtonOptions(
                                                    height: 35.0,
                                                    padding: const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                    color: Colors.white70,
                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(

                                                      color: Colors.black87,
                                                      fontSize: 15.0,
                                                    ),
                                                    elevation: 0.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.grey,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () {
                                                    job = 'Sales Manager';
                                                    showDialog<String>(
                                                      context: context,
                                                      builder: (BuildContext context) => const Dialog(
                                                        shape: ContinuousRectangleBorder(),
                                                        surfaceTintColor: Colors.grey,
                                                        child: EmailDialog(),
                                                      ),
                                                    );
                                                  },
                                                  text: 'APPLY NOW',
                                                  options: FFButtonOptions(
                                                    height: 35.0,
                                                    padding: const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                    color: const Color(0xFF1F4477),
                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(

                                                      color: Colors.white,
                                                      fontSize: 15.0,
                                                    ),
                                                    elevation: 3.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 10)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 25.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14.0),
                                  child: Container(
                                    width: screenWidth * 0.85,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset(
                                          'assets/images/2023NA_073.jpg',
                                          width: screenWidth,
                                          height: 250,
                                          fit: BoxFit.cover,
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(25.0, 17.0, 0.0, 0.0),
                                            child: Text(
                                              'Marketing Director',
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                fontSize: 24.5,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          height: 0,
                                          indent: 25.0,
                                          endIndent: 25.0,
                                          color: FlutterFlowTheme.of(context).primaryText,
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(25.0, 10.0, 25.0, 8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Minimum qualifications',
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                        child: Icon(Icons.circle_sharp, size: 4)),
                                                    Flexible(
                                                      child: Text(
                                                        'Bachelor\'s degree or equivalent experience',
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          fontSize: 14,
                                                          lineHeight: 1.15,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                        child: Icon(Icons.circle_sharp, size: 4)),
                                                    Flexible(
                                                      child: Text(
                                                        '4 years of experience in marketing',
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          fontSize: 14,
                                                          lineHeight: 1.15,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                        child: Icon(Icons.circle_sharp, size: 4)),
                                                    Flexible(
                                                      child: Text(
                                                        'Experience managing cross-functional or cross-team projects',
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          fontSize: 14,
                                                          lineHeight: 1.15,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                if (exp4[0])
                                                  Text(
                                                    'Preferred qualifications',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                if (exp4[1])
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                          child: Icon(Icons.circle_sharp, size: 4)),
                                                      Flexible(
                                                        child: Text(
                                                          'Experience translating complex ideas and making them human and relatable',
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontSize: 14,
                                                            lineHeight: 1.15,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                if (exp4[2])
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                          child: Icon(Icons.circle_sharp, size: 4)),
                                                      Flexible(
                                                        child: Text(
                                                          'Experience working with product/product marketing disciplines',
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontSize: 14,
                                                            lineHeight: 1.15,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                if (exp4[3])
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                          child: Icon(Icons.circle_sharp, size: 4)),
                                                      Flexible(
                                                        child: Text(
                                                          'Experience working with creative agencies',
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontSize: 14,
                                                            lineHeight: 1.15,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                if (exp4[4])
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                          child: Icon(Icons.circle_sharp, size: 4)),
                                                      Flexible(
                                                        child: Text(
                                                          'Experience in program management',
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontSize: 14,
                                                            lineHeight: 1.15,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                if (exp4[5])
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                          child: Icon(Icons.circle_sharp, size: 4)),
                                                      Flexible(
                                                        child: Text(
                                                          'Experience managing cross-functional teams and stakeholders',
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontSize: 14,
                                                            lineHeight: 1.15,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                if (exp4[6])
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 3.0, 0.0),
                                                          child: Icon(Icons.circle_sharp, size: 4)),
                                                      Flexible(
                                                        child: Text(
                                                          'Experience landing marketing programs across global, regional, and local audiences',
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontSize: 14,
                                                            lineHeight: 1.15,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                              ].divide(const SizedBox(height: 6)),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () {
                                                    _exp4 = !_exp4;
                                                    for (int i = 0; i < exp4.length; i++) {
                                                      Future.delayed(Duration(milliseconds: i * 10), () {
                                                        if (_exp4) {
                                                          exp4[i] = !exp4[i];
                                                        } else {
                                                          exp4[exp4.length - i - 1] = !exp4[exp4.length - i - 1];
                                                        }
                                                        setState(() {});
                                                      });
                                                    }
                                                  },
                                                  text: _exp4 ? 'Read Less' : 'Read More',
                                                  options: FFButtonOptions(
                                                    height: 35.0,
                                                    padding: const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                    color: Colors.white70,
                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(

                                                      color: Colors.black87,
                                                      fontSize: 15.0,
                                                    ),
                                                    elevation: 0.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.grey,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () {
                                                    job = 'Marketing Director';
                                                    showDialog<String>(
                                                      context: context,
                                                      builder: (BuildContext context) => const Dialog(
                                                        shape: ContinuousRectangleBorder(),
                                                        surfaceTintColor: Colors.grey,
                                                        child: EmailDialog(),
                                                      ),
                                                    );
                                                  },
                                                  text: 'APPLY NOW',
                                                  options: FFButtonOptions(
                                                    height: 35.0,
                                                    padding: const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                    color: const Color(0xFF1F4477),
                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(

                                                      color: Colors.white,
                                                      fontSize: 15.0,
                                                    ),
                                                    elevation: 3.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 10)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        // const FooterWidget(),
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
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.14,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 25.0, 25.0),
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
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 25.0, 25.0),
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
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
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
                                'CAREER',
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
                                height:
                                    MediaQuery.sizeOf(context).height * 0.08,
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
            ],
          ),
        ),
      ),
    );
  }
}
