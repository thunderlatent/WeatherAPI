//
//  menuBarCollectionViewCell.swift
//  RedSoTest
//
//  Created by Jimmy on 2020/11/13.
//

import UIKit

class MenuBarCollectionViewCell: UICollectionViewCell {
    //MARK:- UI Element
    let pageTabLabel = UILabel()
    
    
    //MARK:- override Function
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setupAllUserInterface()
    }
  
    
    
    //MARK:- Custom Func For Setup UI
    func setupAllUserInterface()
    {
        self.backgroundColor = .defaultTheme
        setupPageTabLabelLayout()
    }
    func setupPageTabLabelLayout()
    {
        self.addSubview(pageTabLabel)
        pageTabLabel.textAlignment = .center
        pageTabLabel.backgroundColor = .defaultTheme
        pageTabLabel.textColor = .white
        pageTabLabel.font = UIFont.systemFont(ofSize: 32)
        pageTabLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    //MARK: - Configure Cell Content
    func configure(text: String)
    {
        self.pageTabLabel.text = text
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
