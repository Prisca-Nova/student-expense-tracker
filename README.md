Student Finance Manager
The Student Finance Manager is a Flutter-based mobile application designed to help students manage their finances effectively. It allows users to track expenses, set budgets, manage savings goals, and generate reports.

Features
Expense Tracking: Add, edit, and delete expenses with details like amount, category, and date.

Budget Management: Set and track monthly budgets.

Savings Goals: Create and monitor savings goals with target amounts and deadlines.

Reports: View detailed reports of expenses and savings.

User Authentication: Secure login and logout functionality.

Dark Mode: Toggle between light and dark themes.

Technologies Used
Flutter: A UI toolkit for building natively compiled applications.

Hive: A lightweight and fast NoSQL database for local storage.

Provider: State management for Flutter applications.

Fl Chart: A library for creating beautiful charts and graphs.

Getting Started
Prerequisites
Flutter SDK: Ensure you have Flutter installed. If not, follow the official installation guide.

Android Studio or VS Code: For development and debugging.

Android Emulator or Physical Device: To run the app.

Installation
Clone the Repository:

bash
Copy
cd student-finance-manager
Install Dependencies:

bash
Copy
flutter pub get
Run the App:

bash
Copy
flutter run
Project Structure
Copy
student-finance-manager/
├── android/
├── assets/
├── ios/
├── lib/
│   ├── models/
│   │   ├── budget.dart
│   │   ├── expense.dart
│   │   ├── saving_goal.dart
│   ├── screens/
│   │   ├── auth_screen.dart
│   │   ├── budget_screen.dart
│   │   ├── dashboard_screen.dart
│   │   ├── expense_form_screen.dart
│   │   ├── expense_list_screen.dart
│   │   ├── home_screen.dart
│   │   ├── reports_screen.dart
│   │   ├── savings_screen.dart
│   │   ├── settings_screen.dart
│   │   ├── welcome_screen.dart
│   ├── utils/
│   │   ├── db_helper.dart
│   ├── widgets/
│   │   ├── budget_progress.dart
│   │   ├── category_item.dart
│   │   ├── chart_widget.dart
│   │   ├── expense_form.dart
│   │   ├── expense_item.dart
│   ├── main.dart
├── pubspec.yaml
Usage
Adding an Expense
Navigate to the Home Screen.

Click the + button to open the Expense Form.

Enter the expense details (amount, description, date, etc.).

Click Save to add the expense.

Setting a Budget
Navigate to the Budget Screen.

Enter your monthly budget amount.

Click Save to set the budget.

Creating a Savings Goal
Navigate to the Savings Screen.

Click the + button to add a new savings goal.

Enter the goal details (name, target amount, deadline, etc.).

Click Save to create the goal.

Viewing Reports
Navigate to the Reports Screen.

View a summary of your expenses and savings.

Changing Settings
Navigate to the Settings Screen.

Toggle Dark Mode, enable/disable Notifications, or enable Biometric Authentication.

Contributing
Contributions are welcome! If you'd like to contribute, please follow these steps:

Fork the repository.

Create a new branch (git checkout -b feature/YourFeatureName).

Commit your changes (git commit -m 'Add some feature').

Push to the branch (git push origin feature/YourFeatureName).

Open a pull request.


Acknowledgments


Hive: For providing a lightweight and fast local database.

Fl Chart: For enabling beautiful charts in the app.

Contact
For any questions or feedback, feel free to reach out:

Your Name: priscabirindwa5@gmail.com

GitHub: Prisca-Nova
