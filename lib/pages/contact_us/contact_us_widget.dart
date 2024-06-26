import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'contact_us_model.dart';
export 'contact_us_model.dart';

class ContactUsWidget extends StatefulWidget {
  const ContactUsWidget({super.key});

  @override
  State<ContactUsWidget> createState() => _ContactUsWidgetState();
}

class _ContactUsWidgetState extends State<ContactUsWidget> {
  late ContactUsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContactUsModel());

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
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              expandedHeight: MediaQuery.sizeOf(context).height * 0.03,
              collapsedHeight: MediaQuery.sizeOf(context).height * 0.02,
              pinned: true,
              floating: false,
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.black),
              automaticallyImplyLeading: false,
              actions: const [],
              flexibleSpace: FlexibleSpaceBar(
                title: Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: SvgPicture.network(
                                'https://northernhorizon.org/public/assets/logo-blue.svg',
                                width: MediaQuery.sizeOf(context).width * 0.244,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.054,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                centerTitle: false,
                expandedTitleScale: 1.0,
              ),
              toolbarHeight: MediaQuery.sizeOf(context).height * 0.02,
              elevation: 3.0,
            )
          ],
          body: Builder(
            builder: (context) {
              return SafeArea(
                top: false,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                            tabletLandscape: false,
                          ))
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.black,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize:
                                      MediaQuery.sizeOf(context).width * 0.04,
                                  fillColor: const Color(0x001F1F23),
                                  icon: const FaIcon(
                                    FontAwesomeIcons.arrowLeft,
                                    color: Color(0xFFEEB609),
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed('homePage');
                                  },
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
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.black,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize:
                                      MediaQuery.sizeOf(context).width * 0.1,
                                  fillColor: const Color(0x001F1F23),
                                  icon: const FaIcon(
                                    FontAwesomeIcons.arrowLeft,
                                    color: Color(0xFFEEB609),
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed('homePage');
                                  },
                                ),
                              ),
                            ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                            tabletLandscape: false,
                          ))
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'images/Mr.Anson.png',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.183,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.3,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Text(
                                            'anson zhao',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'NORD',
                                                  color: Colors.black,
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'DIRECTOR/CEO',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'NORD',
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                              fontStyle: FontStyle.italic,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      const SizedBox(
                                        width: 280.0,
                                        child: Divider(
                                          height: 20.0,
                                          thickness: 1.0,
                                          color: Color(0xCC000000),
                                        ),
                                      ),
                                      Text(
                                        'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. In a quam tellus. Mauris \nrisus dui, efficitur sit amet eros ut, \nultricies cursus felis. Phasellus egestas \nfinibus nisi, id vehicula arcu sodales in. \nPellentesque vitae efficitur eros. Fusce in \nvarius elit, quis ullamcorper arcu. \nSuspendisse ligula purus, molestie non \nnunc vitae, consectetur vestibulum sem.\n\nLorem ipsum dolor sit amet, consectetur \nadipiscing elit. In a quam tellus. Mauris \nrisus dui, efficitur sit amet eros ut, \nultricies cursus felis. Phasellus egestas \nfinibus nisi, id vehicula arcu sodales in. \nPellentesque vitae efficitur eros. Fusce in \nvarius elit, quis ullamcorper arcu. \nSuspendisse ligula purus, molestie non \nnunc vitae, consectetur vestibulum sem.',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Align(
                                        alignment:
                                        const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 15.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await launchUrl(Uri(
                                                  scheme: 'mailto',
                                                  path:
                                                  'azhao@g.northernacademy.org',
                                                  query: {
                                                    'subject':
                                                    'More Information',
                                                    'body': 'Hello Anson, ...',
                                                  }
                                                      .entries
                                                      .map((MapEntry<String,
                                                      String>
                                                  e) =>
                                                  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                      .join('&')));
                                            },
                                            text: 'CONTACT NOW',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: const Color(0xFFEEB609),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 3.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              hoverTextColor: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'images/Yuvraj.png',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.183,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.3,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Text(
                                            'YUVRAJ MUNDI',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'NORD',
                                                  color: Colors.black,
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'HEAD OF CODING DEPT.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'NORD',
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                              fontStyle: FontStyle.italic,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      const SizedBox(
                                        width: 280.0,
                                        child: Divider(
                                          height: 20.0,
                                          thickness: 1.0,
                                          color: Color(0xCC000000),
                                        ),
                                      ),
                                      Text(
                                        'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. In a quam tellus. Mauris \nrisus dui, efficitur sit amet eros ut, \nultricies cursus felis. Phasellus egestas \nfinibus nisi, id vehicula arcu sodales in. \nPellentesque vitae efficitur eros. Fusce in \nvarius elit, quis ullamcorper arcu. \nSuspendisse ligula purus, molestie non \nnunc vitae, consectetur vestibulum sem.\n\nLorem ipsum dolor sit amet, consectetur \nadipiscing elit. In a quam tellus. Mauris \nrisus dui, efficitur sit amet eros ut, \nultricies cursus felis. Phasellus egestas \nfinibus nisi, id vehicula arcu sodales in. \nPellentesque vitae efficitur eros. Fusce in \nvarius elit, quis ullamcorper arcu. \nSuspendisse ligula purus, molestie non \nnunc vitae, consectetur vestibulum sem.',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await launchUrl(Uri(
                                                  scheme: 'mailto',
                                                  path:
                                                  'yuvraj.mundi@g.northernacademy.org',
                                                  query: {
                                                    'subject':
                                                    'More Information',
                                                    'body': 'Hello Yuvraj, ...',
                                                  }
                                                      .entries
                                                      .map((MapEntry<String,
                                                      String>
                                                  e) =>
                                                  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                      .join('&')));
                                            },
                                            text: 'CONTACT NOW',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: const Color(0xFFEEB609),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 3.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              hoverTextColor: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'images/Richard.png',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.183,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.3,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Text(
                                            'RICHARD VU',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'NORD',
                                                  color: Colors.black,
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'HEAD OF UI/UX DEPT.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'NORD',
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                              fontStyle: FontStyle.italic,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      const SizedBox(
                                        width: 280.0,
                                        child: Divider(
                                          height: 20.0,
                                          thickness: 1.0,
                                          color: Color(0xCC000000),
                                        ),
                                      ),
                                      Text(
                                        'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. In a quam tellus. Mauris \nrisus dui, efficitur sit amet eros ut, \nultricies cursus felis. Phasellus egestas \nfinibus nisi, id vehicula arcu sodales in. \nPellentesque vitae efficitur eros. Fusce in \nvarius elit, quis ullamcorper arcu. \nSuspendisse ligula purus, molestie non \nnunc vitae, consectetur vestibulum sem.\n\nLorem ipsum dolor sit amet, consectetur \nadipiscing elit. In a quam tellus. Mauris \nrisus dui, efficitur sit amet eros ut, \nultricies cursus felis. Phasellus egestas \nfinibus nisi, id vehicula arcu sodales in. \nPellentesque vitae efficitur eros. Fusce in \nvarius elit, quis ullamcorper arcu. \nSuspendisse ligula purus, molestie non \nnunc vitae, consectetur vestibulum sem.',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await launchUrl(Uri(
                                                  scheme: 'mailto',
                                                  path:
                                                  'ducminh.vu@g.northernacademy.org',
                                                  query: {
                                                    'subject':
                                                    'More Information',
                                                    'body': 'Hello Richard, ...',
                                                  }
                                                      .entries
                                                      .map((MapEntry<String,
                                                      String>
                                                  e) =>
                                                  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                      .join('&')));
                                            },
                                            text: 'CONTACT NOW',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: const Color(0xFFEEB609),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 3.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              hoverTextColor: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'images/Angel.png',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.183,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.3,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Text(
                                            'ANGEL YUAN',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'NORD',
                                                  color: Colors.black,
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'HEAD OF MARKETING DEPT.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'NORD',
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                              fontStyle: FontStyle.italic,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      const SizedBox(
                                        width: 280.0,
                                        child: Divider(
                                          height: 20.0,
                                          thickness: 1.0,
                                          color: Color(0xCC000000),
                                        ),
                                      ),
                                      Text(
                                        'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. In a quam tellus. Mauris \nrisus dui, efficitur sit amet eros ut, \nultricies cursus felis. Phasellus egestas \nfinibus nisi, id vehicula arcu sodales in. \nPellentesque vitae efficitur eros. Fusce in \nvarius elit, quis ullamcorper arcu. \nSuspendisse ligula purus, molestie non \nnunc vitae, consectetur vestibulum sem.\n\nLorem ipsum dolor sit amet, consectetur \nadipiscing elit. In a quam tellus. Mauris \nrisus dui, efficitur sit amet eros ut, \nultricies cursus felis. Phasellus egestas \nfinibus nisi, id vehicula arcu sodales in. \nPellentesque vitae efficitur eros. Fusce in \nvarius elit, quis ullamcorper arcu. \nSuspendisse ligula purus, molestie non \nnunc vitae, consectetur vestibulum sem.',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await launchUrl(Uri(
                                                  scheme: 'mailto',
                                                  path:
                                                  'angel.yuan@g.northernacademy.org',
                                                  query: {
                                                    'subject':
                                                    'More Information',
                                                    'body': 'Hello Angel, ...',
                                                  }
                                                      .entries
                                                      .map((MapEntry<String,
                                                      String>
                                                  e) =>
                                                  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                      .join('&')));
                                            },
                                            text: 'CONTACT NOW',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: const Color(0xFFEEB609),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 3.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              hoverTextColor: Colors.black,
                                            ),
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                child: CarouselSlider(
                                  items: [
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.asset(
                                              'images/Mr.Anson.png',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.43,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.25,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: Text(
                                                'anson zhao',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'NORD',
                                                          color: Colors.black,
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'DIRECTOR/CEO',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'NORD',
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                  fontStyle: FontStyle.italic,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                          const SizedBox(
                                            width: 280.0,
                                            child: Divider(
                                              height: 20.0,
                                              thickness: 1.0,
                                              color: Color(0xCC000000),
                                            ),
                                          ),
                                          Text(
                                            'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. In a quam tellus. Mauris \nrisus dui, efficitur sit amet eros ut, \nultricies cursus felis. Phasellus egestas \nfinibus nisi, id vehicula arcu sodales in. \nPellentesque vitae efficitur eros. Fusce in \nvarius elit, quis ullamcorper arcu. \nSuspendisse ligula purus, molestie non \nnunc vitae, consectetur vestibulum sem.\n\nLorem ipsum dolor sit amet, consectetur \nadipiscing elit. In a quam tellus. Mauris \nrisus dui, efficitur sit amet eros ut, \nultricies cursus felis. Phasellus egestas \nfinibus nisi, id vehicula arcu sodales in. \nPellentesque vitae efficitur eros. Fusce in \nvarius elit, quis ullamcorper arcu. \nSuspendisse ligula purus, molestie non \nnunc vitae, consectetur vestibulum sem.',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await launchUrl(Uri(
                                                      scheme: 'mailto',
                                                      path:
                                                      'azhao@northernacademy.org',
                                                      query: {
                                                        'subject':
                                                        'More Information',
                                                        'body': 'Hello Anson, ...',
                                                      }
                                                          .entries
                                                          .map((MapEntry<String,
                                                          String>
                                                      e) =>
                                                      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                          .join('&')));
                                                },
                                                text: 'CONTACT NOW',
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: const Color(0xFFEEB609),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.asset(
                                              'images/Yuvraj.png',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.43,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.25,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: Text(
                                                'YUVRAJ MUNDI',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'NORD',
                                                          color: Colors.black,
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'HEAD OF CODING DEPT.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'NORD',
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                  fontStyle: FontStyle.italic,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                          const SizedBox(
                                            width: 280.0,
                                            child: Divider(
                                              height: 20.0,
                                              thickness: 1.0,
                                              color: Color(0xCC000000),
                                            ),
                                          ),
                                          Text(
                                            'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. In a quam tellus. Mauris \nrisus dui, efficitur sit amet eros ut, \nultricies cursus felis. Phasellus egestas \nfinibus nisi, id vehicula arcu sodales in. \nPellentesque vitae efficitur eros. Fusce in \nvarius elit, quis ullamcorper arcu. \nSuspendisse ligula purus, molestie non \nnunc vitae, consectetur vestibulum sem.\n\nLorem ipsum dolor sit amet, consectetur \nadipiscing elit. In a quam tellus. Mauris \nrisus dui, efficitur sit amet eros ut, \nultricies cursus felis. Phasellus egestas \nfinibus nisi, id vehicula arcu sodales in. \nPellentesque vitae efficitur eros. Fusce in \nvarius elit, quis ullamcorper arcu. \nSuspendisse ligula purus, molestie non \nnunc vitae, consectetur vestibulum sem.',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await launchUrl(Uri(
                                                      scheme: 'mailto',
                                                      path:
                                                      'yuvraj.mundi@g.northernacademy.org',
                                                      query: {
                                                        'subject':
                                                        'More Information',
                                                        'body': 'Hello Yuvraj, ...',
                                                      }
                                                          .entries
                                                          .map((MapEntry<String,
                                                          String>
                                                      e) =>
                                                      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                          .join('&')));
                                                },
                                                text: 'CONTACT NOW',
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: const Color(0xFFEEB609),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.asset(
                                              'images/Richard.png',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.43,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.25,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: Text(
                                                'RICHARD VU',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'NORD',
                                                          color: Colors.black,
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'HEAD OF UI/UX DEPT.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'NORD',
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                  fontStyle: FontStyle.italic,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                          const SizedBox(
                                            width: 280.0,
                                            child: Divider(
                                              height: 20.0,
                                              thickness: 1.0,
                                              color: Color(0xCC000000),
                                            ),
                                          ),
                                          Text(
                                            'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. In a quam tellus. Mauris \nrisus dui, efficitur sit amet eros ut, \nultricies cursus felis. Phasellus egestas \nfinibus nisi, id vehicula arcu sodales in. \nPellentesque vitae efficitur eros. Fusce in \nvarius elit, quis ullamcorper arcu. \nSuspendisse ligula purus, molestie non \nnunc vitae, consectetur vestibulum sem.\n\nLorem ipsum dolor sit amet, consectetur \nadipiscing elit. In a quam tellus. Mauris \nrisus dui, efficitur sit amet eros ut, \nultricies cursus felis. Phasellus egestas \nfinibus nisi, id vehicula arcu sodales in. \nPellentesque vitae efficitur eros. Fusce in \nvarius elit, quis ullamcorper arcu. \nSuspendisse ligula purus, molestie non \nnunc vitae, consectetur vestibulum sem.',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await launchUrl(Uri(
                                                      scheme: 'mailto',
                                                      path:
                                                      'ducminh.vu@g.northernacademy.org',
                                                      query: {
                                                        'subject':
                                                        'More Information',
                                                        'body': 'Hello Richard, ...',
                                                      }
                                                          .entries
                                                          .map((MapEntry<String,
                                                          String>
                                                      e) =>
                                                      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                          .join('&')));
                                                },
                                                text: 'CONTACT NOW',
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: const Color(0xFFEEB609),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.asset(
                                              'images/Angel.png',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.43,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.25,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: Text(
                                                'ANGEL YUAN',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'NORD',
                                                          color: Colors.black,
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'HEAD OF MARKETING DEPT.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'NORD',
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                  fontStyle: FontStyle.italic,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                          const SizedBox(
                                            width: 280.0,
                                            child: Divider(
                                              height: 20.0,
                                              thickness: 1.0,
                                              color: Color(0xCC000000),
                                            ),
                                          ),
                                          Text(
                                            'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. In a quam tellus. Mauris \nrisus dui, efficitur sit amet eros ut, \nultricies cursus felis. Phasellus egestas \nfinibus nisi, id vehicula arcu sodales in. \nPellentesque vitae efficitur eros. Fusce in \nvarius elit, quis ullamcorper arcu. \nSuspendisse ligula purus, molestie non \nnunc vitae, consectetur vestibulum sem.\n\nLorem ipsum dolor sit amet, consectetur \nadipiscing elit. In a quam tellus. Mauris \nrisus dui, efficitur sit amet eros ut, \nultricies cursus felis. Phasellus egestas \nfinibus nisi, id vehicula arcu sodales in. \nPellentesque vitae efficitur eros. Fusce in \nvarius elit, quis ullamcorper arcu. \nSuspendisse ligula purus, molestie non \nnunc vitae, consectetur vestibulum sem.',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                await launchUrl(Uri(
                                                    scheme: 'mailto',
                                                    path:
                                                    'angel.yuan@g.northernacademy.org',
                                                    query: {
                                                      'subject':
                                                      'More Information',
                                                      'body': 'Hello Angel, ...',
                                                    }
                                                        .entries
                                                        .map((MapEntry<String,
                                                        String>
                                                    e) =>
                                                    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                        .join('&')));
                                              },
                                                text: 'CONTACT NOW',
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: const Color(0xFFEEB609),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                  carouselController:
                                      _model.carouselController ??=
                                          CarouselController(),
                                  options: CarouselOptions(
                                    initialPage: 1,
                                    viewportFraction: 0.5,
                                    disableCenter: true,
                                    enlargeCenterPage: true,
                                    enlargeFactor: 0.25,
                                    enableInfiniteScroll: true,
                                    scrollDirection: Axis.horizontal,
                                    autoPlay: false,
                                    onPageChanged: (index, _) =>
                                        _model.carouselCurrentIndex = index,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
