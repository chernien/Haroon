// multi_step_signup.dart
import 'package:flutter/material.dart';
import '../UI/Step1.dart';
import '../UI/Step2.dart';
import '../UI/Step3.dart';


class MultiStepSignUp extends StatefulWidget {
  @override
  _MultiStepSignUpState createState() => _MultiStepSignUpState();
}

class _MultiStepSignUpState extends State<MultiStepSignUp> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  List<Widget> _pages = [
    Step1(),
    Step2(),
    Step3(),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.animateToPage(
        _currentPage - 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _submitForm() {
    if (_currentPage == _pages.length - 1) {
      // Access the form key in Step3
      final step3State = (_pages[_currentPage] as Step3).createState();
      if (step3State.formKey.currentState?.validate() ?? false) {
        // Form is valid, proceed with submission or further processing
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Form submitted successfully!')),
        );
      } else {
        // Form is not valid, show a snackbar or handle accordingly
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please complete the form')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: _pages,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                if (_currentPage > 0)
                  ElevatedButton(
                    onPressed: _previousPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.red, // White text color
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                      ),
                    ),
                    child: Text('Previous'),
                  ),
                SizedBox(height: 12.0),
                if (_currentPage < _pages.length - 1)
                  ElevatedButton(
                    onPressed: _nextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFEA0000), // Red color
                      foregroundColor: Colors.white, // White text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                      ),
                    ),
                    child: Text('Next'),
                  ),
                SizedBox(height: 12.0),
                if (_currentPage == _pages.length - 1)
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFEA0000), // Red color
                      foregroundColor: Colors.white, // White text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                      ),
                    ),
                    child: Text('Submit'),
                  ),
              ],
              // Adjust spacing as needed


            ),
          ),
        ],
      ),
    );
  }
}
