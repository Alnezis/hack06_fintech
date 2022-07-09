import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../welcome_page/welcome_page_widget.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientAnalWidget extends StatefulWidget {
  const ClientAnalWidget({Key key}) : super(key: key);

  @override
  _ClientAnalWidgetState createState() => _ClientAnalWidgetState();
}

class _ClientAnalWidgetState extends State<ClientAnalWidget> {
  ApiCallResponse checkss;
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: GETChecksCall.call(
        userId: valueOrDefault<String>(
          textController.text,
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
              child: SpinKitRotatingPlain(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        final clientAnalGETChecksResponse = snapshot.data;
        var white = Color(0xFFFFFFFF);
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
              'Клиенты',
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
                                text: 'Чеки клиентов',
                              ),
                              Tab(
                                text: 'Аналитика по клиентам',
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 5, 5, 0),
                                      child: TextFormField(
                                        controller: textController,
                                        onFieldSubmitted: (_) async {
                                          checkss = await GETChecksCall.call(
                                            userId: valueOrDefault<String>(
                                              textController.text,
                                              '0',
                                            ),
                                          );

                                          setState(() {});
                                        },
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'Id пользователя...',
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .white = Color(0xFFFFFFFF),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .white = Color(0xFFFFFFFF),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          prefixIcon: Icon(
                                            Icons.person_search_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 25,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 50, 20, 0),
                                      child: Builder(
                                        builder: (context) {
                                          final checks = getJsonField(
                                                (clientAnalGETChecksResponse
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.result[*]''',
                                              )?.toList() ??
                                              [];
                                          return SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: List.generate(
                                                  checks.length, (checksIndex) {
                                                final checksItem =
                                                    checks[checksIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 20, 8),
                                                  child: FutureBuilder<
                                                      ApiCallResponse>(
                                                    future:
                                                        CheckProductsCall.call(
                                                      userId:
                                                          textController.text,
                                                      checkId: getJsonField(
                                                        checksItem,
                                                        r'''$..check_id''',
                                                      ).toString(),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50,
                                                            height: 50,
                                                            child:
                                                                SpinKitRotatingPlain(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 50,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final expandableCheckProductsResponse =
                                                          snapshot.data;
                                                      return Container(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
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
                                                                          5,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8,
                                                                            0,
                                                                            20,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            checksItem,
                                                                            r'''$..merchant_name''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        getJsonField(
                                                                          checksItem,
                                                                          r'''$..sum''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Montserrat',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            collapsed: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          0,
                                                                          8,
                                                                          0),
                                                              child: Container(
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                height: 40,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          8,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    getJsonField(
                                                                      checksItem,
                                                                      r'''$..mcc''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            expanded: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          0,
                                                                          8,
                                                                          0),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final products =
                                                                      getJsonField(
                                                                            (expandableCheckProductsResponse?.jsonBody ??
                                                                                ''),
                                                                            r'''$.result[*]''',
                                                                          )?.toList() ??
                                                                          [];
                                                                  return ListView
                                                                      .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    primary:
                                                                        false,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        products
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            productsIndex) {
                                                                      final productsItem =
                                                                          products[
                                                                              productsIndex];
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            2),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
                                                                              child: Text(
                                                                                valueOrDefault<String>(
                                                                                  getJsonField(
                                                                                    productsItem,
                                                                                    r'''$.product_name''',
                                                                                  ).toString(),
                                                                                  '0',
                                                                                ),
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                getJsonField(
                                                                                  productsItem,
                                                                                  r'''$.product_cost''',
                                                                                ).toString(),
                                                                                '0',
                                                                              ),
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            theme:
                                                                ExpandableThemeData(
                                                              tapHeaderToExpand:
                                                                  false,
                                                              tapBodyToExpand:
                                                                  true,
                                                              tapBodyToCollapse:
                                                                  true,
                                                              headerAlignment:
                                                                  ExpandablePanelHeaderAlignment
                                                                      .center,
                                                              hasIcon: true,
                                                              expandIcon:
                                                                  FontAwesomeIcons
                                                                      .receipt,
                                                              collapseIcon:
                                                                  FontAwesomeIcons
                                                                      .angleUp,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              }),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
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
