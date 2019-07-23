import 'package:flutter/material.dart';

const bugDescription = '''
Tap on the text form field and observe the keyboard opening.

When the text form field is empty and just recently opened, the widget works correctly and on long press (end?), the "Paste" toolbar is displayed to the user.

The user types something, the "Paste" (and select, etc) toolbar displayed correctly.

Here's the bug: Remove text that was in the field, and try to get the app open the "Paste" toolbar by long press. It will not work, no matter where the user is tapping, long pressing.

The floating action button removes the focus from the text form field. Tap on the coffee fab. Go back to the empty text form field: Paste works again, even with empty fields.

Type something, then remove all text again: Paste toolbar is, again, never displayed, no matter where the user long-presses.
''';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
      appBar: AppBar(
        title: Text('Flutter Issue #36758'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            Text(bugDescription),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'TextFormField',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          // If we use the following line to hide, the "paste" toolbar never appears
          // when the text is empty
          // // import 'package:flutter/services.dart';
          // SystemChannels.textInput.invokeMethod<dynamic>('TextInput.hide');
        },
        tooltip: 'Hide keyboard',
        child: Icon(Icons.local_cafe),
      ),
    ),
    );
  }
}

