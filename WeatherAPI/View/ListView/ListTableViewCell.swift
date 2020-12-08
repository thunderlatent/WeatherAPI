//
//  ListTableViewCell.swift
//  WeatherAPI
//
//  Created by Jimmy on 2020/12/7.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    //MARK:- Properties
    
    //MARK:- UI Element
    var cityNameLabel: UILabel =
        {
            var label = UILabel()
            label.textColor = .white
            label.font = UIFont(name: "GenSenRoundedTW-B", size: 60)
            label.textAlignment = .center
            label.backgroundColor = .clear
            return label
        }()
    //MARK:- override Function
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("cellInit = ",#function)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //MARK: - Custom Cell
    func configure(counties:[String], indexPath: IndexPath)
    {
        cityNameLabel.text = counties[indexPath.row]
        self.backgroundColor = .clear
       
    }
    func setupCityNameLabelLayout(indexPath: IndexPath)
    {
        self.addSubview(cityNameLabel)
        if indexPath.row % 2 == 0
        {
            cityNameLabel.snp.remakeConstraints { (make) in
                make.left.equalToSuperview().offset(20)
                make.right.lessThanOrEqualToSuperview()
                make.top.equalTo(self.frame.width * 0.05)
                make.bottom.equalTo(-self.frame.width * 0.05)
            }
        }else
        {
            cityNameLabel.snp.remakeConstraints { (make) in
                make.right.equalToSuperview().offset(-20)
                make.left.greaterThanOrEqualToSuperview()
                make.top.equalTo(self.frame.width * 0.05)
                make.bottom.equalTo(-self.frame.width * 0.05)
            }
        }
    }
}
