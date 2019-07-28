# PocketWorks Weather App

# **Project features**

- Project allows users to search and specify favorite city/location
- Project displays weather data for this list
- Project can also request forecasted wind data
- All data are provided by the open weather API
- Good UX is to be provided

# **About the project**

- Programming Language used: Swift (5.0)
- Platform: iOS (10.0 - 12.\*)
- General architecture: Clean Architecture [Clean Swift Architecture](https://clean-swift.com/)
- The project source control follow [GitFlow](https://datasift.github.io/gitflow/IntroducingGitFlow.html) branching model
- Dependency Manager: Cocoapods

# **To build the project**

- Install dependencies using `pod install`

# Implementation:

## Preface:

- I completely understand that using Clean Swift Architecture is quite an overkill for this app, this app can easily be done with either MVC or MVVM. However, if you consider its good points:

* Ready to use xcode template to create scenes
* Fast/safe unit test coverage I think it's better IN MY CASE to use this as I have limited time only (I only had around 1 day available this week for the whole app due to I have just recently moved apartment and it takes a lot of time to do administrative stuffs like Council tax or electricity, etc.).

## Design:

- The app's design takes inspiration from Apple's weather app
- Similar transitions between screens are implemented

## Features (apart from what's required):

- Multiple Unit System in app (metric/imperial)
- Location local time (that sync with device time as well)
- Weather forecast with images
- Dynamic Weather description

## Features that could be done if had more time:

- Better local storage for caching data (Realm)
- Transition between the list screen and the details screen works better if cell has solid background -> Need to generate this dynamic background based on wind information.
- Mimic scrolling behavior on the details screen of Apple's weather app.

## Dependencies used:

- [KiNetworking](https://github.com/Kishimotovn/KiNetworking): My personal pod for fast network layer integration that uses promises for better syntax and error handling
- [Quick/Nimble](https://github.com/Quick/Nimble): Pods for faster and better Unit Test Scripts
- [IQKeyboardManagerSwift](https://github.com/hackiftekhar/IQKeyboardManager): For effortless keyboard handling

## Technical Implementation highlights:

- Custom Presentation Transitions implemented
- Async/Lazy Image Loading
- Multiple patterns: Clean Architecture, Protocol Oriented, Dependency Injections, Facade API, Singleton, High order functional programming etc.
- Multiple environments configured with easy switch with xcode schemes.
- Easy unit testing with protocols wrapping all core components of a screen.
- Activity Indicator and error handling with Promise pattern.
- Autolayout are implemented for an adaptive design.

## Some screen shots of the app:

![Home Screen](/screenshots/home.png?raw=true 'Home Screen')

![Home Screen](/screenshots/home2.png?raw=true 'Swipe to remove city')

![Details Screen](/screenshots/details.png?raw=true 'Details Screen')

![Search Screen](/screenshots/search1.png?raw=true 'Search Screen')

![Search Screen](/screenshots/search2.png?raw=true 'Search Screen')

## Project Structure

### Scenes:

The Scenes folder contains all the screens in the app, structured and grouped by the context.

In each scene folder, app's screen is implemented fully by the clean swift architures with all of its components, including:

- Models: contain the use cases for that screen
- View Controllers/ View: contain logics for the view ONLY + displaying of data
- Interactor: contain the business logics of the screen
- Presenter: contain the logic to transform raw data models to data that is suitable for displaying
- Worker: interactor's helper
- Router: routing logics from the screen

### Models:

The models folder contains all business models of the app, grouped by context

### APIOperations:

The APIOperations folder contains all operations made to the API, grouped by context

### Shared:

The shared folder contains shared helpers, shared views, services and workers around the app. Most shared elements are interacting with the app through protocols, so we can easily swap components.
