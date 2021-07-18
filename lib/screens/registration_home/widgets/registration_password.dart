import 'package:dkatalis_demo/utilities/project_colors.dart';
import 'package:flutter/material.dart';

class RegistrationPassword extends StatelessWidget {
  const RegistrationPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create Password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Password will be used to login to account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              obscureText: false,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                hintText: 'Create Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: ProjectColors.BACKGROUND_BLUE,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Complexity:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Very Weak',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'a',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Lowercase',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'A',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Uppercase',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '123',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Number',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '9+',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Characters',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
