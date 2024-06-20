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

- **`lib/`**: This directory contains the main logic of the application.
  - **`core/`**: Core functionalities and utilities used throughout the app.
  - **`config/`**: Contains configuration files specific to the application setup.
  - **`features/`**: Each feature of the application resides in its own directory under `features/`.
    - **`feature_name/`**: Replace `feature_name` with the actual name of each feature.
       - **`data/`**: Manages data layer operations such as API integrations and data sources.
       - **`domain/`**: Contains domain logic including entities, repositories, and use cases.
       - **`presentation/`**: Presentation layer using BLoC for state management, UI widgets, and screens.
          - **`blocs/`**: Business Logic Components (BLoCs) managing app state.
          - **`screens/`**: Different UI screens of the application.
          - **`widgets/`**: Reusable UI components and widgets.
- **`assets/`**: Stores static assets such as images that are used in various parts of the application.
- **`pubspec.yaml`**: The project's configuration file where dependencies and metadata are specified.
- **`README.md`**: This Markdown file contains documentation and information about the project structure, features, and usage instructions.

This structure helps organize the project into logical components, making it easier to navigate and understand the codebase.



## 📸 Screenshots

Here are some screenshots of the app:

<img src="https://github.com/Mariam-Elkhelawy/route_movie_app/assets/112530709/ea067b78-ca1d-4646-b706-80531a1a4579" alt="Splash Screen" height="400"> &emsp; <img src="https://github.com/Mariam-Elkhelawy/route_movie_app/assets/112530709/0e187550-a375-462b-8a3c-4905f076df86" alt="Home Screen" height="400"> &emsp; <img src="https://github.com/Mariam-Elkhelawy/route_movie_app/assets/112530709/7bfdde0d-a1e6-4145-8eea-b4526927eb0b" alt="Details Screen" height="400">  &emsp;  <img src="https://github.com/Mariam-Elkhelawy/route_movie_app/assets/112530709/36d68163-30b5-46ad-b7eb-e4b0c8b66b90" alt="Search Screen" height="400">

<img src="https://github.com/Mariam-Elkhelawy/route_movie_app/assets/112530709/47abf7a8-7797-4c9d-8e46-2c0d48aa0231" alt="Search Screen" height="400">  &emsp; <img src="https://github.com/Mariam-Elkhelawy/route_movie_app/assets/112530709/d7278c79-eaba-4edc-871f-d03230ada224" alt="Category Screen" height="400"> &emsp; <img src="https://github.com/Mariam-Elkhelawy/route_movie_app/assets/112530709/2b5c7c6b-076a-45c9-af3e-40ef6cb7d782" alt="Category Screen" height="400"> &emsp; <img src="https://github.com/Mariam-Elkhelawy/route_movie_app/assets/112530709/c4972a4b-eb33-4b70-a0ad-f0cfe4325eb7" alt="Category Details Screen" height="400">



<img src="https://github.com/Mariam-Elkhelawy/route_movie_app/assets/112530709/30d09c01-6842-424b-a38e-4fc5fc9c9f01" alt="Bookmark Screen" height="400">  &emsp; <img src="https://github.com/Mariam-Elkhelawy/route_movie_app/assets/112530709/70d04f88-7205-42e6-a627-ba7bbed0c0c9" alt="Bookmark Screen" height="400">

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


## 👥 Contributors

- **Omnia Nabil** - [Omnia-97](https://github.com/Omnia-97)
- **Mariam Elkhelawy** - [Mariam-Elkhelawy](https://github.com/Mariam-Elkhelawy)





