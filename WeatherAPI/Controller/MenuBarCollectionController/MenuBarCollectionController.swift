//
//  MenuBarCollectionController.swift
//  RedSoRefactor
//
//  Created by Jimmy on 2020/11/24.
//

import UIKit

private let reuseIdentifier = "Cell"


class MenuBarCollectionController: UICollectionViewController {
    //MARK:- Properties
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    lazy var statusBarHeight = self.view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 44
    var scrollToIndexPath: IndexPath?
    {
        didSet
        {
            DispatchQueue.main.async {
                
                self.updateSliderPosition()
            }
        }
    }
    var menuBarText: [String] = []
    {
        didSet
        {
            DispatchQueue.main.async {
                
                self.collectionView.reloadData()
            }
            scrollToIndexPath = IndexPath(item: 0, section: 0)

        }
    }
    //MARK: - Delegate Property
    var passingMenuIndexDelegate: PassMenuIndexToPageDelegate!
    
    //MARK:- UI Element
    let menuBarSlider = UIView()
    
    //MARK:- override Function

     init(collectionViewLayout layout: UICollectionViewLayout, menuBarText: [String])
     {
        super.init(collectionViewLayout: layout)
        self.menuBarText = menuBarText
        self.setupAllUserInterface()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //MARK:- Setup UI
    func setupAllUserInterface()
    {
        setupcollectionViewLayout()
        setupMenuBarSliderLayout()
    }
    func setupcollectionViewLayout()
    {
        self.collectionView.backgroundColor = .defaultTheme
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView!.register(MenuBarCollectionViewCell.self, forCellWithReuseIdentifier: Identifier.menuBarItem.rawValue)
    }
    func setupMenuBarSliderLayout()
    {
        self.collectionView.addSubview(menuBarSlider)
        menuBarSlider.bounds.size = CGSize(width: 50, height: 3)
        menuBarSlider.backgroundColor = .white
        menuBarSlider.snp.makeConstraints { (make) in
            make.height.equalTo(3)
            make.width.equalTo(50)
            make.center.equalTo(collectionView)
        }
    }
    
    //MARK:- Animate For MenuBarSlider
    func updateSliderPosition()
    {
        guard let scrollToIndexPath = scrollToIndexPath, menuBarText.count > 0 else{return}
//        print(passingMenuIndexDelegate)
        
        print(passingMenuIndexDelegate.passingMenuIndexToPage(index: scrollToIndexPath.item))
        passingMenuIndexDelegate.passingMenuIndexToPage(index: scrollToIndexPath.item)
        print("現在的scrollToIndexPath = ",scrollToIndexPath)
        print("Cell類別 ＝ ",MenuBarCollectionViewCell.self)
        let menuBarCell = collectionView.cellForItem(at: scrollToIndexPath ) as! MenuBarCollectionViewCell
        
        self.menuBarSlider.snp.remakeConstraints { (make) in
            make.height.equalTo(3)
            make.top.equalTo(menuBarCell.pageTabLabel.snp.bottom)
            make.width.equalTo(menuBarCell)
            make.centerX.equalTo(menuBarCell)
        }
        let animator = UIViewPropertyAnimator(duration: 0.2, curve: .linear) {
            self.menuBarSlider.frame = CGRect(x: menuBarCell.frame.minX, y: menuBarCell.pageTabLabel.frame.maxY, width: menuBarCell.frame.width, height: 3)
            self.menuBarSlider.center.x = menuBarCell.center.x
        }
        animator.startAnimation()
    }
}
