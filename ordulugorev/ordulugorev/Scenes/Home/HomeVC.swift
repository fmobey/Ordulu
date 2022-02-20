//
//  HomeVC.swift
//  ordulugorev
//
//  Created by Furkan Oğuz on 19.02.2022.
//

import UIKit

class HomeVC: BaseVC {
    @IBOutlet private weak var tableView: UITableView!
    
    @IBOutlet weak var searchText: UITextField!
    
    
    var viewModel: HomeVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Ana Sayfa"
        tableView.backgroundColor = .blue.withAlphaComponent(0.1)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeCell.Nibs, forCellReuseIdentifier: HomeCell.identifier)
        tableView.separatorStyle = .none
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.setHidesBackButton(true, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.reloadTableView = {
            self.tableView.reloadData()
        }
        viewModel.getData()
    }
    
    @IBAction func aramaTiklandi(_ sender: Any) {
        if let text = searchText.text {
            viewModel.aramaYap(text: text)
        }
        
    }
    
    @IBAction func siralaTiklandi(_ sender: Any) {
        viewModel.sirala()
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.identifier, for: indexPath) as! HomeCell
        //cell.textLabel?.text = viewModel.events[indexPath.row].name
        cell.selectionStyle = .none
        cell.configure(data: viewModel.events[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = DetailVC.instantiate(storyboard: .main, bundle: nil, identifier: nil)
        let newViewModel = DetailVM(data: viewModel.events[indexPath.row])
        viewController.viewModel = newViewModel
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
