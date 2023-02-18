# Amazon Clone with Flutter & Firebase

A functional Amazon Clone with the cross-platform framework, Flutter, with the backend as Firebase. Works on Android and Web

## Features

- Email & Password Authentication
- Persistent Login
- View different products
- Search up for products
- Add rating and reviews to products
- Sell products
- Add products to cart
- Order products (Sends an order request to seller)
- Sign Out

## Project View

![Amazon Clone Mobile Image](https://github.com/Ishan9100/Flutter_Amazon_Clone/blob/main/Amazon_mobile_UI.png)

![Amazon Clone Mobile Image2](https://github.com/Ishan9100/Flutter_Amazon_Clone/blob/main/Amazon_mobile_UI2.png)

![Amazon Clone Web Image](https://github.com/Ishan9100/Flutter_Amazon_Clone/blob/main/Amazon_web_UI.png)

## Installation

After cloning the repository, do these steps-

- Create a firebase project
- Enable Authentication
- Enable firestore and storage (with valid rules)
- Create Android and Web apps
- Inside the ```main.dart``` add your own firebase options (The existing ones won't work)
- Generate own API keys
- Migrate to the folder and do-
```
flutter pub get
flutter run //To run the project default output settings
flutter run -d chrome --web-renderer html //To run the project on the web, and with html so that the images load
```

## Tech Used

Server-
- Firebase Firestore
- Firebase Authentication
- Firebase Storage

Client-
- Flutter
