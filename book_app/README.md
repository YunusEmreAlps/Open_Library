<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/YunusEmreAlps/Open_Library/tree/master/book_app">
    <img src="ss/logo_feedbooks.png" alt="Logo" width="200">
  </a>

  <h3 align="center">Open Library</h3>

  <p align="center">
    READ ANYTIME, ANYWHERE
    <br />
    <a href="https://github.com/YunusEmreAlps/Open_Library/archive/refs/heads/master.zip">Download</a>
    ·
    <a href="https://github.com/YunusEmreAlps/Open_Library/issues">Report Bug</a>
    ·
    <a href="https://github.com/YunusEmreAlps/Open_Library/issues">Request Feature</a>
  </p>
</p>


<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#api">API</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#clone">Clone</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#Screenshots">Version 1 Screenshots</a></li>
    <li><a href="#Screenshots">Screenshots</a></li>
  </ol>
</details>


<!-- ABOUT THE PROJECT -->
## About The Project
READ ANYTIME, ANYWHERE
On the bus, on your break, in your bed—never be without a book. Built for book lovers, the Open Library app puts millions of books, magazines, newspapers, comics, and manga at your fingertips.

<!-- ToDo -->
## ToDo 

- [x]  Download eBooks.
- [x]  Read eBooks.
- [x]  Favorites.
- [x]  Dark Mode
- [x]  Swipe to delete downloads.
       
<!-- API -->
## API

