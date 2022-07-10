import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main_admin2/main_admin2_widget.dart';
import '../merchant_stats/merchant_stats_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminAllMerchantsWidget extends StatefulWidget {
  const AdminAllMerchantsWidget({Key key}) : super(key: key);

  @override
  _AdminAllMerchantsWidgetState createState() =>
      _AdminAllMerchantsWidgetState();
}

class _AdminAllMerchantsWidgetState extends State<AdminAllMerchantsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
                builder: (context) => MainAdmin2Widget(),
              ),
            );
          },
        ),
        title: Text(
          'Партнеры',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).primaryText,
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
          child: FutureBuilder<ApiCallResponse>(
            future: MerchantAllCall.call(),
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
              final columnMerchantAllResponse = snapshot.data;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Builder(
                          builder: (context) {
                            final shops = getJsonField(
                                  (columnMerchantAllResponse?.jsonBody ?? ''),
                                  r'''$.result[*]''',
                                )?.toList() ??
                                [];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children:
                                  List.generate(shops.length, (shopsIndex) {
                                final shopsItem = shops[shopsIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 12, 20, 0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 5,
                                          color: Color(0x3416202A),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 8, 8, 8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  shopsItem,
                                                  r'''$..merchant_name''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily: 'Rubik',
                                                          color:
                                                              Color(0xFF57636C),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Text(
                                                'Оборот: ${getJsonField(
                                                  shopsItem,
                                                  r'''$..sum''',
                                                ).toString()}₽',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText2
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xFF57636C),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                              Text(
                                                'Категория: ${getJsonField(
                                                  shopsItem,
                                                  r'''$..mcc_name''',
                                                ).toString()}'
                                                    .maybeHandleOverflow(
                                                  maxChars: 27,
                                                  replacement: '…',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText2
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xFF57636C),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional(0.9, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          MerchantStatsWidget(
                                                        merchantName:
                                                            getJsonField(
                                                          shopsItem,
                                                          r'''$..merchant_name''',
                                                        ).toString(),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Color(0xFF57636C),
                                                  size: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
    );
  }
}
