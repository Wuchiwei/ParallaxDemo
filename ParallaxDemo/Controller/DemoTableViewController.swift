//
//  DemoTableViewController.swift
//  ParallaxDemo
//
//  Created by WU CHIH WEI on 2017/6/15.
//  Copyright © 2017年 WU CHIH WEI. All rights reserved.
//

import UIKit

class DemoTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let imageViewHeight: CGFloat = 200.0
    
    let tableView = UITableView()
    
    let imageView = UIImageView()
    
    var imageViewTopConstraint: NSLayoutConstraint?
    
    var imageViewHeightConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }

    func setUp() {

        view.backgroundColor = UIColor.white

        automaticallyAdjustsScrollViewInsets = false

        setUpTableView()
        
        setUpImageView()
    }
    
    func setUpTableView() {
        
        tableView.contentInset = UIEdgeInsets(top: imageViewHeight, left: 0, bottom: 0, right: 0)
        
        tableView.contentOffset = CGPoint(x: 0, y: -imageViewHeight)
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        tableView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor).isActive = true
    }
    
    func setUpImageView() {
        
        imageView.image = UIImage(named: "kaohsiung")
        
        imageView.contentMode = .scaleAspectFill
        
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        
        imageViewTopConstraint = imageView.topAnchor.constraint(equalTo: view.topAnchor)
        
        imageViewTopConstraint?.isActive = true
        
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        imageViewHeightConstraint = imageView.heightAnchor.constraint(equalToConstant: imageViewHeight)
        
        imageViewHeightConstraint?.isActive = true
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if (scrollView.contentOffset.y > -imageViewHeight) && (scrollView.contentOffset.y < 20) {
            
            changeImageViewTopConstraint(contentOffset: scrollView.contentOffset)
            
        } else if scrollView.contentOffset.y <= -imageViewHeight {
            
            changeImageViewHeightConstraint(contentOffset: scrollView.contentOffset)
        }
    }
    
    func changeImageViewTopConstraint(contentOffset: CGPoint) {
        
        imageViewTopConstraint?.isActive = false
        
        imageViewHeightConstraint?.isActive = false
        
        imageViewTopConstraint = imageView.topAnchor.constraint(
            equalTo: view.topAnchor,
            constant: -(contentOffset.y - (-imageViewHeight))
        )
        
        imageViewHeightConstraint = imageView.heightAnchor.constraint(equalToConstant: imageViewHeight)
        
        imageViewTopConstraint?.isActive = true
        
        imageViewHeightConstraint?.isActive = true
        
        view.layoutIfNeeded()
    }
    
    func changeImageViewHeightConstraint(contentOffset: CGPoint) {
        
        imageViewTopConstraint?.isActive = false
        
        imageViewHeightConstraint?.isActive = false
        
        imageViewTopConstraint = imageView.topAnchor.constraint(equalTo: view.topAnchor)
        
        imageViewHeightConstraint = imageView.heightAnchor.constraint(equalToConstant: -contentOffset.y)
        
        imageViewTopConstraint?.isActive = true
        
        imageViewHeightConstraint?.isActive = true
        
        view.layoutIfNeeded()
    }
}
