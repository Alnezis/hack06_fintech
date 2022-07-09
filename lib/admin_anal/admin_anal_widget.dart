import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../welcome_page/welcome_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AdminAnalWidget extends StatefulWidget {
  const AdminAnalWidget({Key key}) : super(key: key);

  @override
  _AdminAnalWidgetState createState() => _AdminAnalWidgetState();
}

class _AdminAnalWidgetState extends State<AdminAnalWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: ProductRatingCall.call(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitRotatingPlain(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        final adminAnalProductRatingResponse = snapshot.data;
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
                color: Colors.white,
                size: 30,
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomePageWidget(),
                  ),
                );
              },
            ),
            title: Text(
              'Аналитика',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontSize: 22,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [],
                  ),
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          TabBar(
                            isScrollable: true,
                            labelColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            labelStyle: FlutterFlowTheme.of(context).bodyText1,
                            indicatorColor:
                                FlutterFlowTheme.of(context).secondaryColor,
                            tabs: [
                              Tab(
                                text: 'По товарным группам',
                              ),
                              Tab(
                                text: 'По сумме интерчейнджа',
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 25, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 25, 20, 0),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 25, 0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      1,
                                                  decoration: BoxDecoration(),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final productResults =
                                                          getJsonField(
                                                                (adminAnalProductRatingResponse
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.result[*]''',
                                                              )?.toList() ??
                                                              [];
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            productResults
                                                                .length,
                                                        itemBuilder: (context,
                                                            productResultsIndex) {
                                                          final productResultsItem =
                                                              productResults[
                                                                  productResultsIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        10),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          8,
                                                                          0),
                                                                  child:
                                                                      Container(
                                                                    width: 125,
                                                                    height: 35,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0, 0),
                                                                            child:
                                                                                Text(
                                                                              getJsonField(
                                                                                productResultsItem,
                                                                                r'''$..product_name''',
                                                                              ).toString().maybeHandleOverflow(
                                                                                    maxChars: 10,
                                                                                    replacement: '…',
                                                                                  ),
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Roboto',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 15,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          8,
                                                                          0),
                                                                  child:
                                                                      LinearPercentIndicator(
                                                                    percent:
                                                                        0.5,
                                                                    width: 80,
                                                                    lineHeight:
                                                                        20,
                                                                    animation:
                                                                        true,
                                                                    progressColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryColor,
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                    center:
                                                                        Text(
                                                                      getJsonField(
                                                                        productResultsItem,
                                                                        r'''$..psa''',
                                                                      )
                                                                          .toString()
                                                                          .maybeHandleOverflow(
                                                                            maxChars:
                                                                                5,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                18,
                                                                          ),
                                                                    ),
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                  ),
                                                                ),
                                                                LinearPercentIndicator(
                                                                  percent: 0.5,
                                                                  width: 80,
                                                                  lineHeight:
                                                                      20,
                                                                  animation:
                                                                      true,
                                                                  progressColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryColor,
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                  center: Text(
                                                                    getJsonField(
                                                                      productResultsItem,
                                                                      r'''$..psb''',
                                                                    )
                                                                        .toString()
                                                                        .maybeHandleOverflow(
                                                                          maxChars:
                                                                              5,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              18,
                                                                        ),
                                                                  ),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
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
                                Text(
                                  'Tab View 2',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Roboto',
                                        fontSize: 32,
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
          ),
        );
      },
    );
  }
}
