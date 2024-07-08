# Opulizer

An app made to simulate a real-time opinion trading environment to visualize the data points generated in real-time, representing opinions and their probabilities over time on a line chart.

##### Requirements :

- JDK > 17
- Flutter >= 3.22.2
- Dart >= 3.4.3
- Eclipse IDE >= 4.27.0
- Google account to use Firebase and it's services

##### How to run locally :

1. Clone the Opulator [from here](https://github.com/Ldev007/opulator)
2. Open the firebase console -> Create new project -> Open project settings -> Open the "Service accounts" tab
3. Under "Service accounts" tab under "Admin SDK configuration snippet" click "Generate new private key" button
4. Import the previously cloned project "Opulator" in Eclipse IDE and then place the key downloaded in previous step at ```src/main/resources/config```
5. Configure and setup Firebase know how [from here](https://firebase.google.com/docs/flutter/setup?platform=android)

:warning: Note: Follow only till [Step-3](https://firebase.google.com/docs/flutter/setup?platform=android#configure-firebase)

2. Configure and setup Firebase Cloud Firestore know how [from here](https://firebase.google.com/docs/firestore/quickstart#dart)
3. Compile/without compiling run the backend. To know how [head here](https://github.com/Ldev007/opulator)
4. Clone the repo : ```git clone https://github.com/Ldev007/opulizer.git```
5. Execute : ```flutter pub get```
6. Execute : ```flutter run --debug```
7. Follow on-screen instructions to start generating data and visualize it in Opulizer (To know the ip address of your machine, open a command prompt window and execute this command in it - ```ipconfig```. Use the value of IPv4 in the app)

---

##### Following technologies and libraries have been used :

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
