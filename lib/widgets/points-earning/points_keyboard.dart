import 'package:couvee/company_colors.dart';
import 'package:couvee/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PointsKeyboard extends StatefulWidget {
  @override
  _PointsKeyboardState createState() => _PointsKeyboardState();
}

class _PointsKeyboardState extends State<PointsKeyboard> {
  final _rpController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void handleChange(String text) {
    setState(() {
      _rpController.text = _rpController.text + text;
    });
  }

  void handleDelete() {
    if (_rpController.text.length != null && _rpController.text.length > 0)
      setState(() {
        _rpController.text =
            _rpController.text.substring(0, _rpController.text.length - 1);
      });
  }

  Widget keyboardButtonWrapper(child, value) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (value == 'backspace') {
            handleDelete();
          } else {
            handleChange(value.toString());
          }
        },
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35.0),
        ),
        padding: EdgeInsets.only(
          top: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 3,
              child: PointsKeyboardHeader(controller: _rpController),
            ),
            Flexible(
              flex: 7,
              child: Container(
                decoration: new BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                      blurRadius: 25.0,
                      spreadRadius: 5.0,
                      offset: Offset(
                        15.0,
                        15.0,
                      ),
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                      flex: 8,
                      child: GridView.count(
                        childAspectRatio: 1.4,
                        crossAxisCount: 3,
                        children: List.generate(
                          12,
                          (index) {
                            if (index == 9) {
                              return keyboardButtonWrapper(
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "0",
                                    style: TextStyle(fontSize: 36.0),
                                  ),
                                ),
                                "0",
                              );
                            }
                            if (index == 11) {
                              return keyboardButtonWrapper(
                                  Container(
                                    alignment: Alignment.center,
                                    child: Center(
                                      child: Icon(
                                        FontAwesomeIcons.backspace,
                                      ),
                                    ),
                                  ),
                                  "backspace");
                            }
                            if (index == 10) {
                              return keyboardButtonWrapper(
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "000",
                                      style: TextStyle(fontSize: 36.0),
                                    ),
                                  ),
                                  '000');
                            }
                            return keyboardButtonWrapper(
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "${index + 1}",
                                  style: TextStyle(fontSize: 36.0),
                                ),
                              ),
                              index + 1,
                            );
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 21.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: FlatButton(
                            color: CompanyColors.brown[400],
                            onPressed: () {
                              print("Send");
                            },
                            child: Text(
                              "KONFIRMASI",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
