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

