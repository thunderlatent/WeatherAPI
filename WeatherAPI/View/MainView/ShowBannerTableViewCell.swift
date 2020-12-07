//
//  ShowBannerTableViewCell.swift
//  RedSoTest
//
//  Created by Jimmy on 2020/11/17.
//

import UIKit

class ShowBannerTableViewCell: UITableViewCell {
    
    //MARK:- Properties
    let width = UIScreen.main.bounds.width
    lazy var view = self.contentView
    //MARK: - UI Elements
    var bannerImage = UIImage(systemName: "person")
    var bannerImageView = UIImageView()
    {
        didSet
        {
//            stopLoadImageAnimation()
        }
    }
//    let animationView = AnimationView(name: "loadingImage")
    //MARK: - Override Func
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .defaultTheme
        setupAllUserInterface()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Custom Function
    func setupAllUserInterface()
    {
        setupBannerImageViewLayout()
//        setupAnimationViewLayout()
    }
    func setupBannerImageViewLayout()
    {
        
        self.addSubview(bannerImageView)
        let imageScale = (bannerImage?.size.height)! / (bannerImage?.size.width)!
        bannerImageView.contentMode = .scaleAspectFill
        bannerImageView.backgroundColor = .defaultTheme
        bannerImageView.image = bannerImage
        bannerImageView.snp.makeConstraints { (make) in
            make.edges.centerX.width.equalToSuperview()
            make.height.equalTo(width * imageScale)
        }
        
    }
//    func setupAnimationViewLayout()
//    {
//        self.addSubview(animationView)
//        animationView.layoutIfNeeded()
//        animationView.loopMode = .autoReverse
//        animationView.contentMode = .scaleAspectFill
//        animationView.animationSpeed = 1
//        animationView.contentMode = .scaleAspectFill
//        animationView.backgroundColor = .defaultTheme
//        animationView.snp.makeConstraints { (make) in
//            make.center.equalTo(bannerImageView)
//            make.width.equalTo(bannerImageView).multipliedBy(0.5)
//            make.height.equalTo(bannerImageView).multipliedBy(0.5)
//        }
//        startLoadImageAnimation()
//    }
//    func startLoadImageAnimation()
//    {
//        animationView.play()
//    }
//    func stopLoadImageAnimation()
//    {
//        animationView.stop()
//        animationView.removeFromSuperview()
//    }
    
    
    func configure(result: UsableData)
    {
        if let imageData = result.bannerImage
        {
            self.bannerImage = UIImage(data: imageData)
            self.bannerImageView.image = UIImage(data: imageData)
//            stopLoadImageAnimation()
        }else
        {
            self.bannerImageView.image = UIImage(systemName: "person")
        }
            
        let imageScale = (bannerImage?.size.height)! / (bannerImage?.size.width)!
        bannerImageView.snp.remakeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(width * imageScale)
            
        }
            
    }
}
