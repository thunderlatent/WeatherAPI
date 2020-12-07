//
//  ShowDataViewController.swift
//  RedSoRefactor
//
//  Created by Jimmy on 2020/11/24.
//

import UIKit


class ShowDataViewController: UIViewController {
    //MARK: - Properties
    var isLoading: Bool = false
    var usableData: [List] = []
    //MARK: - UI Element
    var showDataTableView = UITableView()
    
    //MARK: - Override Function
    init(usableData:[List])
    {
        super.init(nibName: nil, bundle: nil)
        self.usableData = usableData
        isLoading = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDataTableView.delegate = self
        showDataTableView.dataSource = self
        setupTableView()
        
        setupRefreshData()
    }
    //MARK: - Setup UI
    func setupTableView()
    {
        self.view.addSubview(showDataTableView)
        showDataTableView.register(ShowDataTableViewCell.self, forCellReuseIdentifier: Identifier.showDataCell.rawValue)
        showDataTableView.register(ShowBannerTableViewCell.self, forCellReuseIdentifier: Identifier.showBannerCell.rawValue)
        showDataTableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        showDataTableView.backgroundColor = .defaultTheme
        showDataTableView.allowsSelection = false
        showDataTableView.separatorStyle = .none
    }
    func setupRefreshData()
    {
        showDataTableView.refreshControl = UIRefreshControl()
        showDataTableView.refreshControl?.backgroundColor = .defaultTheme
        showDataTableView.refreshControl?.tintColor = .white
        showDataTableView.refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    //MARK: - Refresh Event
    @objc func refreshData()
    {
        if showDataTableView.refreshControl?.isRefreshing == true
        {
            showDataTableView.refreshControl?.isUserInteractionEnabled = false
            //            self.usableDatas.removeAll()
            self.showDataTableView.reloadData()
            //            page = 0
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.showDataTableView.refreshControl?.endRefreshing()
                self.showDataTableView.refreshControl?.isUserInteractionEnabled = true
            }
        }
    }
    
}
