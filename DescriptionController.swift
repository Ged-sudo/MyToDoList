//
//  DescriptionController.swift
//  ToDoList
//
//  Created by Евгений Андронов on 10.02.2022.
//

import UIKit
import RealmSwift

class DescriptionController: UIViewController {

   
    

  
    var indexOfSomeDo: Int = 0
    
    @IBOutlet weak var descriptionOfImportDo: UILabel!
    @IBOutlet weak var titleOfImportDo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        let exemplarOfDo = realm.object(ofType: UserData.self, forPrimaryKey: indexOfSomeDo)
        
        print(indexOfSomeDo)
        titleOfImportDo.text = exemplarOfDo?.titleOfDo
        descriptionOfImportDo.text = exemplarOfDo?.descriptionOfDo
        
      
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
