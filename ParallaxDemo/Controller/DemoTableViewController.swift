//
//  DemoTableViewController.swift
//  ParallaxDemo
//
//  Created by WU CHIH WEI on 2017/6/15.
//  Copyright © 2017年 WU CHIH WEI. All rights reserved.
//

import UIKit

class DemoTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }

    func setUp() {

        view.backgroundColor = UIColor.white

        automaticallyAdjustsScrollViewInsets = false
        
        tableView.delegate = self
        
        tableView.dataSource = self

        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        tableView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor).isActive = true
    }
    
    // MARK: UITableView DataSource and Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "DemoCell")
        
        cell.textLabel?.text = "Demo \(indexPath.row) row"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
}
