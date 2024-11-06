// MyProfileSettingPage.dart
import 'package:flutter/material.dart';

class MyProfileSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // 뒤로가기
          },
        ),
        title: Text('MY 계정관리'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: screenWidth * 0.25,
                    width: screenWidth * 0.25,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      child: Text(
                        '사진 수정',
                        style: TextStyle(color: Colors.blue),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.05),
                ],
              ),
            ),
            Divider(),
            _buildSectionTitle('계정 보안'),
            _buildAccountInfoItem('아이디', 'asdfghj@pcu.ac.kr'),
            _buildAccountInfoItem('전화번호', '010-0000-0000'),
            _buildAccountInfoItem('비밀번호 변경'),
            _buildAccountInfoItem('이메일 변경'),
            Divider(),
            _buildSectionTitle('이용 안내'),
            _buildInfoItem('문의하기'),
            _buildInfoItem('공지사항'),
            _buildInfoItem('서비스 이용약관'),
            _buildInfoItem('개인정보 처리방침'),
            _buildInfoItem('청소년 보호정책'),
            _buildInfoItem('오픈소스 라이선스'),
            Divider(),
            _buildSectionTitle('기타'),
            _buildInfoItem('정보 동의 설정'),
            _buildInfoItem('회원 탈퇴'),
            _buildInfoItem('로그아웃'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _buildAccountInfoItem(String title, [String? subtitle]) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        // 각 항목 클릭 시 동작
      },
    );
  }

  Widget _buildInfoItem(String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        // 각 항목 클릭 시 동작
      },
    );
  }
}
