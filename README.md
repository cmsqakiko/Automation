<p align="center"><img src="https://avatars2.githubusercontent.com/u/574284?s=200&v=4"/></p>
<h2 align="center">Robot Framework Simple Sample Setup</h2>



---
**_What is Robot Framework?_**

Robot Framework is a generic open source automation framework for acceptance testing, acceptance test driven development (ATDD), and robotic process automation (RPA). It has easy-to-use tabular test data syntax and it utilizes the keyword-driven testing approach. Its testing capabilities can be extended by test libraries implemented either with [Python](https://www.python.org/) or Java, and users can create new higher-level keywords from existing ones using the same syntax that is used for creating test cases.

Robot Framework project is hosted on GitHub where you can find further documentation, source code, and issue tracker. Downloads are hosted at PyPI. The framework has a rich ecosystem around it consisting of various generic test libraries and tools that are developed as separate projects.

Robot Framework is operating system and application independent. The core framework is implemented using Python and runs also on Jython (JVM) and IronPython (.NET).

Robot Framework itself is open source software released under Apache License 2.0, and most of the libraries and tools in the ecosystem are also open source. The framework was initially developed at Nokia Networks and it is nowadays sponsored by Robot Framework Foundation.

For more information about [robotframework](https://robotframework.org/) and its inner workings, [click here.](https://robotframework.org/)



---
**Downloading and Setting up Web Drivers.**

This project relies on the use of webdrivers. The latest stable releases can be found [here.](https://www.seleniumhq.org/download/)

After Downloading the latest webdriver for your browser, add the webdriver file to your _PATH_. You can either create a new folder where you will keep all your webdrivers then add the whole folder to your _PATH_ or you can alternatively put the webdriver into a folder already existing in your _PATH_, both will give the same result.

---
**Running this robotframework test**

Please Install the required packages.

**Linux:** `pip3 install -r requirements.txt`

**Windows:** `pip install -r requirements.txt`

Make Sure You have python installed and a webdriver that can be downloaded using this link [here.](https://www.seleniumhq.org/download/)

_For Reference, below are the dependencies the command above will install on your machine_
* robotframework
* robotframework-seleniumlibrary
* robotframework-faker
* selenium
* pyYAML
* Faker

To run test on Chrome Please go to current Directory and run:

> robot -d results -V BROWSER:Chrome -i sample test

To run test on Firefox Please go to current Directory and run:

> robot -d results -V BROWSER:Firefox -i sample test


**_PLEASE NOTE_**
* Update your RobotFramework to later version. New Implementation for conditional IF ELSE statement is added here.
* Cannot Test Login Page using a real registered account (account limitation)
* testing may give you warning about the minimum and maximum allowed characters in username and password filed
* Developer should work more on validating allowed characters on login page. This Should fail on Real Environment.
* Please check on warning message.
> Validation for Minimum and Maximum allowed Character is not available. Please ask Dev to fix
 

---
**_Advanced Implementations_**

_Creating your own log files_

You're not probably going to need to, for robotframework creates it own log and report out of the box , but in the case that you need to log some text to a file then try following the guide i created.
