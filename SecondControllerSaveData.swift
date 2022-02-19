//
//  SecondControllerSaveData.swift
//  ToDoList
//
//  Created by Евгений Андронов on 31.01.2022.
//

import UIKit
import RealmSwift

class SecondControllerSaveData: UIViewController {
    
    @IBOutlet weak var titleOfDo: UITextField!
    @IBOutlet weak var descriptionOfDo: UITextField!
    @IBOutlet weak var saveData: UIButton!
    @IBOutlet weak var dateTime: UIDatePicker!
    
    @IBAction func saveData(_ sender: Any) {
        
        let realm = try! Realm()
          
        let titleOfDoNew = self.titleOfDo.text
        let descriptionOfDoNew = self.descriptionOfDo.text
        let timeInMls = self.dateTime?.date.timeIntervalSince1970
        let timeFinInMls = self.dateTime?.date.timeIntervalSince1970
        
        var List : Results<UserData>{
            get {
                let realm = try! Realm()
                return realm.objects(UserData.self)
            }
        }
        
        func newIdForUser() -> Int{
            let t = List.max(ofProperty: "id") as Int?
            if let _t = t{
                return _t+1
            }else{
                return 0
            }
            
        }
        
        
        let user = UserData(value: ["id":newIdForUser(),
                                    "descriptionOfDo":String(descriptionOfDoNew!),
                                    "titleOfDo":String(titleOfDoNew!),
                                    "timeStart":Double(timeInMls!),
                                    "timeFinish":Double(timeFinInMls! + 300)
                                   ])
        
        try! realm.write{
            realm.add(user, update: .all)
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
