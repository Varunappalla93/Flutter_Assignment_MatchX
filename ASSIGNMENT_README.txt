CODE EXPLANATION:

Created two tests for testing the widgets , called as component testing.

1. Created two test files with names - for filling form and validation success message, and another for validation country error message
after leaving country field empty and clicking Submit.

a)formfilling_test.dart 
b)countryerrormessage_test.dart.


2.async means that this function is asynchronous and it will return the type of Future and next lines will wait until this returns the future object.

3.await waits till aysnc function is completed and to get its return value.

4.Added testWidgets function with respective test case name and called WidgetTester class with
one object called tester to interact with widgets.


5.Used the created object - tester to pumpwidget() as it calls runApp() with our given created
widget app and then triggers a frame.

6.main.dart has multiple children in ListView as widgets and has many textformfield with items such as labeltext,
hinttext,controller,key values stored in tuple.


7.If string value is empty, it should return validation message, if data is entered in text form fields, it should not return anything.

8. Have taken all the KeyValues of Keys present in TextFormField using find.byKey(Key("ValueKey")) and stored in var variables, such as firstname, lastname,

email,phoneno,currentcompany,country,dob and submit.


9. For City, have taken label text using find.text("labeltext") and stored in var city variable.


10. As city field is not visble on the screen, used object-tester.scollintovisible(variable assigned to locator, pixels) 
to scroll down using pixels.


11.To enter all the values in the text fields, used the method called enterText(variable assigned to locator, "hardcoded 
text we wish to enter").

12.We use assertions with expect() to validate if find bykey or text locator returns value which has widget present
on the screen.


13.findsOneWidget is the Finder locates at exactly one widget in the widget tree.

14. We must use tester.pumpandSettle() every 10 minutes acc to its default timeout as it rebuilds the widgets state till all frames are scheduled 
until all animations are displayed.


15.For validation any message, we can store them in final variable and call them with find.text("Expected message")
as final variable is final and cannot be overriden at any point of time.


16. To put some delay between steps, we can use - await tester.pump(const Duration(milliseconds: 300))
this will wait for 300 ms until it executes next line in script.
here const is used, as it will be applicable only at compile time and its immutable.

17. We can use with expect() to assert the validation message by getting the text using find.text
and store it in one final variable and compare if it has one widget found in the list tree.


18.To get the text of validation message, we can get the text using find.text and and store it in one final variable
and then convert to evaluate function the variable and convert the single widget as text like
eg: submitmessagevalidation.evaluate().single.widget as Text;


19.We can store this in one var variable and print when required.
  var submitmessagevalidationtext = submitmessagevalidation.evaluate().single.widget as Text;
  print(submitmessagevalidationtext);










