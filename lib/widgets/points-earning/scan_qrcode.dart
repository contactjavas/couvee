// Core packages.
import 'package:couvee/company_colors.dart';
import 'package:couvee/elements/textured_wall.dart';
import 'package:couvee/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// Extension packages.

// Couvee packages.
import 'package:couvee/components/qr_code_scan/qr_code_scan.dart';
import 'package:couvee/components/qr_code_scan/qr_scanner_overlay_shape.dart';

class ScanQrcode extends StatefulWidget {
  const ScanQrcode({
    Key key,
  }) : super(key: key);

  _ScanQrcode createState() => _ScanQrcode();
}

class _ScanQrcode extends State<ScanQrcode> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = "";
  QRViewController controller;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  double screenWidth;
  double screenHeight;
  double stepItemSize;
  AppBar appBar;

  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    stepItemSize = (screenWidth / 3) - 27.0;

    appBar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: Padding(
        padding: EdgeInsets.symmetric(vertical: 9.0),
        child: RawMaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Icon(
            Icons.arrow_back,
            size: 16.0,
          ),
          shape: new CircleBorder(),
          elevation: 0.0,
          fillColor: Colors.white,
        ),
      ),
      centerTitle: true,
      title: Text(
        'Scan QRCode dari Barista',
      ),
    );

    return Stack(
      children: <Widget>[
        TexturedWall(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: appBar,
          key: _scaffoldKey,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Hi"),
                  // QRView(
                  //   key: qrKey,
                  //   overlay: QrScannerOverlayShape(
                  //     borderColor: CompanyColors.brown,
                  //     borderRadius: 10,
                  //     borderLength: 20,
                  //     borderWidth: 10,
                  //     cutOutSize: 280.0,
                  //     cutOutTop: appBar.preferredSize.height +
                  //         MediaQuery.of(context).padding.top,
                  //   ),
                  //   onQRViewCreated: _onQRViewCreated,
                  // ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.only(
                    top: stepItemSize / 6,
                    right: 25,
                    left: 25,
                  ),
                  color: CompanyColors.inactiveTabColor[200],
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          bottom: stepItemSize / 5,
                        ),
                        child: Text(
                          "Langkah- langkah penambahan point:",
                          style: TextStyle(
                            color: CompanyColors.lightGrey,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // _scaffoldKey.currentState.showBottomSheet<void>(
                          //   (BuildContext context) {
                          //     return PointsKeyboard();
                          //   },
                          // );
                          // _scaffoldKey.currentState.showBottomSheet<void>(
                          //     (context) => WaitingTransfer());
                          _scaffoldKey.currentState.showBottomSheet<void>(
                            (context) => ConfirmTransfer(),
                          );
                        },
                        child: EarningSteps(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
