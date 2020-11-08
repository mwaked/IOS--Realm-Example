
import Foundation
import RealmSwift
import Realm

class Country: Object {
  @objc dynamic var id = 0
  @objc dynamic var name = ""
  @objc dynamic var isFav = false
}

