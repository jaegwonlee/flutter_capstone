// MyProfilePage.dart
import 'package:flutter/material.dart';
import 'package:exam1/ui/pages/MyprofileSetting_page.dart';

class MyProfilePage extends StatelessWidget {
  final String token;

  const MyProfilePage({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('마이페이지', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // 이전 페이지로 이동
          },
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              '로그아웃',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      AssetImage('assets/profile_image.png'), // 프로필 이미지 경로
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '나성이 반려인 WELCOME!',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MyProfileSettingPage()), // MyProfileSettingPage로 이동
                        );
                      },
                      child: Text(
                        '나성이   MY 계정관리',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _iconWithLabel(
                  icon: Icons.edit,
                  label: '내 게시글 관리',
                  context: context,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PostManagementPage()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("내 게시글 관리로 이동")),
                    );
                  },
                ),
                _iconWithLabel(
                  icon: Icons.bookmark,
                  label: '게시글 보관함',
                  context: context,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SavedPostsPage()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("게시글 보관함으로 이동")),
                    );
                  },
                ),
                _iconWithLabel(
                  icon: Icons.headset_mic,
                  label: '고객센터',
                  context: context,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CustomerServicePage()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("고객센터로 이동")),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'WE PET',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage('assets/pet_image.png'), // 펫 이미지 경로
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            '메오',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.edit, size: 16),
                          ),
                        ],
                      ),
                      const Text('성별   남아'),
                      const Text('나이   3'),
                      const Text('성격   온순해요   안물어요'),
                      const Text('예방접종 여부   O'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconWithLabel({
    required IconData icon,
    required String label,
    required BuildContext context,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 30, color: Colors.black),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

// 아래는 각 페이지의 기본 구현

class PostManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('내 게시글 관리')),
      body: Center(child: Text('Post Management Page')),
    );
  }
}

class SavedPostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('게시글 보관함')),
      body: Center(child: Text('Saved Posts Page')),
    );
  }
}

class CustomerServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('고객센터')),
      body: Center(child: Text('Customer Service Page')),
    );
  }
}
