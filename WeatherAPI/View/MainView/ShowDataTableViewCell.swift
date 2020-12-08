//
//  showDataTableViewCell.swift
//  RedSoTest
//
//  Created by Jimmy on 2020/11/16.
//

import UIKit


class ShowDataTableViewCell: UITableViewCell {
    //MARK:- Properties
    let width = UIScreen.main.bounds.width
    //MARK: - UI Elements
    let headImageView = UIImageView()
    let nameLabel = UILabel()
    let positionLabel = UILabel()
    let expertiseLabel = UILabel()
    //MARK: - Override Func
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .defaultTheme
        self.contentView.layer.cornerRadius = contentView.frame.width * 0.1
        self.contentView.clipsToBounds = true
        setupAllUserInterface()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Custom Function
    private func setupAllUserInterface()
    {
        setupHeadImageViewLayout()
        setupNameLabelLayout()
        setupPositionLabelLayout()
        setupExpertiseLabelLayout()
    }
    private func setupHeadImageViewLayout()
    {
        self.addSubview(headImageView)
        headImageView.center = CGPoint(x:width * 0.17, y:width * 0.17)
        headImageView.frame.size = CGSize(width:width * 0.28, height:width * 0.28)
        //        headImageView.image = UIImage(named: "gear")
        headImageView.layer.cornerRadius = width * 0.15
        headImageView.layer.masksToBounds = true
        headImageView.backgroundColor = .defaultTheme
        headImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(width * 0.3)
            make.top.left.equalTo(width * 0.05)
        }
    }
    private func setupNameLabelLayout()
    {
        self.addSubview(nameLabel)
        nameLabel.backgroundColor = .defaultTheme
        nameLabel.textColor = .white
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        //        nameLabel.text = "Hello, RedSo"
        nameLabel.numberOfLines = 0
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(width * 0.05)
            make.left.equalTo(headImageView.snp.right).offset(width * 0.05)
            make.width.equalTo(width * 0.5)
            make.height.equalTo(nameLabel.snp.width).multipliedBy(0.15)
        }
    }
    private func setupPositionLabelLayout()
    {
        self.addSubview(positionLabel)
        positionLabel.backgroundColor = .defaultTheme
        positionLabel.textColor = .white
        positionLabel.adjustsFontSizeToFitWidth = true
        positionLabel.font = UIFont.systemFont(ofSize: 20)
        //        positionLabel.text = "Boss"
        positionLabel.numberOfLines = 0
        positionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(width * 0.025)
            make.left.equalTo(headImageView.snp.right).offset(width * 0.05)
            make.width.equalTo(width * 0.5)
            make.height.equalTo(nameLabel.snp.width).multipliedBy(0.15)
        }
    }
    private func setupExpertiseLabelLayout()
    {
        self.addSubview(expertiseLabel)
        expertiseLabel.backgroundColor = .defaultTheme
        expertiseLabel.textColor = .white
        expertiseLabel.adjustsFontSizeToFitWidth = false
        expertiseLabel.font = UIFont.systemFont(ofSize: 20)
        expertiseLabel.text = " "
        expertiseLabel.numberOfLines = 0
        expertiseLabel.snp.makeConstraints { (make) in
            make.top.equalTo(positionLabel.snp.bottom).offset(width * 0.025)
            make.left.equalTo(headImageView.snp.right).offset(width * 0.05)
            make.width.equalTo(width * 0.6)
            make.bottom.equalTo(-(width * 0.05))
        }
    }
    //    func getImage(string: String?) -> UIImage
    //    {
    //        var image = UIImage(systemName: "person")
    //        if let string = string
    //        {
    //            if let url = URL(string: string)
    //            {
    //                DispatchQueue.main.async
    //                {
    //                    let task =  URLSession.shared.dataTask(with: url) { (data, response, error) in
    //                        if let error = error
    //                        {
    //                            print(error)
    //                        }
    //
    //                        guard let data = data else {return}
    //
    //                        if let dataToImage = UIImage(data: data)
    //                        {
    //                            image = dataToImage
    //                        }
    //                    }
    //                    task.resume()
    //                }
    //            }
    //        }
    //        return image!
    //    }
    
    func configure(list: List)
    {
        let temp = String(format: "%.1f", list.main.temp)
        self.nameLabel.text = "溫度：\(temp)"
        self.positionLabel.text = "天氣狀況：\(list.weather.first!.weatherDescription)"
        self.headImageView.image = dataToUIImage(weatherDescription: list.weather.first!.weatherDescription)
        let dateStringCapture = ConvertAPIData.dateStringCapture(dateStr: list.timeStampString, formatter: "HH:mm")
        self.expertiseLabel.text = "當時時間：\(dateStringCapture)"
        
    }
    func dataToUIImage(weatherDescription: String) -> UIImage
    {
        
        if weatherDescription.contains("雨")
        {
            return UIImage(named: "rain")!
        }else if weatherDescription.contains("晴")
        {
            return UIImage(named: "sun")!
        }else if weatherDescription.contains("陰")
        {
            return UIImage(named: "cloudy")!
        }else if weatherDescription.contains("多雲")
        {
            return UIImage(named: "cloudy")!
        }
        else
        {
            return UIImage(named: "cloudAndSun")!
        }
    }
}
