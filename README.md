# 🎬 Route Movie App 🍿

Welcome to the Flutter Movie App repository! This project aims to provide users with access to popular and newly released movies. Users can explore movie suggestions, search for specific films, view movie details including synopsis and genre, and even bookmark their favorite movies for later viewing.

This project is our graduation project from Route Academy.

## ✨ Features

- **🎥 Display Movies:** Browse popular and new movies.
- **🔍 Search Functionality:** Search for movies using keywords.
- **✨ Browse Trending Movies:** Stay up-to-date with the latest and hottest films currently in theaters.
- **📂 Categories:** Browse movies by different categories for better navigation.
- **🎥 Movie Details:** Get comprehensive information about each movie, including its storyline and genre.
- **🎭 Genre-based Recommendations:** Discover similar movies based on genre preferences.
- **🔖 Bookmarking:** Save your favorite movies to a bookmark list for easy access later.
- **🔥 Firebase Integration:** Store user data and bookmarks securely in Firebase.
- **🌐 API Integration:** Fetch movie data from a movie database API.
- **📱 Responsive Design:** Enjoy a seamless experience across various screen sizes and devices.

## 🛠️ Technologies Used

- **📦 State Management:** BLoC (Business Logic Component)
- **🏛️ Architecture:** Clean Architecture
- **☁️ Backend:** Firebase (Firestore, Authentication)
- **🔗REST APIs:** Movie database API (TMDb API)

## 📁 Project Structure

The project structure is organized according to the Clean Architecture principles:

- **`lib/`**: Contains the main application logic.
  - **`core/`**: Core functionalities and utilities used throughout the app.
  - **`data/`**: Data layer containing API integrations and data sources.
  - **`domain/`**: Domain layer with entities, repositories, and use cases.
  - **`presentation/`**: Presentation layer using BLoC for state management, UI widgets, and screens.
    - **`blocs/`**: Business Logic Components (BLoCs) managing app state.
    - **`screens/`**: Different UI screens of the application.
    - **`widgets/`**: Reusable UI components and widgets.
- **`assets/`**: Contains static assets such as images used in the app.
- **`pubspec.yaml`**: Configuration file specifying dependencies and metadata for the Flutter project.
- **`README.md`**: Markdown file containing project documentation and information.

This structure helps organize the project into logical components, making it easier to navigate and understand the codebase.

## 📸 Screenshots

Here are some screenshots of the app:

![Home Screen](screenshots/home_screen.png)
*Home Screen: Displaying popular and new movies.*

![Search Screen](screenshots/search_screen.png)
*Search Screen: Searching for movies.*

![Category Screen](screenshots/category_screen.png)
*Category Screen: Browsing movies by categories.*

![Bookmark Screen](screenshots/bookmark_screen.png)
*Bookmark Screen: Viewing bookmarked movies.*

## 🚀 Installation

1. **Clone the repository:**
   
   ```bash
   git clone https://github.com/Mariam-Elkhelawy/route_movie_app.git

2. **Navigate to the project directory:**
   
   ```bash
   cd route_movie_app

3. **Install the dependencies:**

   ```bash
   flutter pub get
   
4. **Run the application:**
   ```bash
    flutter run

## Getting Started

To get started with the Flutter Movie App, follow these steps:


1. Clone the Repository: git clone https://github.com/yourusername/flutter-movie-app.git
   
2. Set Up Firebase: Connect the app to your Firebase project and configure Firebase Cloud Store. 

3. Install Dependencies: Run flutter pub get to install all necessary dependencies.

4. Run the App: Launch the app on your preferred emulator or physical device using flutter run.

## Contributions

Contributions to the Flutter Movie App project are highly encouraged and welcomed! Feel free to submit pull requests for new features, bug fixes, or any improvements you deem necessary.

## Credits:
This project is maintained by Omnia-97 and Mariam-Elkhelawy.
