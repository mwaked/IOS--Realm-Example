## IOS-Realm-Example

Realm is a cross-platform mobile database solution designed for mobile applications that you can integrate with your iOS projects. Unlike wrappers around Core Data, Realm doesn’t rely on Core Data or even an SQLite back end.

# 1- Get Start
In the root directory of the starter project, create a new file named Podfile. Copy the following text and paste it into the newly created file:
```
platform :ios, '12.0'
use_frameworks!

target 'Agents Partner' do
  pod 'RealmSwift'
end
```
Save and close the file.
In Terminal and in the root directory of your project, run the following command:
```
pod install
```

# 2- Get File URL to open it on Realm Studio for reading and editing databases
   ```print("fileURL: \(Realm.Configuration.defaultConfiguration.fileURL!)")```
   
This line prints the database location to the debug console. It’s a short step to then browse the database using the Realm Browser.
Build and run your app, and you’ll see that it reports the location of the database in the Xcode console.
The easiest way to go to the database location is to open Finder, press Shift-Command-G and paste in the path your app reported.

Download Realm Studio: https://docs.realm.io/sync/realm-studio

![](https://github.com/mwaked/IOS--Realm-Example/blob/main/Screen%20Shot%202020-11-08%20at%2010.05.15%20AM.png?v=4&s=200)

# 3- Create Data Class
```
import Foundation
import RealmSwift
class Country: Object {
  @objc dynamic var id = 0
  @objc dynamic var name = ""
  @objc dynamic var isFav = false
}
```

# 4- Get the Data
```
let realm = try! Realm()
    lazy var countries: Results<Country> = { self.realm.objects(Country.self) }()
```

# 5- Add Data
```
 try! realm.write {
        let country = Country()
        country.id = 1
        country.name = "Egypt"
        realm.add(country)
      }     
```

# 6- Update Data
```
 let countries = realm.objects(Country.self).filter("id = \(id)")
        let realm = try! Realm()
        if let country = countries.first {
            try! realm.write {
                country.isFav = isFav
            }
        }
```

# 7- Delete Data
``` realm.delete()```
    
