# product_listing_app
----------------------------------------------------------------------------------------------------
# Overview
The Product Listing App is a Flutter application designed for displaying a list of products with 
essential features like authentication, product search, and wishlist management. The app is built 
using Flutter and GetX for efficient state management and navigation.
----------------------------------------------------------------------------------------------------
# Features
=>User Authentication – OTP-based login and registration.
=>Product Listing – Displays products in a grid format.
=>Search Functionality – Allows users to search for products.
=>Wishlist Management – Add/remove products from favorites.
=>Dynamic Banners – Fetches and displays promotional banners.
=>GetX for State Management – Efficient and lightweight.
----------------------------------------------------------------------------------------------------
# Installation & Setup
* Prerequisites
- Flutter SDK installed
- Dart installed
- IDE (VS Code/Android Studio)

* Steps to Run
- git clone <repo-url>
- cd product-listing-app
- flutter pub get
- flutter run
----------------------------------------------------------------------------------------------------
# Screens & Functionalities
----------------------------------------------------------------------------------------------------
1. Login Screen
- Users enter their phone number.
- Calls the Verify User API to check if the user exists.
- If verified, navigates to Home Page.
- If new, prompts for user name before proceeding.
----------------------------------------------------------------------------------------------------
2. OTP Screen (Mock Functionality)
- The OTP is fetched from the API response (not sent via SMS).
- Users must enter the OTP received in the response to proceed.
- If the entered OTP matches the response, authentication is successful.
-----------------------------------------------------------------------------------------------------
3. Home Page
- Search Bar – Allows searching for products.
- Sliding Banners – Displays dynamic promotional banners.
- Product Grid – Lists products with Image, Name, Price, Rating, Wishlist button
-----------------------------------------------------------------------------------------------------
5. Wishlist Page
- Shows products added to favorites.
- Uses the Wishlist API for management.
- Clicking on a product removes it from the wishlist.
-----------------------------------------------------------------------------------------------------
6. Profile Page
- Displays user’s name and phone number.
- Retrieves data using the Profile API with authentication.
-----------------------------------------------------------------------------------------------------
7. Search Page
- Allows users to search for products.
- Calls the Search API and displays results.
-----------------------------------------------------------------------------------------------------
# Technologies Used
=>Flutter – UI development framework
=>Dart – Programming language for Flutter
=>GetX – State management and navigation
=>Dio – API handling
-----------------------------------------------------------------------------------------------------
