//
//  DescriptionController.swift
//  ToDoList
//
//  Created by Евгений Андронов on 10.02.2022.
//

import UIKit


class DescriptionController: UIViewController {

    var titlesArray: Array<String> = []
    var descriptionArray: Array<String> = []
    var titleFromImport : String = ""
    var descriptionOfDoFromImport : String = ""
    var indexOfSomeDo: Int = 0
    
    @IBOutlet weak var descriptionOfImportDo: UILabel!
    @IBOutlet weak var titleOfImportDo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleOfImportDo.text = titleFromImport
        descriptionOfImportDo.text = descriptionOfDoFromImport
        
        //descriptionOfImportDo.text = desc
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
