import '../admin_user_checks/admin_user_checks_widget.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MerchantStatsCopyWidget extends StatefulWidget {
  const MerchantStatsCopyWidget({
    Key key,
    this.merchantName,
  }) : super(key: key);

  final String merchantName;

  @override
  _MerchantStatsCopyWidgetState createState() =>
      _MerchantStatsCopyWidgetState();
}

class _MerchantStatsCopyWidgetState extends State<MerchantStatsCopyWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 60),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 90),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 170),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: SummaryByMerchantCall.call(
        merchantName: widget.merchantName,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitThreeBounce(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        final merchantStatsCopySummaryByMerchantResponse = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30,
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminUserChecksWidget(),
                  ),
                );
              },
            ),
            title: Text(
              'Кэшбек по клиентам',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.of(context).white,
                    fontSize: 22,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2,
          ),
          backgroundColor: Color(0xFFF7F7F7),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Рекомендации ',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 150,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: ListView(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 0, 12),
                                    child: Container(
                                      width: 140,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        color:
                                            FlutterFlowTheme.of(context).white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Color(0x1F000000),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 12, 12, 12),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 6),
                                              child: Text(
                                                'Кешбек по сопутствующим категориям',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 12, 0, 0),
                                              child: Text(
                                                '4%',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 0, 12),
                                    child: Container(
                                      width: 140,
                                      height: 140,
                                      decoration: BoxDecoration(
                                        color:
                                            FlutterFlowTheme.of(context).white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Color(0x1F000000),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 12, 12, 12),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 6),
                                              child: Text(
                                                'Кешбек по любимой категории',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 12, 0, 0),
                                              child: Text(
                                                '3%',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title1,
                                              ),
                                            ),
                                          ],
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Рекомендации',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 160,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x34090F13),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.payments,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 44,
                                ),
                                Text(
                                  'По суммам интерчейнджа',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Rubik',
                                        color: FlutterFlowTheme.of(context)
                                            .black600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ).animated(
                            [animationsMap['containerOnPageLoadAnimation1']]),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 160,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x34090F13),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.percentage,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 32,
                                ),
                                Text(
                                  'По проценту интерчейнджа в обороте',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ),
                              ],
                            ),
                          ),
                        ).animated(
                            [animationsMap['containerOnPageLoadAnimation2']]),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 160,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x34090F13),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.receipt_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 32,
                                ),
                                Text(
                                  'По среднему чеку',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ),
                              ],
                            ),
                          ),
                        ).animated(
                            [animationsMap['containerOnPageLoadAnimation3']]),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
