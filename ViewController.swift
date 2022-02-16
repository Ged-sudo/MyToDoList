//
//  ViewController.swift
//  ToDoList
//
//  Created by Евгений Андронов on 31.01.2022.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var timeFromDo: UIDatePicker!
    @IBOutlet weak var todoTableView: UITableView!
    
    var timenow: Double = 1644397200.0
    
    var titlesArr: Array <String> = []
    var descriptionsArr: Array <String> = []
    var indexOfDo: Int = 0
    
    let realm = try! Realm()
    
    //---------------------------------------------
    @IBAction func refrashButton(_ sender: Any ){
        DispatchQueue.main.async { [self] in
            TitleReturn()
            self.timenow = TimeReset()
            self.todoTableView.reloadData()
        }
    }
    
    //---------------------------------------------
    func TimeReset() -> Double{
        timenow = Double(self.timeFromDo?.date.timeIntervalSince1970 ?? 1644397200.0)
        return timenow
    }
    
    //---------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
    }

    //---------------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
      
        return self.titlesArr.count
    }
    
    //---------------------------------------------
    
    var titleName = ""
    var descNew = ""
    
    func enterTitleName(st : String, descriptionofdo: String){
        titleName = st
        descNew = descriptionofdo
        
    }
    
    //---------------------------------------------
    
    func TitleReturn(){
       
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "titleDoCell") as! CellDescription
        cell.titleOfDoFromRealm.text = ""
        print(timenow)
        
        titlesArr.removeAll()
        descriptionsArr.removeAll()
        
        for i in realm.objects(UserData.self).indices{
            
            let takeDo = realm.object(ofType: UserData.self, forPrimaryKey: i)
            
            let timeOfDoStart = Double(takeDo?.timeStart ?? 0)
            let timeOfDoFinish = Double(takeDo?.timeFinish ?? 0)
         
            if (timeOfDoStart <= timenow) {
                if (timeOfDoFinish >= timenow){
                    let title = String(takeDo?.titleOfDo ?? "")
                    let description = String(takeDo?.descriptionOfDo ?? "")
                    
                    titlesArr.append(title)
                    descriptionsArr.append(description)
                  
                    
                }
            }
        }
    }
    
    //---------------------------------------------
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "titleDoCell",  for: indexPath) as! CellDescription
        cell.titleOfDoFromRealm?.text = self.titlesArr[indexPath.row]
        return cell
    }
    
    //---------------------------------------------
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "descriptionOfDo" else { return }
        guard let destination = segue.destination as? DescriptionController else { return }
            
        destination.titlesArray = titlesArr
        destination.descriptionArray = descriptionsArr
        destination.indexOfSomeDo = indexOfDo
        
    }
    
    
}

