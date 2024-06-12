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
- **☁️ Backend:** Firebase (Firestore)
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

<img src="https://github.com/Mariam-Elkhelawy/route_movie_app/assets/112530709/ea067b78-ca1d-4646-b706-80531a1a4579" alt="Splash Screen" height="400">


<img src="https://github.com/Mariam-Elkhelawy/route_movie_app/assets/112530709/ea067b78-ca1d-4646-b706-80531a1a4579" alt="Splash Screen" height="400">

*Home Screen: Displaying popular and new movies.*


<img src="https://github.com/Mariam-Elkhelawy/route_movie_app/assets/112530709/36d68163-30b5-46ad-b7eb-e4b0c8b66b90" alt="Search Screen" height="400"> 
<img src="https://github.com/Mariam-Elkhelawy/route_movie_app/assets/112530709/282355a1-9cd9-46eb-80fb-09a0caaa3642" alt="Search Screen" height="400">

*Search Screen: Searching for movies.*

<img src="https://github.com/Mariam-Elkhelawy/route_movie_app/assets/112530709/36d68163-30b5-46ad-b7eb-e4b0c8b66b90" alt="Category Screen" height="400">  <img src="https://github.com/Mariam-Elkhelawy/route_movie_app/assets/112530709/282355a1-9cd9-46eb-80fb-09a0caaa3642" alt="Category Screen" height="400">

*Category Screen: Browsing movies by categories.*

<img src="screenshots/bookmark_screen.png" alt="Bookmark Screen" height="400">
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
## ⚙️ Configuration

To use the movie database API and Firebase, follow these steps to configure your project:

### Movie Database API:

1. **Sign up for an API key** from a movie database provider (e.g., TMDb).
2. **Add the API key** to the appropriate configuration file in your project.

### Firebase:

1. **Create a Firebase project** and configure Firestore.
2. **Download the `google-services.json`** file and place it in the `android/app` directory of your Flutter project.
3. **Add your Firebase configuration** to the project.

## 🤝 Contributing

Contributions are welcome! If you'd like to contribute, please follow these steps:

1. Fork the repository.
2. Create your feature branch (`git checkout -b feature/YourFeature`).
3. Commit your changes (`git commit -am 'Add some feature'`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Open a Pull Request.

## 👥 Contributors

- **Omnia Nabil** - [Omnia-97](https://github.com/Omnia-97)
- **Mariam Elkhelawy** - [Mariam-Elkhelawy](https://github.com/Mariam-Elkhelawy)

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.



