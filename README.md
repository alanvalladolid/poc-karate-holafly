# poc-karate-holafly
Holafly Karate API Test Automation

# Requirements  
* Java
* Maven

# Installation  
Clone this repository:  
``` git clone https://github.com/alanvalladolid/poc-karate-holafly.git ```

# Running Tests
Run all tests:  
``` mvn test ```

Run specific feature file:  
``` mvn test -Dtest=TestRunner -Dkarate.options="classpath:features/travellers/getTraveller.feature" ```

# Project Structure
* ``` /features/ ``` -> API Test flows.
* ``` /performance/ ``` -> Performance Test flows.
* ``` /runners/ParallelTestRunner.java ``` -> Parallel suite runner.
* ``` /runners/TestRunner.java ``` -> Main test suite runner.
* ``` /test-data/ ``` -> json test data.
* ``` karate-config.js ``` -> Global test configuration.
* ``` logback-test.xml ``` -> Logging configuration.
* ``` utils.js ``` -> Shared utilities.
* ``` pom.xml ``` -> Maven configuration.

# Links
* https://www.karatelabs.io/learning-center/
* https://docs.karatelabs.io/getting-started/why-karate
* https://github.com/karatelabs/karate
  
