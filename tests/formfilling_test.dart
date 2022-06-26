import 'package:app_matchx/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'Fill the form, and submit and validate if the "Data is in processing."message is displayed"',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp1());

    // find by key and enter first name
    var firstname = find.byKey(Key('firstNameTextField'));
    await tester.enterText(firstname, 'Varun');

    // to print message to console.
    print('entered first name');

    // Assert  if firstname widget is displayed
    expect(firstname, findsOneWidget);

    // reload the widget
    await tester.pump(Duration.zero);

    // find by key and enter lastname
    var lastname = find.byKey(Key('lastNameTextField'));
    await tester.enterText(lastname, 'Appalla');
    print('entered last name');

    // Assert  if last name widget is displayed
    expect(lastname, findsOneWidget);

    // await tester.pumpWidget(MyApp1());

    // enter email id
    var email = find.byKey(Key('emailTextField'));
    await tester.enterText(email, 'an.varun1993@gmail.com');
    print('entered email id');

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
    await tester.enterText(country, 'India');

    // Assert if country widget is displayed
    expect(country, findsOneWidget);

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

//    get text of submit button key and store in final data type, it cannot be altered.
    final submitmessagevalidation = find.text("Data is in processing.");

    // add 300 ms delay
    await tester.pump(const Duration(milliseconds: 300));

    // Assert if the text "Data is in processing." message should be displayed after entering all the fields
    // and clicking on submit.
    expect(submitmessagevalidation, findsOneWidget);

    // get text of submitmessagevalidation and print it.
    var submitmessagevalidationtext =
        submitmessagevalidation.evaluate().single.widget as Text;
    print(submitmessagevalidationtext);
  });
}