[The Feedbooks API was used to fetch books.](https://www.programmableweb.com/api/feedbooks-rest-api-v10)

**Get all books by:**

```bash
curl https://catalog.feedbooks.com
```

**Get all popular category books by:**

```bash
curl https://catalog.feedbooks.com/top.atom
```

**Get all recent books by:**

```bash
curl https://findmentor.network/recent.atom
```

**Get all awards category books by:**

```bash
curl https://findmentor.network/awards.atom
```

**Get all sciFi category books by:**

```bash
curl https://findmentor.network/top.atom?cat=FBFIC028000
```

**Get all actionAdventure category books by:**

```bash
curl https://findmentor.network/top.atom?cat=FBFIC002000
```

**Get all mystery category books by:**

```bash
curl https://findmentor.network/top.atom?cat=FBFIC022000
```

**Get all romance category books by:**

```bash
curl https://findmentor.network/top.atom?cat=FBFIC027000
```

**Get all horror category books by:**

```bash
curl https://findmentor.network/top.atom?cat=FBFIC015000
```

<!-- GETTING STARTED -->
## 🚀 Getting Started

### Prerequisites

To run any Android application built with Flutter you need to configure the enviroments in your machine, you can do this following the the tutorial provided by Google in [Flutter website](https://flutter.dev/docs/get-started/install)

- Flutter SDK
- Android Studio (to download Android SDK)
- Xcode (for iOS develop only)
- Any IDE with Flutter SDK installed (ie. IntelliJ, Android Studio, VSCode etc)
- A little knowledge of Dart and Flutter

### Clone

- Clone this repo to your local machine using:

```
git clone https://github.com/YunusEmreAlps/Open_Library.git
```

### Setup

To run the app you need to have an online emulator or a plugged device and run the following command in the root of the application.

#### Android
```
flutter run
``` 
### iOS (_MAC Only_)

```
flutter run
``` 

<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/YunusEmreAlps/Open_Library/issues) for a list of proposed features (and known issues).

<!-- CONTRIBUTING -->
## 🤔 Contributing (Feel free to contribute!)

Awesome! Contributions of all kinds are greatly appreciated. To help smoothen the process we have a few non-exhaustive guidelines to follow which should get you going in no time.

Every night & every deploy, the spread sheet will be parsed by GitHub actions, then generate this beauty. Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

### Using GitHub Issues

- Feel free to use GitHub issues for questions, bug reports, and feature requests
- Use the search feature to check for an existing issue
- Include as much information as possible and provide any relevant resources (Eg. screenshots)
- For bug reports ensure you have a reproducible test case
  - A pull request with a breaking test would be super preferable here but isn't required

### Submitting a Pull Request

- Squash commits
- Lint your code with eslint (config provided)
- Include relevant test updates/additions

<!-- LICENSE -->
## 📝 License

Distributed under the MIT License. See `LICENSE` for more information.

## 🔌 Plugins

| Name                                                    | Usage                                               |
| ------------------------------------------------------- | --------------------------------------------------- |
| [**Provider**](https://pub.dev/packages/provider)       | State Management                                    |
| [**Object DB**](https://pub.dev/packages/objectdb)      | NoSQL database to store Favorites & Downloads       |
| [**XML2JSON**](https://pub.dev/packages/xml2json)       | Convert XML to JSON                                 |
| [**DIO**](https://pub.dev/packages/dio)                 | Network calls and File Download                     |
| [**EPub Viewer**](https://pub.dev/packages/epub_viewer) | A flutter plugin for Folioreader to read ePub files |


<!-- CONTACT -->
## 📌 Contact

- GitHub at [Jide Guru](https://github.com/JideGuru)
- Linkedin at [Yunus Emre Alpu](https://www.linkedin.com/in/yunus-emre-alpu-5b1496151/)


<!-- SCREENSHOTS -->
## Screenshots

Splash Screen              | Splash Screen            | Light               | Dark
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/YunusEmreAlps/Open_Library/blob/master/book_app/ss/1.png?raw=true)|![](https://github.com/YunusEmreAlps/Open_Library/blob/master/book_app/ss/2.png?raw=true)|![](https://github.com/YunusEmreAlps/Open_Library/blob/master/book_app/ss/3.png?raw=true)|![](https://github.com/YunusEmreAlps/Open_Library/blob/master/book_app/ss/4.png?raw=true)|

Light              | Dark            | Light               | Dark
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/YunusEmreAlps/Open_Library/blob/master/book_app/ss/5.png?raw=true)|![](https://github.com/YunusEmreAlps/Open_Library/blob/master/book_app/ss/6.png?raw=true)|![](https://github.com/YunusEmreAlps/Open_Library/blob/master/book_app/ss/7.png?raw=true)|![](https://github.com/YunusEmreAlps/Open_Library/blob/master/book_app/ss/8.png?raw=true)|

Light              | Dark             | Light               | Dark
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/YunusEmreAlps/Open_Library/blob/master/book_app/ss/9.png?raw=true)|![](https://github.com/YunusEmreAlps/Open_Library/blob/master/book_app/ss/10.png?raw=true)|![](https://github.com/YunusEmreAlps/Open_Library/blob/master/book_app/ss/11.png?raw=true)|![](https://github.com/YunusEmreAlps/Open_Library/blob/master/book_app/ss/12.png?raw=true)|

Light              | Dark             | Light               | Dark
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/YunusEmreAlps/Open_Library/blob/master/book_app/ss/13.png?raw=true)|![](https://github.com/YunusEmreAlps/Open_Library/blob/master/book_app/ss/14.png?raw=true)|![](https://github.com/YunusEmreAlps/Open_Library/blob/master/book_app/ss/15.png?raw=true)|![](https://github.com/YunusEmreAlps/Open_Library/blob/master/book_app/ss/16.png?raw=true)|

Light              | Dark             | Light               | Light
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/YunusEmreAlps/Open_Library/blob/master/book_app/ss/17.png?raw=true)|![](https://github.com/YunusEmreAlps/Open_Library/blob/master/book_app/ss/18.png?raw=true)|![](https://github.com/YunusEmreAlps/Open_Library/blob/master/book_app/ss/20.png?raw=true)|![](https://github.com/YunusEmreAlps/Open_Library/blob/master/book_app/ss/21.png?raw=true)|