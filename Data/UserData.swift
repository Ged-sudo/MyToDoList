//
//  UserData.swift
//  ToDoList
//
//  Created by Евгений Андронов on 31.01.2022.
//

import UIKit
import RealmSwift


class UserData: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var titleOfDo: String = ""
    @objc dynamic var descriptionOfDo: String = ""
    @objc dynamic var timeStart: Double = 0
    @objc dynamic var timeFinish: Double = 0
    
    override static func primaryKey() -> String? {
            return "id"
        }
  //
}
