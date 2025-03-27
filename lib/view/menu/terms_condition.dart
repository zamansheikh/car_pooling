import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

class TermsConditionScreem extends StatelessWidget {
  const TermsConditionScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1("Terms and Condition"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Section 1: Types of Data We Collect
            const Text(
              '1. Types of Data We Collect',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed '
              'do eiusmod tempor incididunt ut labore et dolore magna '
              'aliqua. Ut enim ad minim veniam, quis nostrud exercitation '
              'ullamco laboris nisi ut aliquip ex ea commodo consequat. '
              'Duis aute irure dolor in reprehenderit in voluptate velit esse '
              'cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat '
              'cupidatat non proident, sunt in culpa qui officia deserunt mollit '
              'anim id est laborum.',
              style: TextStyle(fontSize: 14, height: 1.5),
            ),
            const SizedBox(height: 16),

            // Section 2: Use of Your Personal Data
            const Text(
              '2. Use of Your Personal Data',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Magna etiam tempor orci eu lobortis elementum nibh. '
              'Vulputate enim nulla aliquet porttitor lacus. Orci sagittis eu '
              'volutpat odio. Cras semper auctor neque vitae tempus quam '
              'pellentesque nec. Quam lacus suspendisse faucibus '
              'interdum posuere lorem ipsum dolor. Commodo elit at '
              'imperdiet dui. Nisi vitae suscipit tellus mauris a diam. '
              'Erat pellentesque adipiscing commodo elit at imperdiet dui. Mi '
              'ipsum faucibus vitae aliquet nec ullamcorper. Pellentesque '
              'pulvinar pellentesque habitant morbi tristique senectus et.',
              style: TextStyle(fontSize: 14, height: 1.5),
            ),
            const SizedBox(height: 16),

            // Section 3: Disclosure of Your Personal Data
            const Text(
              '3. Disclosure of Your Personal Data',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Consequat id porta nibh venenatis cras sed. Ipsum nunc '
              'aliquet bibendum enim facilisis gravida neque. Nibh tellus '
              'molestie nunc non blandit massa. Quam pellentesque nec '
              'nam aliquam sem et tortor consequat id. Faucibus vitae '
              'aliquet nec ullamcorper et amet risus. Nunc consequat.',
              style: TextStyle(fontSize: 14, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
