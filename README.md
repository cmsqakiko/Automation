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

**Linux:** `pip3 install -r requirements.txt`

**Windows:** `pip install -r requirements.txt`
<!-- 
_For Reference, below are the dependencies the command above will install on your machine_
* robotframework
* robotframework-seleniumlibrary
* robotframework-faker
* selenium
* pyYAML
Faker-->


---
**Downloading and Setting up Web Drivers.**

This project relies on the use of webdrivers. The latest stable releases can be found [here.](https://www.seleniumhq.org/download/)

After Downloading the latest webdriver for your browser, add the webdriver file to your _PATH_. You can either create a new folder where you will keep all your webdrivers then add the whole folder to your _PATH_ or you can alternatively put the webdriver into a folder already existing in your _PATH_, both will give the same result.

---
**Running this robotframework test**



---
**_Advanced Implementations_**

_Creating your own log files_

You're not probably going to need to, for robotframework creates it own log and report out of the box , but in the case that you need to log some text to a file then try following the guide i created.


robot -d results -V BROWSER:Chrome -i sample test