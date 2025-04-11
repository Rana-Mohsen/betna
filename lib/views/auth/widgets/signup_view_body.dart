import 'package:betna/constants.dart';
import 'package:betna/core/Local_Storage/user_info.dart';
import 'package:betna/core/utils/app_routes.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:betna/core/utils/functions/snack_bar.dart';
import 'package:betna/core/utils/validators.dart';
import 'package:betna/core/widgets/custom_button.dart';
import 'package:betna/models/user_model.dart';
import 'package:betna/view_models/auth/auth_bloc.dart';
import 'package:betna/views/auth/widgets/auth_textfield.dart';
import 'package:betna/views/auth/widgets/image_with_text.dart';
import 'package:betna/views/auth/widgets/other_login_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  bool visible = true;
  final GlobalKey<FormState> _formKey = GlobalKey();

  String? emailOrPhone;
  String? name;
  String? password;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthRegisterFailure) {
          snackBarMessage(context, state.msg);
        } else if (state is AuthRegisterSuccess) {
          GoRouter.of(context).pushReplacement(AppRoutes.kBottomNavigation);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AuthRegisterLoading,
          child: SingleChildScrollView(
            padding: kMainPadding,
            child: SizedBox(
              height: 100.h,
              child: Form(
                key: _formKey,
                child: Column(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageWithText(
                      imagePath: "assets/images/signup.png",
                      text: "Create new account",
                    ),
                    AuthTextField(
                      hintText: "Full name",
                      validator: (_) => null,
                      onChange: (value) {
                        name = value;
                      },
                    ),
                    AuthTextField(
                      hintText: "Email or Phone",
                      validator: Validators.emailOrPhoneValidator,
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
                    CustomButton(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context).add(
                            AuthRegisterEvent({
                              "name": name,
                              "password": password,
                              "email": emailOrPhone,
                              "phone": "+1234567890",
                              "address": "2Street, mahala, gharbia",
                            }),
                          );
                          UserModel user = UserModel(
                            name: name!,
                            email: emailOrPhone!,
                          );
                         await UserInfo.saveUserInfoSharedPreference(user);
                        }
                      },
                      text: "Sign up",
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
                          "Already have an account? ",
                          style: FontStyles.textStyle16,
                        ),
                        GestureDetector(
                          onTap:
                              () => GoRouter.of(
                                context,
                              ).pushReplacement(AppRoutes.kLoginView),
                          child: Text(
                            "Log in",
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
