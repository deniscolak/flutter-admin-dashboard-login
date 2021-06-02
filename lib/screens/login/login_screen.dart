import 'package:flutter/material.dart';
import 'package:smart_dashboard_admin_ui/core/constants/color_constants.dart';
import 'package:smart_dashboard_admin_ui/core/widgets/app_button_widget.dart';
import 'package:smart_dashboard_admin_ui/core/widgets/input_widget.dart';
import 'package:smart_dashboard_admin_ui/screens/login/components/slider_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  var tweenLeft = Tween<Offset>(begin: Offset(2, 0), end: Offset(0, 0))
      .chain(CurveTween(curve: Curves.ease));
  var tweenRight = Tween<Offset>(begin: Offset(0, 0), end: Offset(2, 0))
      .chain(CurveTween(curve: Curves.ease));

  AnimationController? _animationController;
  bool isChecked = false;

  var _isMoved = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750));
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 2,
                color: Colors.white,
                child: SliderWidget(),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 2,
                color: kBackgroundColor,
                child: Center(
                  child: Card(
                    color: kBackgroundColor,
                    child: Container(
                        padding: EdgeInsets.all(40),
                        width: MediaQuery.of(context).size.width / 3.6,
                        height: MediaQuery.of(context).size.height / 1.2,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 60,
                            ),
                            Image.asset(
                              "assets/logo/logo_icon.png",
                              scale: 3,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Flexible(
                              child: Stack(
                                children: [
                                  SlideTransition(
                                    position:
                                        _animationController!.drive(tweenRight),
                                    child: Stack(
                                      children: [
                                        _registerScreen(context),
                                      ],
                                    ),
                                  ),
                                  SlideTransition(
                                    position:
                                        _animationController!.drive(tweenLeft),
                                    child: Stack(
                                      children: [
                                        _loginScreen(context),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container _registerScreen(BuildContext context) {
    return Container(
        width: double.infinity,
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InputWidget(
                keyboardType: TextInputType.emailAddress,
                onSaved: (String? value) {},
                onChanged: (String? value) {},
                validator: (String? value) {},
                topLabel: "Name",
                hintText: "Enter Name",
              ),
              InputWidget(
                keyboardType: TextInputType.emailAddress,
                onSaved: (String? value) {},
                onChanged: (String? value) {},
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Please enter valid e-mail.'
                      : null;
                },
                topLabel: "E-mail",
                hintText: "Enter E-mail",
              ),
              SizedBox(
                height: 8,
              ),
              InputWidget(
                obscureText: true,
                onSaved: (String? uPassword) {},
                onChanged: (String? uPassword) {},
                topLabel: "Password",
                hintText: "Enter Password",
              ),
              SizedBox(
                height: 16,
              ),
              AppButton(
                type: ButtonType.PRIMARY,
                text: "Sign Up",
                onPressed: () {},
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Text('Remember me')
                    ],
                  ),
                  Text(
                    'Forget Password',
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Wrap(
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    SizedBox(
                      width: 8,
                    ),
                    TextButton(
                      onPressed: () {
                        if (_isMoved) {
                          _animationController!.reverse();
                        } else {
                          _animationController!.forward();
                        }
                        _isMoved = !_isMoved;
                      },
                      child: Text('Sign in'),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Container _loginScreen(BuildContext context) {
    return Container(
        width: double.infinity,
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InputWidget(
                keyboardType: TextInputType.emailAddress,
                onSaved: (String? value) {},
                onChanged: (String? value) {},
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Please enter valid e-mail.'
                      : null;
                },
                topLabel: "E-mail",
                hintText: "Enter E-mail",
              ),
              SizedBox(
                height: 8,
              ),
              InputWidget(
                obscureText: true,
                onSaved: (String? uPassword) {},
                onChanged: (String? uPassword) {},
                topLabel: "Password",
                hintText: "Enter Password",
              ),
              SizedBox(
                height: 16,
              ),
              AppButton(
                type: ButtonType.PRIMARY,
                text: "Sign In",
                onPressed: () {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Text('Remember me')
                    ],
                  ),
                  Text(
                    'Forget Password',
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Wrap(
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text("Don't have an account yet?"),
                    SizedBox(
                      width: 8,
                    ),
                    TextButton(
                      onPressed: () {
                        if (_isMoved) {
                          _animationController!.reverse();
                        } else {
                          _animationController!.forward();
                        }
                        _isMoved = !_isMoved;
                      },
                      child: Text('Sign up'),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
