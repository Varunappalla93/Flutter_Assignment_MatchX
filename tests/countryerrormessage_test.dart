import 'package:app_matchx/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'Verify error message "Please enter your current residing Country" is received when user tries to Submit the Form by leaving "Country" field empty.',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp1());

    // find by key and enter first name
    var firstname = find.byKey(Key('firstNameTextField'));
    await tester.enterText(firstname, 'Varun');

    // Assert  if firstname widget is displayed
    expect(firstname, findsOneWidget);

    // reload the widget
    await tester.pump();

    // find by key and enter lastname
    var lastname = find.byKey(Key('lastNameTextField'));
    await tester.enterText(lastname, 'Appalla');
    print('entered lastname');

    // Assert  if last name widget is displayed
    expect(lastname, findsOneWidget);

    // enter email id
    var email = find.byKey(Key('emailTextField'));
    await tester.enterText(email, 'an.varun1993@gmail.com');

    // Assert  if email widget is displayed
    expect(email, findsOneWidget);

    // find by key and enter phone number
    var phoneno = find.byKey(Key('phoneNumberTextField'));
    await tester.enterText(phoneno, '8106431775');

    // Assert if phone no widget is displayed
    expect(phoneno, findsOneWidget);

// find by key and enter Current Company Name
    var curr_company = find.byKey(Key('currentCompanyTextField'));
    await tester.enterText(curr_company, 'WAL');

    // Assert  if current company name widget is displayed
    expect(curr_company, findsOneWidget);

    // rebuilds the widgets state till all frames are scheduled until all animations are displayed.
    await tester.pumpAndSettle();

    // find the city by its label text
    var city = find.text('City');

    // finds city widget and scroll until city is visible with pixels.
    await tester.scrollUntilVisible(
      city,
      100000,
    );

    // find by text and enter city name
    await tester.enterText(city, 'Hyd');

    // Assert  if city widget is displayed
    expect(city, findsOneWidget);

    // find by key and enter country name
    var country = find.byKey(Key('countryTextField'));

    // do not enter any text in country textbox widget
    // await tester.enterText(country, 'India');

    // enter DOB
    var dob = find.byKey(Key('dobTextField'));
    await tester.enterText(dob, '16 Aug');

    // Assert if DOB widget is displayed
    expect(dob, findsOneWidget);

    // click submit button
    var submit = find.byKey(Key('submitButton'));
    await tester.tap(submit);

    //and then reload widget state until frames are scheduled.
    await tester.pumpAndSettle();

    //Assert if the submit widget is displayed.
    expect(submit, findsOneWidget);

    // add 100 ms delay
    await tester.pump(const Duration(milliseconds: 100));

//   get text of country text key and store in final data type, it cannot be altered.
    final countrymessagevalidation =
        find.text("Please enter your current residing Country");

    // Assert if country validation message is displayed when country field is left empty and clicked on submit.
    expect(countrymessagevalidation, findsOneWidget);

    // get text of countrymessagevalidation and print it.
    var countrymessagevalidationtext =
        countrymessagevalidation.evaluate().single.widget as Text;
    print(countrymessagevalidationtext);
  });
}
