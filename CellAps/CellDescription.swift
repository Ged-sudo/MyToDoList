//
//  CellDescription.swift
//  ToDoList
//
//  Created by Евгений Андронов on 31.01.2022.
//

import UIKit

class CellDescription: UITableViewCell {

    @IBOutlet weak var titleOfDoFromRealm: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
