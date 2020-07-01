import 'package:flutter/material.dart';

import '../company_colors.dart';

class EditAccountScreen extends StatefulWidget {
  EditAccountScreen({Key key}) : super(key: key);

  @override
  _EditAccountScreenState createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  double topPadding;

  double horizontalPadding;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    topPadding = MediaQuery.of(context).size.height * 0.04;
    horizontalPadding = MediaQuery.of(context).size.width * 0.02;

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
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      labelText: 'Nama Lendkap',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      labelText: 'Email',
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: "+62"),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 8,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            labelText: 'Nomor Telepon',
                          ),
                        ),
                      ),
                    ),
                  ],
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
