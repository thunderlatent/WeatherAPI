//
//  MainView.swift
//  RedSoTest
//
//  Created by Jimmy on 2020/11/14.
//

import UIKit

class MainView: UIView {
    
    //MARK:- Properties
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    lazy var statusBarHeight = self.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 44


    //MARK:- UI Element
    let logoView = UIView()

    
    //MARK:- override Function
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAllUserInterface()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK:- Setup UI
    func setupAllUserInterface()
    {
        setupBackgroundImage()
        
        setupLogoViewLayout(fontSize: screenWidth * 0.1)

    }
    func setupBackgroundImage()
    {
        let imageview = UIImageView(image: UIImage(named: "blueBackground"))
        imageview.contentMode = .scaleAspectFill
        imageview.alpha = 0.75
        self.addSubview(imageview)
        imageview.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    func setupLogoViewLayout(fontSize: CGFloat)
    {
        self.addSubview(logoView)
        let labelView = UIView()
        let redLabel : UILabel =
            {
                let label = UILabel()
                label.text = "Weather"
                label.textColor = .white
                label.textAlignment = .right
                label.backgroundColor = .defaultTheme
                label.font = UIFont.italicSystemFont(ofSize: fontSize)
                return label
            }()
        let soLabel: UILabel =
            {
                let label = UILabel()
                label.text = "Forecast"
                label.textColor = .red
                label.textAlignment = .left
                label.backgroundColor = .defaultTheme
                label.font = UIFont.italicSystemFont(ofSize: fontSize)
                return label
            }()
        logoView.backgroundColor = .defaultTheme
        logoView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp_topMargin)
            make.left.equalTo(self.snp_leftMargin)
            make.right.equalTo(self.snp_rightMargin)
            make.height.equalTo(fontSize * 1.2)
            
        }
        logoView.addSubview(labelView)
        labelView.addSubview(redLabel)
        labelView.addSubview(soLabel)
        labelView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.top.equalToSuperview()
            
        }
        redLabel.snp.makeConstraints { (make) in
            make.right.equalTo(soLabel.snp.left)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            
            make.left.greaterThanOrEqualToSuperview()
            
        }
        soLabel.snp.makeConstraints { (make) in
            make.left.equalTo(redLabel.snp.right)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.greaterThanOrEqualToSuperview()
        }
        
    }
    
}
