# 🤖 API Automation Project in Karate

ReqreExercise

## 📝 Description

This project is designed to automate testing of the public API of [Reqres.in](https://reqres.in/) using Karate, a BDD (Behavior Driven Development) based testing framework. The project is configured with Java and managed with Maven to simplify compilation and dependency management. It includes tests for creating, getting, updating, and deleting users through HTTP requests, ensuring that the API endpoints function as expected.

## 📋 Requirements

- **Java 21.0.2** 
- **Maven 3.9.6**
- **IntelliJ IDEA** (Optional but recommended)

## 🔌 Plugins used
Karate: Testing framework for services that facilitates automated API testing with a BDD approach.
Cucumber: Test automation tool that uses Gherkin to write readable test cases, facilitating BDD.
Maven: Dependency management and project building tool for Java projects.


## 🚀 Installation

1. **Clone the repository**:

    ```bash
    git clone https://github.com/Jennyarevalo26/backend_karate.git
    cd backend_karate
    ```

2. **Compile the project**:

    ```bash
    mvn clean install
    ```

3. **Open the project in IntelliJ IDEA**:

 - Select File > Open and choose the project directory.
- IntelliJ IDEA should automatically detect that it is a Maven project and configure it accordingly.
  
## 📂 Project structure


ReqreExercise/

├── build/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── Backend/
│   │   │       └── ManagementTest.java
│   │   │       └── user.java
│   │   └── resources/
│   │   │    └── Backend/
│   │   │       └── responsePostRegisterSuccessful.json
│   │   │       └── user.feature
│   │   │── javakarate-config.js
│   │   │── karate-properties.json
│   │   │
│   ├── test/
│   ├   ├── java/
└── .gitignore
├── pom.xml


src/main/java: Contains the test classes written in Java.
src/main/resources: Contains the feature files.
pom.xml: Maven configuration file.

🛠️ Usage
Run tests from IntelliJ IDEA:

Open the ManagementTest class in src/main/java and right-click.
Select Run 'ManagementTest' ▶️ .

📘 Test Example

Feature file 📝 (user.feature)

Feature: Service Users
  As QA Automation
  I want to consult API of users
  To validate the status code and response
  
    Scenario: Check the service Get Method listUsers
    Given path '/api/users?page=2'
    When method get
    Then status 200
    And assert response.total == 12


Execution class with Cucumber▶️ (ManagementTest.java)

import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;
import com.intuit.karate.Results;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class ManagementTest {
    @Test
    void testParallel() {
        Results
                results = Runner.path("classpath:Backend").outputCucumberJson(true).tags("~@ignore").parallel(1);
                generateReport(results.getReportDir());
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("build"), "RetoQAAutomation");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}

