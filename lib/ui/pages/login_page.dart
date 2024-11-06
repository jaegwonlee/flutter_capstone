import 'package:exam1/utils/http/models/response.dart';
import 'package:exam1/ui/pages/signup_page.dart';
import 'package:exam1/ui/pages/id_find.dart';
import 'package:exam1/ui/pages/pw_find.dart';
import 'package:exam1/utils/http/user.dart';
import 'package:exam1/ui/pages/home.dart';
import 'package:exam1/utils/dialog.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // 위쪽으로 정렬
            children: [
              const SizedBox(height: 20), // 위쪽 여백 추가
              Image.asset(
                'assets/images/logo.png',
                height: 300,
              ),
              const SizedBox(height: 50),
              TextField(
                controller: _loginController,
                decoration: InputDecoration(
                  hintText: 'login',
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'password',
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  TestLoginModel result = await login(
                      _loginController.text, _passwordController.text);
                  String resultTitle = "";
                  String resultContent = "";
                  bool success = false;
                  String token = "";

                  switch (result.statusCode) {
                    case 200:
                      success = true;
                      resultTitle = "로그인 성공";
                      resultContent = result.message ?? "";
                      token = result.token ?? "";
                      break;
                    case 401:
                      resultTitle = "로그인 실패";
                      resultContent = result.message ?? "";
                      break;
                    case 500:
                      resultTitle = "서버 내부 오류";
                      resultContent = result.message ?? "";
                      break;
                  }
                  if (success) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomePage(token: token),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(resultTitle),
                        content: Text(resultContent),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('확인'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text(
                  '로그인',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FindIdPage()),
                      );
                    },
                    child: const Text(
                      '아이디 찾기',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    '/',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FindPasswordPage()),
                      );
                    },
                    child: const Text(
                      '비밀번호 찾기',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 200), // 아래 여백 추가
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
                child: const Text(
                  '회원가입',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
