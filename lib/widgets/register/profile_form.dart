// Core packages.
import 'package:couvee/widgets/register/confirm_otp.dart';
import 'package:flutter/material.dart';

// Extension packages.
import 'package:intl/intl.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

// Couvee packages.
import 'package:couvee/components/flutter-loading-button/flutter_loading_button.dart';
import 'package:couvee/company_colors.dart';
import 'package:couvee/dialogs/error_dialog.dart';
import 'package:couvee/interfaces/register/account_data_interface.dart';
import 'package:couvee/interfaces/register/profile_data_interface.dart';
import 'package:couvee/services/auth_service.dart';
import 'package:couvee/responses/basic_response.dart';

class ProfileForm extends StatefulWidget {
  final AccountDataInterface accountData;

  ProfileForm({Key key, @required this.accountData}) : super(key: key);

  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final authService = AuthService();
  DateFormat mysqlFormat = DateFormat('yyyy-MM-dd');
  DateFormat humanFormat = DateFormat('dd MMMM yyyy');
  String birthday;
  BasicResponse sendOtpResponse;

  final nameFieldController = TextEditingController();
  final birthdayFieldController = TextEditingController();
  final referrerFieldController = TextEditingController();

  void initState() {
    super.initState();
  }

  Future<DateTime> _pickBirthday(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990),
      firstDate: DateTime(1970),
      lastDate: DateTime(2150),
    );

    if (picked != null) {
      setState(
        () {
          birthday = mysqlFormat.format(picked);
          birthdayFieldController.text = humanFormat.format(picked);
        },
      );
    }

    return picked;
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
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
                        'Langkah 2 / 2',
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
                            widthFactor: 1,
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 14,
                    ),
                    child: Text(
                      'Nama lengkap',
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
                      controller: nameFieldController,
                      validator: Validators.required("Masukkan nama lengkap"),
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
                      'Tanggal lahir',
                      style: TextStyle(
                        color: CompanyColors.grey,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 7,
                    ),
                    child: InkWell(
                      onTap: () {
                        _pickBirthday(context);
                      },
                      child: IgnorePointer(
                        child: TextFormField(
                          controller: birthdayFieldController,
                          validator: Validators.required("Pilih tanggal lahir"),
                          decoration: const InputDecoration(
                            helperText: ' ',
                          ),
                          onEditingComplete: () async {
                            FocusScope.of(context).nextFocus();
                            return VoidCallback;
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 14,
                    ),
                    child: Text(
                      'Kode referral (opsional)',
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
                      controller: referrerFieldController,
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
                          sendOtpResponse = await authService.sendOtp(
                            widget.accountData.phone,
                            'register',
                            'send',
                          );

                          return () {
                            if (sendOtpResponse.success) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ConfirmOtp(
                                    profileData: ProfileDataInterface(
                                      widget.accountData.phone,
                                      widget.accountData.pin,
                                      nameFieldController.text,
                                      birthdayFieldController.text,
                                      referrerFieldController.text,
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
                      },
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

  void dispose() {
    nameFieldController.dispose();
    birthdayFieldController.dispose();
    referrerFieldController.dispose();
    super.dispose();
  }
}
