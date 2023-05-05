//
//  SSSTableViewCell.swift
//  myDream
//
//  Created by Bircan Sezgin on 5.05.2023.
//

import UIKit

class SSSTableViewCell: UITableViewCell {
    
    @IBOutlet weak var soruBasligiLabel: UILabel!
    @IBOutlet weak var cevapLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
