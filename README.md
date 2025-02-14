

# Flash-Chat

![gif](https://github.com/kawgh1/Flash-Chat-iOS13/blob/master/chatapp.gif?raw=true)

## Our Goal


Flash Chat is an internet based messaging app similar to WhatsApp, the popular messaging app that was bought by Facebook for $22 billion. We will use  Firebase Firestore as a backend database to store and retrieve our messages from the cloud. 

### Showing and Hiding the Navigation Bar in a View Controller

![hideshow](https://raw.githubusercontent.com/kawgh1/Flash-Chat-iOS13/master/hideShowNavBar1.png)


### Libraries Used

- `IQ Keyboard Manager` -- https://github.com/hackiftekhar/IQKeyboardManager
- `Firebase Firestore` -- https://firebase.google.com
- `CLTypingLabel` -- https://cocoapods.org/pods/CLTypingLabel

### Firebase Flow

![firebase](https://raw.githubusercontent.com/kawgh1/Flash-Chat-iOS13/master/Firebase%20Authentication1.png)

### Topics Learned

* How to integrate third party libraries in your app using Cocoapods and Swift Package Manager.
* How to store data in the cloud using Firebase Firestore.
* How to query and sort the Firebase database.
* How to use Firebase for user authentication, registration and login.
* How to work with UITableViews and how to set their data sources and delegates.
* How to create custom views using .xib files to modify native design components.
* How to embed View Controllers in a Navigation Controller and understand the navigation stack.
* How to create a constants file and use static properties to store Strings and other constants.
* Learn about Swift loops and create animations using loops.
* Learn about the App Lifecycle and how to use viewWillAppear or viewWillDisappear.
* How to create direct Segues for navigation.


#### Constants
```
struct K {
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}

```
