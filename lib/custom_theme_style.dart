library custom_theme_style;
import 'package:custom_theme_style/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme extends StatefulWidget {
  const CustomTheme({super.key});

  @override
  State<CustomTheme> createState() => _CustomThemeState();
}

class _CustomThemeState extends State<CustomTheme> {
  final bool isColor = true;

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Theme'),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.0),
            ),
          ),
          child: SizedBox(
            height: 80,
            child: BottomAppBar(
              elevation: 0.0,
              color: Theme.of(context).colorScheme.primary,
              shape: const CircularNotchedRectangle(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_outlined,
                          color: Colors.white,// : Colors.white,
                          size: 20,
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "Home",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                          ),),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person,
                            size: 20,
                            color: Colors.black
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "Profile",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      currentIndex == 2;
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.notifications_on_outlined,
                            size: 20,
                            color: Colors.black),
                        SizedBox(height: 8.0),
                        Text("Notification",
                            style: TextStyle(
                                color:
                                Colors.black ,
                                fontSize:11)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Body Large Text',
              style: GoogleFonts.robotoSlab(
                fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                color: isColor
                    ? Colors.red
                    : Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            Text(
              'Display Medium Text',
              style: GoogleFonts.robotoSlab(
                fontSize: Theme.of(context).textTheme.displayMedium?.fontSize,
                color: isColor ? Colors.pink : Theme.of(context).textTheme.displayMedium?.color,
              ),
            ),
            Text(
              'Display small Text',
              style: CustomTextStyle.applyCustomStyle(
                Theme.of(context).textTheme.displaySmall,
                color: isColor
                    ? Colors.purple
                    : Theme.of(context).textTheme.bodySmall?.color,
              ),
            ),
            TextButton(
              child: const Text('Submit'),
              onPressed: () {
              },
            ),
            ElevatedButton(
              onPressed: () {
                _showAlertDialog(context);
              },
              child:
              Text('Button',
                  style: Theme.of(context).textTheme.bodyLarge
              ),
            ),
            Checkbox(
              value: true,
              onChanged: (bool? value) {},
            ),
            Radio(
              value: 1,
              groupValue: 1,
              onChanged: (int? value) {},
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.orange),
              child: Text(
                'Drawer Header',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            ListTile(
              title:
              Text('Item 1', style: Theme.of(context).textTheme.bodySmall),
              onTap: () {},
            ),
            ListTile(
              title:
              Text('Item 2', style: Theme.of(context).textTheme.bodySmall),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context),
          child: AlertDialog(
            shadowColor: Theme.of(context).cardColor,
            title: const Text('Alert Dialog Title'),
            content: const Text('This is the content of the alert dialog.'),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Confirm'),
                onPressed: () {
                  // Handle the confirm action
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

