import '../backend/api_requests/api_calls.dart';
import '../client_main_page/client_main_page_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class UserUserChecksWidget extends StatefulWidget {
  const UserUserChecksWidget({
    Key key,
    this.userId,
  }) : super(key: key);

  final String userId;

  @override
  _UserUserChecksWidgetState createState() => _UserUserChecksWidgetState();
}

class _UserUserChecksWidgetState extends State<UserUserChecksWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: SummaryUserInMerchantAlluseridCall.call(
        userId: widget.userId,
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
        final userUserChecksSummaryUserInMerchantAlluseridResponse =
            snapshot.data;
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
                    builder: (context) => ClientMainPageWidget(),
                  ),
                );
              },
            ),
            title: Text(
              'Мои покупки',
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
                child: FutureBuilder<ApiCallResponse>(
                  future: GETChecksCall.call(
                    userId: widget.userId,
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
                    final columnGETChecksResponse = snapshot.data;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Магазины',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: Container(
                                  width: 300,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: FlutterFlowTheme.of(context)
                                            .richBlackFOGRA29,
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      final shops = getJsonField(
                                            (userUserChecksSummaryUserInMerchantAlluseridResponse
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$..merchant_name''',
                                          )?.toList() ??
                                          [];
                                      return SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: List.generate(shops.length,
                                              (shopsIndex) {
                                            final shopsItem = shops[shopsIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 5, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                5, 5, 0, 0),
                                                    child: Text(
                                                      'Hello World',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                5, 5, 0, 0),
                                                    child: Text(
                                                      '${valueOrDefault<String>(
                                                        (userUserChecksSummaryUserInMerchantAlluseridResponse
                                                                ?.jsonBody ??
                                                            ''),
                                                        '\$..checks_sum',
                                                      )}₽',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Builder(
                                builder: (context) {
                                  final checks = getJsonField(
                                        (columnGETChecksResponse?.jsonBody ??
                                            ''),
                                        r'''$.result[*]''',
                                      )?.toList() ??
                                      [];
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(checks.length,
                                        (checksIndex) {
                                      final checksItem = checks[checksIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            25, 0, 25, 0),
                                        child: FutureBuilder<ApiCallResponse>(
                                          future: CheckProductsCall.call(
                                            userId: widget.userId,
                                            checkId: valueOrDefault<String>(
                                              getJsonField(
                                                checksItem,
                                                r'''$..check_id''',
                                              ).toString(),
                                              '0',
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child: SpinKitThreeBounce(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 50,
                                                  ),
                                                ),
                                              );
                                            }
                                            final rowCheckProductsResponse =
                                                snapshot.data;
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 10),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 4,
                                                            color: Color(
                                                                0x34090F13),
                                                            offset:
                                                                Offset(0, 2),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 5,
                                                                    0, 10),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          color:
                                                              Color(0x00000000),
                                                          child:
                                                              ExpandableNotifier(
                                                            initialExpanded:
                                                                false,
                                                            child:
                                                                ExpandablePanel(
                                                              header: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              5,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          checksItem,
                                                                          r'''$..merchant_name''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .title1
                                                                            .override(
                                                                              fontFamily: 'Rubik',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              5,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        '${getJsonField(
                                                                          checksItem,
                                                                          r'''$..sum''',
                                                                        ).toString()}₽',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .title1
                                                                            .override(
                                                                              fontFamily: 'Rubik',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              collapsed:
                                                                  Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            5,
                                                                            5),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  height: 70,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            2,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                                                                              child: Text(
                                                                                'MCC: ${getJsonField(
                                                                                  checksItem,
                                                                                  r'''$..mcc''',
                                                                                ).toString()}',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Rubik',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8, 2, 8, 0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  checksItem,
                                                                                  r'''$..mcc_name''',
                                                                                ).toString().maybeHandleOverflow(
                                                                                      maxChars: 12,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Rubik',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  checksItem,
                                                                                  r'''$..card_type''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Rubik',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              expanded: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final products =
                                                                        getJsonField(
                                                                              (rowCheckProductsResponse?.jsonBody ?? ''),
                                                                              r'''$.result''',
                                                                            )?.toList() ??
                                                                            [];
                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: List.generate(
                                                                          products
                                                                              .length,
                                                                          (productsIndex) {
                                                                        final productsItem =
                                                                            products[productsIndex];
                                                                        return Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  productsItem,
                                                                                  r'''$..product_name''',
                                                                                ).toString().maybeHandleOverflow(
                                                                                      maxChars: 25,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Rubik',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              '${getJsonField(
                                                                                productsItem,
                                                                                r'''$..product_cost''',
                                                                              ).toString()}₽',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Rubik',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      }),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                              theme:
                                                                  ExpandableThemeData(
                                                                tapHeaderToExpand:
                                                                    true,
                                                                tapBodyToExpand:
                                                                    true,
                                                                tapBodyToCollapse:
                                                                    true,
                                                                headerAlignment:
                                                                    ExpandablePanelHeaderAlignment
                                                                        .center,
                                                                hasIcon: true,
                                                                expandIcon: Icons
                                                                    .receipt_long_rounded,
                                                                collapseIcon:
                                                                    Icons
                                                                        .receipt,
                                                                iconSize: 30,
                                                                iconColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
