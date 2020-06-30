// Core packages.
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
import 'package:couvee/interfaces/register/account_data_interface.dart';

// Couvee screens.
import 'package:couvee/screens/register/profile_form.dart';

// Couvee services.
import 'package:couvee/services/auth_service.dart';

// Couvee responses.
import 'package:couvee/responses/basic_response.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final authService = AuthService();
  BasicResponse accountAvailabilityResponse;

  final phoneFieldController = TextEditingController();
  final pinFieldController = TextEditingController();

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
          'Buat Akun',
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30.0),
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Langkah 1 / 2',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: CompanyColors.grey),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Stack(
                    children: <Widget>[
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Container(
                          height: 3,
                          color: CompanyColors.brown[100],
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.5,
                        child: Container(
                          height: 3,
                          color: CompanyColors.brown,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
                  bottom: 7,
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
              Container(
                margin: EdgeInsets.only(
                  bottom: 14,
                ),
                child: Text(
                  '6 Digit PIN',
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
                  controller: pinFieldController,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                  validator: Validators.compose(
                    [
                      Validators.required("Masukkan 6 digit pin"),
                      Validators.minLength(6, 'Pin harus berjumlah 6 digit'),
                      Validators.maxLength(
                          6, 'Maximal jumlah pin harus 6 digit'),
                    ],
                  ),
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
                    'Lanjut',
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
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      accountAvailabilityResponse = await authService
                          .checkAccountAvailability(phoneFieldController.text);

                      return () {
                        if (accountAvailabilityResponse.success) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileForm(
                                accountData: AccountDataInterface(
                                  phoneFieldController.text,
                                  pinFieldController.text,
                                ),
                              ),
                            ),
                          );
                        } else {
                          ErrorDialog.show(
                            context,
                            accountAvailabilityResponse.message,
                          );
                        }
                      };
                    } else {
                      return VoidCallback;
                    }
                  },
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
    pinFieldController.dispose();
    super.dispose();
  }
}
