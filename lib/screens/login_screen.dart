// Core packages.
import 'package:couvee/widgets/login/confirm_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Extension packages.
import 'package:wc_form_validators/wc_form_validators.dart';

// Couvee packages.
import 'package:couvee/components/flutter-loading-button/flutter_loading_button.dart';
import 'package:couvee/company_colors.dart';

// Couvee dialogs.
import 'package:couvee/dialogs/error_dialog.dart';

// Couvee interfaces.
import 'package:couvee/interfaces/login/request_otp_interface.dart';

// Couvee services.
import 'package:couvee/services/auth_service.dart';

// Couvee responses.
import 'package:couvee/responses/basic_response.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final authService = AuthService();
  BasicResponse sendOtpResponse;

  final phoneFieldController = TextEditingController();

  onSendOtp() async {
    if (_formKey.currentState.validate()) {
      sendOtpResponse = await authService.sendOtp(
        phoneFieldController.text,
        'login',
        'send',
      );

      return () {
        if (sendOtpResponse.success) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ConfirmOtp(
                requestOtpData: RequestOtpInterface(
                  phoneFieldController.text,
                ),
              ),
            ),
          );
        } else {
          ErrorDialog.show(
            context,
            sendOtpResponse.message,
          );
        }
      };
    } else {
      return VoidCallback;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        centerTitle: true,
        title: Text(
          'Masuk',
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 34,
        ),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  bottom: 14,
                ),
                child: Text(
                  'Nomor telepon',
                  style: TextStyle(
                    color: CompanyColors.grey,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                ),
                child: TextFormField(
                  controller: phoneFieldController,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                  validator: Validators.required("Masukkan nomor telepon"),
                  decoration: const InputDecoration(
                    helperText: ' ',
                  ),
                  onEditingComplete: () async {
                    FocusScope.of(context).nextFocus();
                    return VoidCallback;
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: LoadingButton(
                  defaultWidget: const Text(
                    'Masuk',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  loadingWidget: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                  height: 55.0,
                  borderRadius: 10.0,
                  animate: false,
                  onPressed: onSendOtp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void dispose() {
    phoneFieldController.dispose();
    super.dispose();
  }
}
