# Vakinha Burger
 
## ✨ About

Vakinha Burger is a delivery app, in Portuguese, where the user can choose a burger and order it from the restaurant. This project was made during Dart Week, a one-week code immersion, using the MVC architecture, Bloc as a state manager.

## ⚡ Demo
![Screen_Recording_20230304_005529_AdobeExpress](https://user-images.githubusercontent.com/50742224/222928032-a6042108-016a-4fa7-a6a0-173f3a72a20d.gif)


## Features
- [x] Register and Login
- [x] Auth and Refresh Token
- [X] Product Details
- [x] Shopping cart functionality
- [x] Add/Remove items from cart
- [x] Order Product

## Main technologies
- Flutter
- Auth and Refresh Token
- Bloc as a State Manager
- Shared Preferences
- Dio
- Match Package

## Learning Process
While coding this project and watching the Dart Week Videos I've got the opportunity to learn and practice things that I don't get to use that much on my own projects. A few examples are using Bloc, with equatable and things like the match pattern. It was great to learn and experience other ways of building projects.

## 🚀 How to Use

- Clone this project
```sh
git clone https://github.com/raangelbeatriz/vakinha_burguer
```
- Open your project, and then get the packages
```sh
flutter pub get
```
- Install the json rest server package using the following command
```sh
dart pub global activate json_rest_server
```
- Create the backend project
```sh
json_rest_server create .\backend
```
- Copy the files, config and database, from the following project and past it on your backend folder
```sh
https://github.com/raangelbeatriz/vakinha_burger_api
```
- Run the project using
```sh
json_rest_server run
```
- Get your ip adress and copy into the env file making a reference to the 8080 port, on the vakinha_burguer project

- On vakinha_burguer project run the project
   
   >This project was developed ❤️ by **[@Beatriz Rangel](https://www.linkedin.com/in/beatrizorangel/)**, following the classes of the Dart Week an [@Academia do Flutter](https://instituto.academiadoflutter.com.br/) code immersion.
   ---
