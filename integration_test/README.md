# 🧪 Integration Tests for Hotel Search App

This directory contains integration tests for the **Hotel Search Flutter application**. These tests verify that user-facing features work as intended when interacting with the UI.

---

## 📁 Directory Structure

- `tests/` — Main test files simulating coreuser scenarios and verifying app behavior.
- `screens/` — Page Object Model classes for each screen of the app.
- `utils/` — Helper functions and utilities to support tests.
- `scripts/` — Shell scripts for running tests locally and remotely in Firebase Test Lab. For local runs there is an option to generate Allure report.
- `report/` — Stores generated test results.
- `html_allure_report/` — Contains the Allure HTML test report.
- `dummy_test.dart` — A sample test used to validate setup.

## 🔁 Integration with Firebase Test Lab for parallel test execution

Integration tests for both **iOS** and **Android** platforms are executed in parallel using a custom shell script that leverages **Firebase Test Lab**, **Patrol CLI**, and **Gcloud CLI**.
The integration required setting up a Firebase project, creating a service account in Gcloud, and generatinga  .json key. The key is stored locally. I can grant access to Firebase and the Google Cloud projects upon request. 

The script performs the following:

1. **Sets up Patrol CLI and gcloud** tools.
2. **Builds iOS tests** (`Runner.xctestrun`) for physical device via Patrol (simulators aren't supported on Firebase Test Lab).
3. **Zips the test artifacts** and runs the iOS tests in the background using `gcloud firebase test ios run`.
4. **Builds Android test APKs** via Patrol.
5. **Runs Android tests** via `gcloud firebase test android run` with support for test orchestrator, video recording, and custom device config.
6. **Waits for both jobs** to complete with the `wait` command, enabling parallelism.

### The screenshots of 2 tests running in FB Test Lab at the same time.

iOS dummy_test.dart run, iPhone 15 18.0
![image](https://github.com/user-attachments/assets/324df90e-f2b5-4084-b06e-b56462563c19)
Android dummy_test.dart run, Medium Phone, 6.4in/16cm (Arm), Virtual, API Level 34
![image](https://github.com/user-attachments/assets/ed0ceef0-12b8-4c8b-a408-ffca9a69a473)

### Screenshot of what an integrated Allure report looks like
![image](https://github.com/user-attachments/assets/b8a69d70-a929-4dc5-8980-bb29c1c600a1)
Most of the tests failed due to this issue I started experiencing yesterday
![image](https://github.com/user-attachments/assets/7ab716a0-534f-4964-84c1-230fecd9b875)


## ✅ Test Scenarios

This app’s integration suite validates key user flows, UI behavior, and feature correctness. Below is a breakdown of what each test file covers:

### 🏁 1 Default Tab Behavior
**File:** `tests/default_tab_chosen_test.dart`  
**Test Case:** Verify that the Overview tab is the default active tab when the app launches.  
- Launch the app  
- Ensure the Overview tab is selected by default

---

### 🔍 2 Basic Hotel Search
**File:** `tests/hotel_search_test.dart`  
**Test Case:** Verify that typing a valid search query returns hotel results.  
- Enter a search term (e.g., "London")  
- Confirm at least one hotel card with title appears  

---

### 📜 3 Search Scroll
**File:** `tests/search_scroll_test.dart`  
**Test Case:** Ensure the user can scroll through a long list of hotel results.  
- Perform a search  
- Scroll the list  
- Verify a card farther down (e.g., index 30) becomes visible and tappable

---

### 😢 4 Empty State on Search
**File:** `tests/hotel_screen_empty_test.dart`  
**Test Case:** Display an empty state of Hotels screen.  
- Open Hotels screen and do not perform search
- Confirm that the empty icon is shown

---

### ❤️ 5 Add to Favorites from Search
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

### 💔 6 Remove from Favorites
**File:** `tests/unfavorite_test.dart`  
**Test Case:** Unfavorite a hotel on Favorites screen and verify it's removed from the list.  
- Add a hotel to favorites 
- Navigate to Favorites  
- Tap the favorite icon to remove  
- Confirm the hotel is no longer shown

---

### 🕳️ 7 Empty Favorites Screen
**File:** `tests/favorites_empty_test.dart`  
**Test Case:** Show an empty state when the favorites list is empty.  
- Open app
- Navigate to the Favorites tab  
- Confirm that an empty indicator appears

---

### 🔁 8 Tab Navigation with Search Context
**File:** `tests/search_and_tab_change_test.dart`  
**Test Case:** Switching tabs preserves app state appropriately.  
- Perform a hotel search  
- Switch to Favorites  
- Return to Search  
- Ensure the search result still appears and matches the previous state

