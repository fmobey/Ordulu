//
//  HomeCell.swift
//  ordulugorev
//
//  Created by Furkan Oğuz on 19.02.2022.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var iceriView: UIView!
    
    @IBOutlet weak var isim: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.iceriView.layer.cornerRadius = 20
        self.iceriView.layer.borderWidth = 1
        self.iceriView.layer.borderColor = UIColor.black.cgColor
        // Initialization code
    }
    
    func configure(data: Event) {
        isim.text = data.name ?? ""
    }
    
}

extension HomeCell {
    static var identifier: String {
        String(describing: self)
    }
    static var Nibs: UINib {
        UINib(nibName: identifier, bundle: nil)
    }
}
