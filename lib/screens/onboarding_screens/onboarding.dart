import 'package:flutter/material.dart';
import 'package:to_do_aap/screens/login_register/login.dart';

class OnBoardingContent {
  final String image;
  final String title;
  final String description;

  OnBoardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnBoardingScreen extends StatefulWidget {
  final List<OnBoardingContent> contents = [
    OnBoardingContent(
      description: 'You can manage your tasks on My Todo for free,',
      title: 'Manage Your Daily Tasks,',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTn078KchAzl0rr8JjnBBxKUqhmUPmFGnfOG_4uJT6Znu5xqfNeOSG-1FHI8yqp87bd4gM&usqp=CAU',
    ),
    OnBoardingContent(
      description: 'In My Todo you can create your daily routine,',
      title: 'Create Daily Routine',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSioX2xS3P2DJUI8p1rIycFtW3waRhyBP0OuZJa4BNzMqUr2JP0fLDlaYTqh7phu9wqSNI&usqp=CAU',
    ),
    OnBoardingContent(
      description: 'You can organize your daily tasks',
      title: 'Organize Your Tasks',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSx3dfK26_wlAS7_g0AomT1J9nEWcG330F6eIrjgYBlqyQuIHWEw4YnZbmok0J9fzqWc8&usqp=CAU',
    ),
  ];

  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  final PageController _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: widget.contents.length,
              onPageChanged: (int index) {
                setState(() => currentIndex = index);
              },
              itemBuilder: (context, index) {
                final content = widget.contents[index];
                return Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      Image(
                        image: NetworkImage(content.image),
                        height: 300.0,
                      ),
                      Text(
                        content.title,
                        style: const TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        content.description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.contents.length,
              (index) => BuildDot(index, currentIndex),
            ),
          ),
          Container(
            height: 40,
            margin: const EdgeInsets.all(25.0),
            width: double.infinity,
            color: Colors.purple,
            child: GestureDetector(
              onTap: () {
                if (currentIndex == widget.contents.length - 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginView()),
                  );
                } else {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                  );
                }
              },
              child: Center(
                child: Text(
                  currentIndex == widget.contents.length - 1
                      ? 'Continue'
                      : 'Next',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildDot extends StatelessWidget {
  final int index;
  final int currentIndex;

  const BuildDot(this.index, this.currentIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: currentIndex == index ? Colors.deepPurpleAccent : Colors.grey,
      ),
    );
  }
}
