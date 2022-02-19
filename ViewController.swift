import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var timeFromDo: UIDatePicker!
    @IBOutlet weak var todoTableView: UITableView!
    
    var timenow: Double = 1643716380.0

    var titlesArr: Array <String> = []
    var indexArray: Array <Int> = []
    var indexOfDo: Int = 0
    
    let realm = try! Realm()
    
    @IBAction func refrashButton(_ sender: Any ){
        for _ in 1 ... 2{
            TitleReturn()
            timenow = TimeReset()
            self.todoTableView.reloadData()
            print(Realm.Configuration.defaultConfiguration.fileURL!)
        }
    }
    

    func TimeReset() -> Double{
        timenow = Double(self.timeFromDo?.date.timeIntervalSince1970 ?? timenow)
        return timenow
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesArr.count
    }
    
    
    func TitleReturn(){
       
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "titleDoCell") as! CellDescription
        cell.titleOfDoFromRealm.text = ""
        
        titlesArr.removeAll()
        indexArray.removeAll()
      
        
        for i in realm.objects(UserData.self).indices{
            
            let takeDo = realm.object(ofType: UserData.self, forPrimaryKey: i)
            
            let timeOfDoStart = Double(takeDo?.timeStart ?? 0)
            let timeOfDoFinish = Double(takeDo?.timeFinish ?? 0)
         
            if (timeOfDoStart <= timenow) && (timeOfDoFinish >= timenow) {
                let title = String(takeDo?.titleOfDo ?? "")
                let indexOfDoFromRealm = Int(takeDo?.id ?? 0) 
                   
                indexArray.append(indexOfDoFromRealm)
                titlesArr.append(title)
                
            }
        }
    }
    
    //---------------------------------------------
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "titleDoCell",  for: indexPath) as! CellDescription
        cell.titleOfDoFromRealm?.text = self.titlesArr[indexPath.row]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
           guard segue.identifier == "descriptionOfDo" else {return}
           guard let destination = segue.destination as? DescriptionController else { return }
        
        let titleCellSelected = todoTableView.indexPathForSelectedRow!.row
        destination.indexOfSomeDo = indexArray[titleCellSelected]
               
    }
}


