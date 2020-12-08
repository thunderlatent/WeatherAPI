//
//  ListViewController.swift
//  WeatherAPI
//
//  Created by Jimmy on 2020/12/7.
//

import UIKit

class ListViewController: UIViewController {
    //MARK:- Properties
    //MARK:- UI Element
    var listTableView = UITableView()
    
    
    
    
    //MARK:- override Function
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupAllUserInterface()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.tintColor = .white
    }

    //MARK: - Setup All UserInterface
    func setupAllUserInterface()
    {
        
        let backgroundView = UIImageView(image: UIImage(named: "cityBackground"))
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        setupListTableView()
    }
    func setupListTableView()
    {
        self.view.addSubview(listTableView)
        listTableView.backgroundColor = .clear

        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.register(ListTableViewCell.self, forCellReuseIdentifier: Identifier.listTableViewCell.rawValue)
        listTableView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(view.snp.topMargin)
            make.bottom.equalTo(view.snp.bottomMargin)
        }
    }

   

}
