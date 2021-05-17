import 'package:flutter/material.dart';
import '../constants.dart';
import '../home/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  var _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Builder(
      builder: (context) => Container(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.08, horizontal: size.width * 0.05),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo.png',
                    width: size.width * 0.8,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "برجاء ادخال حسابك";
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              controller: _controller,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () => _controller.clear(),
                                    icon: Icon(Icons.clear),
                                  ),
                                  prefixIcon: Icon(Icons.email_outlined),
                                  labelText: 'الحساب الجامعي',
                                  hintText: 'ادخل الحساب',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(28),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      gapPadding: 10),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(28),
                                      borderSide: BorderSide(color: uprimary),
                                      gapPadding: 10))),
                          SizedBox(height: 30),
                          TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "برجاء ادخال كلمة المرور";
                                }
                              },
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () => _toggle(),
                                      icon: _obscureText
                                          ? Icon(Icons.visibility)
                                          : Icon(Icons.visibility_off)),
                                  prefixIcon: Icon(Icons.lock_outline),
                                  labelText: 'كلمة المرور',
                                  hintText: 'ادخل كلمة المرور',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(28),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      gapPadding: 10),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(28),
                                      borderSide: BorderSide(color: uprimary),
                                      gapPadding: 10))),
                        ],
                      )),
                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1)),
                      ),
                      onPressed: () {
                        _formKey.currentState.validate()
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              )
                            : Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('حدث خطأ'),
                                backgroundColor: Colors.red));
                      },
                      padding: EdgeInsets.all(15.0),
                      color: uprimary,
                      textColor: Colors.white,
                      child:
                          Text("تسجيل الدخول", style: TextStyle(fontSize: 15)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
