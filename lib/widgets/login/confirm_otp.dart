// Core packages.
import 'package:flutter/material.dart';

// Extension packages.
import 'package:hive/hive.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

// Couvee packages.
import 'package:couvee/components/pin-form-field/pin_code_field.dart';
import 'package:couvee/components/flutter-loading-button/flutter_loading_button.dart';
import 'package:couvee/company_colors.dart';

// Couvee dialogs.
import 'package:couvee/dialogs/error_dialog.dart';
import 'package:couvee/dialogs/success_dialog.dart';

// Couvee interfaces.
import 'package:couvee/interfaces/login/request_otp_interface.dart';

// Couve responses.
import 'package:couvee/responses/basic_response.dart';
import 'package:couvee/responses/auth_response.dart';

// Couvee services.
import 'package:couvee/services/auth_service.dart';

// Couvee screens.
import 'package:couvee/screens/main_screen.dart';

class ConfirmOtp extends StatefulWidget {
  final RequestOtpInterface requestOtpData;

  ConfirmOtp({Key key, @required this.requestOtpData}) : super(key: key);

  _ConfirmOtp createState() => _ConfirmOtp();
}

class _ConfirmOtp extends State<ConfirmOtp> {
  final _formKey = GlobalKey<FormState>();
  final authService = AuthService();

  AuthResponse loginResponse;
  BasicResponse sendOtpResponse;
  BasicResponse resendOtpResponse;

  final PinDecoration _pinDecoration = UnderlineDecoration(
    color: CompanyColors.grey[100],
    enteredColor: CompanyColors.grey,
  );

  final otpFieldController = TextEditingController();

  _onConfirmOtp() async {
    if (_formKey.currentState.validate()) {
      loginResponse = await authService.login(
        widget.requestOtpData.phone,
        otpFieldController.text,
      );

      return () {
        if (loginResponse.success) {
          final userBox = Hive.box('user');

          print(loginResponse.data.email);

          userBox.putAll({
            'token': loginResponse.data.token,
            'id': loginResponse.data.id,
            'email': loginResponse.data.email,
            'firstName': loginResponse.data.firstName,
            'lastName': loginResponse.data.lastName,
            'displayName': loginResponse.data.displayName,
            'birthday': loginResponse.data.birthday,
            'phone': loginResponse.data.phone,
            'pin': loginResponse.data.pin,
          });

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(),
            ),
          );
        } else {
          ErrorDialog.show(
            context,
            loginResponse.message,
          );
        }
      };
    } else {
      print("Field(s) invalid.");
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
          'Masukkan Kode OTP',
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 34,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                margin: EdgeInsets.only(bottom: 27.0),
                child: Text(
                  'Masukkan kode OTP yang telah kami kirim ke nomor ${widget.requestOtpData.phone}. Kode akan anda terima dalam waktu +/- 15 detik.',
                  style: TextStyle(
                    color: CompanyColors.grey,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 60,
                ),
                margin: EdgeInsets.only(bottom: 42.0),
                child: PinCodeFormField(
                  controller: otpFieldController,
                  pinLength: 4,
                  decoration: _pinDecoration,
                  autoFocus: true,
                  textInputAction: TextInputAction.go,
                  onEditingComplete: () async {
                    FocusScope.of(context).nextFocus();
                    return VoidCallback;
                  },
                  onSubmitted: (pin) {
                    debugPrint('PinCodeField onSubmitted called with pin:$pin');
                  },
                  validator: Validators.required("Masukkan kode OTP"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: LoadingButton(
                    defaultWidget: const Text(
                      'Konfirmasi Kode OTP',
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
                    onPressed: _onConfirmOtp,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: LoadingButton(
                  type: LoadingButtonType.Flat,
                  defaultWidget: const Text(
                    'Kirim ulang kode',
                    style: TextStyle(
                      color: CompanyColors.brown,
                      fontSize: 12,
                    ),
                  ),
                  loadingWidget: const CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.brown),
                  ),
                  height: 55.0,
                  borderRadius: 10.0,
                  animate: false,
                  onPressed: () async {
                    resendOtpResponse = await authService.sendOtp(
                      widget.requestOtpData.phone,
                      'login',
                      'resend',
                    );

                    return () {
                      if (resendOtpResponse.success) {
                        SuccessDialog.show(
                          context,
                          resendOtpResponse.message,
                        );
                      } else {
                        ErrorDialog.show(
                          context,
                          resendOtpResponse.message,
                        );
                      }
                    };
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
