part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData(primarySwatch: accentColor)));

    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToSplashPage());

        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 70,
                    child: Image.asset("assets/logo.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 70, bottom: 40),
                    child: Text(
                      "Welcome Back,\nExplorer!",
                      style: blackTextFont.copyWith(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 16
                    ,
                  ),
                  TextField(
                    onChanged: (text) {
                      setState(() {
                        isEmailValid = EmailValidator.validate(text);
                      });
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Email Address",
                        hintText: "Email Address"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    onChanged: (text) {
                      setState(() {
                        isPasswordValid = text.length >= 6;
                      });
                    },
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Password",
                        hintText: "Password"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Forget Password",
                          style: greyTextFont.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Get Now",
                          style: purpleTextFont.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(top: 40, bottom: 30),
                      child: isSigningIn 
                      ? SpinKitFadingCircle(
                        color: mainColor,
                      ) : FloatingActionButton(
                          elevation: 0,
                          child: Icon(
                            Icons.arrow_forward,
                            color: isEmailValid && isPasswordValid
                                ? Colors.white
                                : Color(0xffbebebe),
                          ),
                          backgroundColor: isEmailValid && isPasswordValid
                              ? mainColor
                              : Color(0xffe4e4e4),
                          onPressed: isEmailValid && isPasswordValid
                              ? () async {
                                  setState(() {
                                    isSigningIn = true;
                                  });

                                  SignInSignUpResult result =
                                      await AuthServices.signIn(
                                          emailController.text,
                                          passwordController.text);

                                  if (result.user == null) {
                                    setState(() {
                                      isSigningIn = false;
                                    });
                                    Flushbar(
                                      duration: Duration(seconds: 4),
                                      flushbarPosition: FlushbarPosition.TOP,
                                      backgroundColor: Color(0xffff5c83),
                                      message: result.message,
                                    )..show(context);
                                  }
                                }
                              : null),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Start fresh now ",
                        style:
                            greyTextFont.copyWith(fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Sign Up",
                        style: purpleTextFont,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
