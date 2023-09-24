import 'package:flutter/material.dart';
import 'package:future_code_test/view/screens/signup_screen.dart';
import 'package:future_code_test/view/screens/vehicles_screen.dart';
import 'package:future_code_test/view/widgets/my_textfiels.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool obsecure = true;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: SafeArea(
          child: Form(
            key: formKey,
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Image.asset(
                          'assets/images/khdnelogo.png',
                          height: 50,
                        ),
                      ),
                      Text(
                        'تسجيل الدخول',
                        style: GoogleFonts.cairo(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //!phone number
                      Column(
                        children: [
                          MyTextField(
                            hint: 'رقم الهاتف',
                            controller: phoneController,
                            inputType: TextInputType.phone,
                            actionType: TextInputAction.next,
                            validator: (value) {
                              if (value == null || value.length < 10) {
                                return 'ادخل رقم هاتف صحيح';
                              }
                              return null;
                            },
                            prefix: const Icon(
                              Icons.phone,
                              color: Colors.orange,
                              size: 18,
                            ),
                          ),
                          //!password
                          MyTextField(
                            obsecure: obsecure,
                            hint: 'كلمة السر',
                            controller: passwordController,
                            inputType: TextInputType.text,
                            actionType: TextInputAction.done,
                            validator: (value) {
                              if (value == "") {
                                return 'ادخل كلمة مرور';
                              }
                              return null;
                            },
                            prefix: const Icon(
                              Icons.lock,
                              color: Colors.orange,
                              size: 18,
                            ),
                            suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  obsecure = !obsecure;
                                });
                              },
                              icon: Icon(
                                obsecure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                                size: 22,
                              ),
                            ),
                          ),
                          //!forget password
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'هل نسيت كلمة المرور ؟',
                                style: GoogleFonts.cairo(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      //!login button
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          GestureDetector(
                            onTap: () {
                              final isValid = formKey.currentState!.validate();
                              if (!isValid) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('ادخل بيانات صحيحة'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                                return;
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const VehicleScreen(),
                                  ),
                                );
                              }
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: Colors.blue.shade900,
                                ),
                                child: Center(
                                  child: Text(
                                    'تسجيل الدخول',
                                    style: GoogleFonts.cairo(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          //!sign up
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ليس لديك حساب؟  ',
                                style: GoogleFonts.cairo(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'انشاء حساب',
                                  style: GoogleFonts.cairo(
                                    fontSize: 13,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height / 6,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
