//
//  JDHomeViewController.swift
//  Jarus Demo
//
//  Created by Vinay Nation on 05/01/21.
//

import UIKit


class JDHomeViewController: UIViewController {

    
    // MARK: - Properties
    
    private let tableView = UITableView()
    private let viewModel = JDVehicleViewModel()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Choose Equipment"
        self.view.backgroundColor = .green
        self.configureTableview()
        self.setupTableView()
        
        self.viewModel.reloadTableToController = {
            self.tableView.reloadData()
        }
        
        
        self.viewModel.reloadSections = { [weak self] (section: Int) in
            self?.tableView.beginUpdates()
            self?.tableView.reloadSections([section], with: .fade)
            self?.tableView.endUpdates()
        }
    }
    
    
    //MARK: Functions
    
    /// Confingure  the table View
    func configureTableview() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.dataSource = viewModel
        tableView.delegate = viewModel
        tableView.register(JDTableViewCell.self, forCellReuseIdentifier: JDTableViewCell.cellId)
        tableView.register(JDTableViewHeader.self, forHeaderFooterViewReuseIdentifier: JDTableViewHeader.headerId)
    }
    
    /// Setup Tableview Layout
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    
        
    

}


