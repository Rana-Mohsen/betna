import 'package:betna/constants.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:betna/core/utils/functions/snack_bar.dart';
import 'package:betna/core/utils/validators.dart';
import 'package:betna/core/widgets/bottom_navigation_bar.dart';
import 'package:betna/core/widgets/custom_button.dart';
import 'package:betna/view_models/auth/auth_bloc.dart';
import 'package:betna/views/auth/signup_view.dart';
import 'package:betna/views/auth/widgets/auth_textfield.dart';
import 'package:betna/views/auth/widgets/forgot_password.dart';
import 'package:betna/views/auth/widgets/image_with_text.dart';
import 'package:betna/views/auth/widgets/other_login_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool visible = true;
  final GlobalKey<FormState> _formKey = GlobalKey();

  String? emailOrPhone;
  String? password;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoginFailure) {
          snackBarMessage(context, state.msg);
        } else if (state is AuthLoginSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const BottomNavigation()),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AuthLoginLoading,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: 100.h,
              child: Form(
                key: _formKey,
                child: Column(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageWithText(
                      imagePath: "assets/images/login.png",
                      text: "Log in your account",
                    ),
                    AuthTextField(
                      hintText: "Email or Phone",
                      validator: (_)=> null, //Validators.emailOrPhoneValidator,
                      onChange: (value) {
                        emailOrPhone = value;
                      },
                    ),
                    AuthTextField(
                      hintText: "Password",
                      validator: Validators.passwordValidator,
                      obscure: visible,
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: IconButton(
                          icon:
                              visible
                                  ? const Icon(Icons.remove_red_eye_outlined)
                                  : const Icon(Icons.visibility_off_outlined),
                          color: kGrayColor,
                          iconSize: 20,
                          onPressed: () {
                            setState(() {
                              visible = !visible;
                            });
                          },
                        ),
                      ),
                      onChange: (value) {
                        password = value;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPassword(),
                              ),
                            ),
                        child: Text(
                          "Forget Password?",
                          style: FontStyles.textStyle16.copyWith(
                            fontWeight: FontWeight.w500,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    CustomButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context).add(
                            AuthLoginEvent({
                              "name": emailOrPhone,
                              "password": password,
                              // "email": emailOrPhone,
                              // "phone": emailOrPhone,
                              // "address": "",
                            }),
                          );
                        }
                      },
                      text: "Log in",
                    ),
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.black)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("Or", style: FontStyles.textStyle16),
                        ),
                        Expanded(child: Divider(color: Colors.black)),
                      ],
                    ),
                    OtherLoginMethods(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account? ",
                          style: FontStyles.textStyle16,
                        ),
                        GestureDetector(
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupView(),
                                ),
                              ),
                          child: Text(
                            "Sign up",
                            style: FontStyles.textStyle18.copyWith(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
