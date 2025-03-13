Create an app to provide information on NYC High schools. 
Display a list of NYC High Schools.  
Access the JSON API directly from here: https://data.cityofnewyork.us/resource/s3k6-pzi2.json 
API Docs: https://dev.socrata.com/foundry/data.cityofnewyork.us/s3k6-pzi2 
For more details on the metadata please go to: https://data.cityofnewyork.us/Education/DOE-High-School-Directory-2017/s3k6-pzi2 
 
Selecting a school should show additional information about the school. At the very least, display all the SAT scores - including Math, Reading and Writing. Few info to go for: 
JSON API for SAT is here: https://data.cityofnewyork.us/resource/f9bf-2cp4.json 
APIDocs: https://dev.socrata.com/foundry/data.cityofnewyork.us/f9bf-2cp4 
For more documentation : https://data.cityofnewyork.us/Education/SAT-Results/f9bf-2cp4 
It is up to you to decide what additional information to display 
 
 
 
 
When creating a name for your project, please use the following naming convention: 
YYYYMMDD-[First&LastName]-NYCSchools (Example: 20180101-DanielleBordner-NYCSchools) 
 
What is Important 
Proper function – requirements met. 
Well-constructed, easy-to-follow, commented code (especially comment hacks or workarounds made in the interest of expediency (i.e. // given more time I would prefer to wrap this in a blah blah blah pattern blah blah )). 
Proper separation of concerns and best-practice coding patterns. 
Defensive code that graciously handles unexpected edge cases. 
 
What is Less Important 
Demonstrating technologies or techniques you are not already familiar with. 
 
Bonus Points! 
Unit Tests 
Additional functionality – whatever you see fit. 
 
 
Specific Technology Notes 
 
iOS: 
Avoid Third-Party Dependencies: 
Minimize the use of third-party libraries in your iOS project. If you must use them, commit all third-party frameworks to the repository, even though it goes against CocoaPods general rules, ensuring the app can be built and run standalone. 
Use SwiftUI: 
Build the application using SwiftUI as the primary framework for developing the user interface, leveraging native Apple libraries to maintain design consistency and reduce external dependencies. 
Compatibility with iPhone X and Beyond: 
Ensure your iOS application is fully compatible with iPhone X and newer models, paying special attention to the notch, safe areas, and different screen sizes to provide a seamless user experience. 
Use Swift: 
Use Swift as the primary programming language for building your iOS application, adhering to best practices for modern, safe, and efficient code. 
