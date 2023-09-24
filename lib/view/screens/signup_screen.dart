import 'package:flutter/material.dart';
import 'package:future_code_test/view/screens/add_photo.dart';
import 'package:future_code_test/view/screens/login_screen.dart';
import 'package:future_code_test/view/widgets/mytextfield.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool obsecure = true;

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
                  hasScrollBody: false,
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
                        'انشاء حساب',
                        style: GoogleFonts.cairo(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Column(
                        children: [
                          //!name
                          MyTextField(
                            hint: 'الاسم',
                            controller: nameController,
                            inputType: TextInputType.name,
                            actionType: TextInputAction.next,
                            validator: (value) {
                              if (value == "") {
                                return 'ادخل اسم';
                              }
                              return null;
                            },
                            prefix: const Icon(
                              Icons.person,
                              color: Colors.orange,
                              size: 18,
                            ),
                          ),
                          //!phone number
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
                            actionType: TextInputAction.next,
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
                          //!confirm password
                          MyTextField(
                            obsecure: obsecure,
                            hint: 'كلمة السر',
                            controller: confirmController,
                            inputType: TextInputType.text,
                            actionType: TextInputAction.done,
                            validator: (value) {
                              if (value == "") {
                                return 'ادخل كلمة مرور';
                              }
                              if (value != passwordController.text) {
                                return 'كلمة المرور غير مطابقة';
                              }
                              return null;
                            },
                            prefix: const Icon(
                              Icons.lock,
                              color: Colors.orange,
                              size: 18,
                            ),
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
                                    builder: (context) => const AddPhoto(),
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
                                    'انشاء حساب',
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
                                'لديك حساب؟  ',
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
                                      builder: (context) => LoginScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'تسجيل الدخول',
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: GoogleFonts.cairo(color: Colors.black),
                            children: [
                              TextSpan(text: 'متابعتك تعني موافقتك على '),
                              TextSpan(
                                text: 'الشروط والاحكام وسياسة الخصوصية',
                                style: GoogleFonts.cairo(
                                  color: Colors.orange,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
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
