import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../UserModel.dart';
import 'footer.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Consumer<UserModel>(
          builder: (context, userModel, _) {
            // Afficher le toast de bienvenue
            Future.delayed(Duration.zero, () {
              Fluttertoast.showToast(
                  msg: "Bonjour ${userModel.email}",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 19.0
              );
            });

            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.account_circle, size: 100),
                  ),
                  SizedBox(height: 10),
                  Text(
                    userModel.email,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('J\'aimes', style: TextStyle(fontSize: 18)),
                          Text('100', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Followers', style: TextStyle(fontSize: 18)),
                          Text('500', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Suivis', style: TextStyle(fontSize: 18)),
                          Text('300', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: AppFooter(
        onHomePressed: () {},
        onDiscoverPressed: () {},
        onMediaImportPressed: () {},
        onInboxPressed: () {},
        onProfilePressed: () {

        },
      ),
    );
  }
}
