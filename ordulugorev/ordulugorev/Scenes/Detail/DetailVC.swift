//
//  DetailVC.swift
//  ordulugorev
//
//  Created by Furkan Oğuz on 19.02.2022.
//

import UIKit

class DetailVC: BaseVC {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dorduncuLabel: UILabel!
    @IBOutlet weak var ucuncuLabel: UILabel!
    @IBOutlet weak var ikinciLabel: UILabel!
    @IBOutlet weak var ilkLabel: UILabel!
    var viewModel: DetailVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.data.name ?? "yok"
        ilkLabel.text = "ID: " + (viewModel.data.id ?? "yok")
        ikinciLabel.text = "Info: " + (viewModel.data.info ?? "yok")
        ucuncuLabel.text = "StartDate: " + (viewModel.data.dates?.start?.dateTime ?? "yok")
        dorduncuLabel.text = "Age Restrictions: \(viewModel.data.ageRestrictions?.legalAgeEnforced ?? false)"
        
        if let url = viewModel.data.images?[0].url {
            imageView.load(url: URL(string: url)!)
        }
    }
}
