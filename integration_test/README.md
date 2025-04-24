# 🧪 Integration Tests for Hotel Search App

This directory contains integration tests for the **Hotel Search Flutter application**. Here you can find:
- Documentation of environment setup
- Script for running tests across multiple devices
- List of all required dependencies and versions is in the pubspec.yaml file.
- Core Test Scenarios
- Documentation of test structure
- Complete test suite implementation of said scenarios 
- Instructions for running tests
- Test results and coverage reports (Allure format)


## Environment setup
- Integrating Patrol: https://patrol.leancode.co/documentation
- Integration Firebase Test Lab: https://patrol.leancode.co/documentation/ci/firebase-test-lab
- Integrating Allure: https://medium.com/@kolbevich/how-to-make-allure-work-with-patrol-tests-in-ci-cd-a03800fbe223

---

## 📁 Directory Structure

- `tests/` — Main test files simulating coreuser scenarios and verifying app behavior.
- `screens/` — Page Object Model classes for each screen of the app.
- `utils/` — Helper functions and utilities to support tests.
- `scripts/` — Shell scripts for running tests locally and remotely in Firebase Test Lab. For local runs there is an option to generate Allure report.
- `report/` — Stores generated test results.
- `html_allure_report/` — Contains the Allure HTML test report.
- `dummy_test.dart` — A sample test used to validate setup.

## 🔁 /scripts

### How to run all E2E tests 
Use `local/run_all.sh` script, make it an executable, and invoke it from the project root using an absolute path.
The script runs all tests in the integration_test/test catalog. For more, please check the script file.

### How to run E2E tests with Allure report 
Use `local/run_all_ios_allure_report.sh` script. Make it an executable and invoke it from the project root using an absolute path as well.
The script all tests on iOS. Uses allure-xcresult package to convert native reports to Allure.
Screenshot of what an integrated Allure report looks like
![image](https://github.com/user-attachments/assets/b8a69d70-a929-4dc5-8980-bb29c1c600a1)
Most of the tests failed due to this issue I started experiencing yesterday
![image](https://github.com/user-attachments/assets/7ab716a0-534f-4964-84c1-230fecd9b875)
<img width="1234" alt="image" src="https://github.com/user-attachments/assets/aa289241-120e-4ddf-b0d9-b1c4456e64e2" />


### How to run a dummy test with Firebase Test Lab for parallel test execution
Use `fb_test_lab/fb_fun_dummy_both_test.sh`. Make it an executable, and invoke it from the project root using an absolute path. 
For now, the script runs a dummy example test, which is basically a mock just to test that the intergation with Firebase Test Lab and native test executables works fine. Dummy test for both **iOS** and **Android** platforms is executed in parallel on 2 unique devices using a custom shell script that leverages **Firebase Test Lab**, **Patrol CLI**, and **Gcloud CLI**.
The integration required setting up a Firebase project, creating a service account in Gcloud, and generating a  .json key. The key is stored locally. I can grant access to Firebase and the Google Cloud projects upon request. 
For more, please check the script file. 

#### The screenshots of 2 tests running in FB Test Lab at the same time.

iOS dummy_test.dart run, iPhone 15 18.0
![image](https://github.com/user-attachments/assets/324df90e-f2b5-4084-b06e-b56462563c19)
Android dummy_test.dart run, Medium Phone, 6.4in/16cm (Arm), Virtual, API Level 34
![image](https://github.com/user-attachments/assets/ed0ceef0-12b8-4c8b-a408-ffca9a69a473)

#### Screenshots of executed tests
<img width="1092" alt="image" src="https://github.com/user-attachments/assets/e417b79c-751a-4007-a3b9-fa1a188b9b5d" />
<img width="1092" alt="image" src="https://github.com/user-attachments/assets/3aeccc9c-834e-441e-a8a9-0bbf9a019701" />


### 🎯 How to run a single test
In the hotel-search/ root
- Make sure the patrol cli is active:
  `dart pub global activate patrol_cli`
- Run a test in debug mode:
  `patrol develop --target integration_test/tests/<test_file_name>`
- Run a test in release mode:
  `patrol test --target integration_test/tests/<test_file_name>`
- Run on a specific device:
  Get device ID from the list of devices `patrol devices`, then
  `patrol test --target integration_test/tests/<test_file_name> -d <device_id>`
  Or specify the device model like this
  `patrol test --target integration_test/tests/<test_file_name> -d "iPhone 15 pro"`
- Run with more logs:
  `patrol test --target integration_test/tests/<test_file_name> --verbose`


## ✅ /tests Test Scenarios

This app’s integration suite validates key user flows, UI behavior, and feature correctness. Below is a breakdown of what each test file covers:

###  1 Default Tab Behavior
**File:** `tests/default_tab_chosen_test.dart`  
**Test Case:** Verify that the Overview tab is the default active tab when the app launches.  
- Launch the app  
- Ensure the Overview tab is selected by default

---

###  2 Basic Hotel Search
**File:** `tests/hotel_search_test.dart`  
**Test Case:** Verify that typing a valid search query returns hotel results.  
- Enter a search term (e.g., "London")  
- Confirm at least one hotel card with title appears  

---

###  3 Search Scroll
**File:** `tests/search_scroll_test.dart`  
**Test Case:** Ensure the user can scroll through a long list of hotel results.  
- Perform a search  
- Scroll the list  
- Verify a card farther down (e.g., index 30) becomes visible and tappable

---

###  4 Empty State on Search
**File:** `tests/hotel_screen_empty_test.dart`  
**Test Case:** Display an empty state of Hotels screen.  
- Open Hotels screen and do not perform search
- Confirm that the empty icon is shown

---

###  5 Add to Favorites from Search
**File:** `tests/favorite_from_search_test.dart`  
**Test Case:** Verify that adding a hotel to favorites from the search screen works correctly.  
- Perform a search  
- Tap the favorite icon on a result  
- Switch to the Favorites tab  
- Confirm the hotel appears in the favorites list
- Switch back to Hotels screen
- Unfavorite the same hotel
- Check that it disappeared from Favorites screen

---

###  6 Remove from Favorites
**File:** `tests/unfavorite_test.dart`  
**Test Case:** Unfavorite a hotel on Favorites screen and verify it's removed from the list.  
- Add a hotel to favorites 
- Navigate to Favorites  
- Tap the favorite icon to remove  
- Confirm the hotel is no longer shown

---

###  7 Empty Favorites Screen
**File:** `tests/favorites_empty_test.dart`  
**Test Case:** Show an empty state when the favorites list is empty.  
- Open app
- Navigate to the Favorites tab  
- Confirm that an empty indicator appears

---

###  8 Tab Navigation with Search Context
**File:** `tests/search_and_tab_change_test.dart`  
**Test Case:** Switching tabs preserves app state appropriately.  
- Perform a hotel search  
- Switch to Favorites  
- Return to Search  
- Ensure the search result still appears and matches the previous state

