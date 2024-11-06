import 'package:flutter/material.dart';
import 'package:exam1/utils/dialog.dart';

class FindIdPage extends StatefulWidget {
  const FindIdPage({super.key});

  @override
  _FindIdPageState createState() => _FindIdPageState();
}

class _FindIdPageState extends State<FindIdPage> {
  final TextEditingController _emailController = TextEditingController();

  Future<void> _sendEmailVerification(String email) async {
    await Future.delayed(const Duration(seconds: 2));
    // 이 부분이 서버 연동 되야함 (utils/http/user.dart 파일에 id_find 요청을 보내는 코드 추가)
    bool isSuccess = true;

    if (isSuccess) {
      createDialog(
        context,
        '인증 성공',
        Text('이메일로 비밀번호 재설정 링크가 전송되었습니다.'),
      );
    } else {
      createDialog(
        context,
        '인증 실패',
        Text('아이디 또는 이메일이 잘못되었습니다.'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('아이디 찾기')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '등록된 이메일을 입력하세요. 이메일로 아이디가 전송됩니다.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: '이메일을 입력하세요',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String email = _emailController.text;
                if (email.isNotEmpty) {
                  _sendEmailVerification(email); // 이메일 인증 요청
                } else {
                  createDialog(
                    context,
                    '오류',
                    Text('이메일을 입력하세요.'),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('이메일로 아이디 찾기', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
