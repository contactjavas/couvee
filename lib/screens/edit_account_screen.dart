// Core packages.
import 'package:flutter/material.dart';

// Extension packages.
import 'package:hive/hive.dart';

// Couvee packages.
import '../company_colors.dart';
import 'package:couvee/responses/auth_response.dart';

class EditAccountScreen extends StatefulWidget {
  EditAccountScreen({Key key}) : super(key: key);

  @override
  _EditAccountScreenState createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  double topPadding;

  double horizontalPadding;

  final userBox = Hive.box("user");
  UserData user;

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    user = UserData(
      token: userBox.get("token"),
      id: userBox.get("id"),
      firstName: userBox.get("firstName"),
      lastName: userBox.get("lastName"),
      displayName: userBox.get("displayName"),
      birthday: userBox.get("birthday"),
      phone: userBox.get("phone"),
      pin: userBox.get("pin"),
    );
    _firstNameController.value = TextEditingValue(
      text: user.firstName,
    );
    _lastNameController.value = TextEditingValue(
      text: (user.lastName != null ? user.lastName : ''),
    );
    _emailController.value = TextEditingValue(
      text: (user.email != null ? user.email : user.phone + "@couvee.co.id"),
    );
    _phoneController.value = TextEditingValue(
      text: user.phone,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    topPadding = MediaQuery.of(context).size.height * 0.04;
    horizontalPadding = 20.0;

    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        left: horizontalPadding,
        right: horizontalPadding,
        bottom: 25.0,
      ),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: AccountTextField(
                    controller: _firstNameController,
                    placeholder: "Nama Depan",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: AccountTextField(
                    controller: _lastNameController,
                    placeholder: "Nama Belakang",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: AccountTextField(
                    controller: _emailController,
                    placeholder: "Email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: AccountTextField(
                    controller: _phoneController,
                    placeholder: "Nomor Telepon",
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                color: CompanyColors.brown,
                child: Text(
                  "Simpan",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  print("Save");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountTextField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final TextInputType keyboardType;

  const AccountTextField(
      {Key key, this.controller, this.placeholder, this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:
          (this.keyboardType != null ? this.keyboardType : TextInputType.text),
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 0),
        fillColor: Colors.transparent,
        labelText: placeholder,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: CompanyColors.lightGrey.withOpacity(0.1),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: CompanyColors.brown.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
