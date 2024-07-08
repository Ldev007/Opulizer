# Opulizer

An app made to simulate a real-time opinion trading environment to visualize the data points generated in real-time, representing opinions and their probabilities over time on a line chart.

### 📄 Requirements :

- Flutter >= 3.22.2
- Dart >= 3.4.3
- Google account to use Firebase and it's services

### :gear: Steps to run :

1. Setup and test run backend service [from here](https://github.com/Ldev007/opulator)
2. Clone the repo : ```git clone https://github.com/Ldev007/opulizer.git```
3. Configure and setup Firebase, know how [from here](https://firebase.google.com/docs/flutter/setup?platform=android)

:warning: Note: Follow only till [Step-3](https://firebase.google.com/docs/flutter/setup?platform=android#configure-firebase)

4. Configure and setup Firebase Cloud Firestore know how [from here](https://firebase.google.com/docs/firestore/quickstart#dart)
5. Execute : ```flutter pub get```
6. Execute : ```flutter run --debug```
7. Follow on-screen instructions to start generating data and visualize it in Opulizer (To know the ip address of your machine, open a command prompt window and execute this command in it - ```ipconfig```. Use the value of IPv4 in the app)

---

### Following technologies and libraries have been used :

#### :lipstick: Frontend

- Flutter SDK
  - fl_chart
  - riverpod
  - freezed
  - http
  - intl
  - firebase_core & cloud_firestore
  - json_serializable

#### :hammer_and_wrench: Backend

- Java
  - Spring Boot
  - Spring MVC
  - Firebase Cloud Firestore

#### :office: Structural design pattern

- MVC
