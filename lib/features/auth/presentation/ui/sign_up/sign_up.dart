import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/features/auth/presentation/ui/sign_up/widgets/login_btn.dart';
import '../../../../../core/di/di.dart';
import '../functions/check_valid_email.dart';
import '../../../../../core/router/app_router.dart';
import '../../../../../core/utils/constant/app_assets.dart';
import '../../../../../core/utils/constant/app_constants.dart';
import '../../../../../core/utils/constant/app_strings.dart';
import '../../../../../core/utils/constant/app_typography.dart';
import '../../../../../core/utils/dialogs/back_dialog.dart';
import '../../../../../core/utils/dialogs/error_dialog.dart';
import '../../../../../core/utils/enums/RequestState.dart';
import '../../../../../core/utils/style/app_colors.dart';
import '../../../../../core/utils/ui_components/custom_animation.dart';
import '../../../../../core/utils/ui_components/custom_text_button.dart';
import '../../../../../core/utils/ui_components/loading_dialog.dart';
import '../../../../../core/utils/ui_components/primary_button.dart';
import '../../../domain/entities/credential_model.dart';
import '../../bloc/auth_bloc.dart';
import '../components/auth_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool isEmailCorrect = false;
  bool isNameCorrect = false;
  @override
  Widget build(BuildContext context) {
    return
      WillPopScope(
        onWillPop: () => onBackButtonPressed(context),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: BlocProvider(
                create: (context) => sl<AuthBloc>(),
                child: BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state.authState == RequestState.loading) {
                      showLoading();
                    } else if (state.authState == RequestState.done) {
                      hideLoading();
                      Navigator.pushReplacementNamed(context, Routes.signInRoute);
                    } else if (state.authState == RequestState.error) {
                      hideLoading();
                      onError(context, state.authMessage);
                    }
                  },
                  builder: (context, state) {
                    return Form(
                      key: _formKey,
                      child: FadeAnimation(
                        delay: 1,
                        child: Column(
                          children: [
                            SizedBox(height: 80.h),
                            Center(child: Image.asset(AppAssets.splash,width: 100.w)),
                            SizedBox(height: 30.h),
                            Text(AppStrings.signUp,
                                style: AppTypography.kBold30
                                    .copyWith(color: AppColors.cSecondary)),
                            SizedBox(height: 30.h),
                            AuthField(
                              controller: _emailController,
                              hintText: AppStrings.email,
                              keyboardType: TextInputType.emailAddress,
                              isFieldValidated: isEmailCorrect,
                              onChanged: (value) {
                                setState(() {});
                                isEmailCorrect = validateEmail(value);
                              },
                              validator: (value) {
                                if (!validateEmail(value!)) {
                                  return AppStrings.enterValidEmail;
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: AppConstants.heightBetweenElements),
                            AuthField(
                              hintText: AppStrings.password,
                              controller: _passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              isPasswordField: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppStrings.enterYourPass;
                                } else if (value.length < 6) {
                                  return AppStrings.enterPass6Characters;
                                } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$')
                                    .hasMatch(value)) {
                                  return AppStrings.validPass;
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: AppConstants.heightBetweenElements),
                            AuthField(
                              hintText: AppStrings.passwordConfirm,
                              controller: _confirmPasswordController,
                              keyboardType: TextInputType.visiblePassword,
                              isPasswordField: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppStrings.enterYourPass;
                                } else if (value.length < 6) {
                                  return AppStrings.enterPass6Characters;
                                } else if (_confirmPasswordController.text != _passwordController.text) {
                                  return AppStrings.passwordConfirmError;
                                } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$')
                                    .hasMatch(value)) {
                                  return AppStrings.validPass;
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 30.h),
                            PrimaryButton(
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    CredentialModel credentialModel = CredentialModel(email: _emailController.text.trim(),password: _passwordController.text.trim());
                                    BlocProvider.of<AuthBloc>(context).add(RegisterEvent(credentialModel));
                                  }
                                },
                                text: AppStrings.signUp),
                            SizedBox(height: 30.h),
                            const LoginInBtn()
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      );
  }
}
