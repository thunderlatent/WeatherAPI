//
//  ViewController.swift
//  RedSoRefactor
//
//  Created by Jimmy on 2020/11/23.
//

import UIKit
import SnapKit
class MainController: UIViewController,PassingPageIndexToMenuDelegate,PassMenuIndexToPageDelegate {
    //MARK:- Properties

    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var usableData: [[String:[List]]] = []
   
    var dateArray :[String] = []
   
    
    //MARK:- UI Element
    let mainView = MainView()
    var menuBarCollectionController: MenuBarCollectionController! = nil
    var pageController: ShowDataPageController! = nil
    
    
    //MARK:- override Function
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getFiveDayWeatherData {
            DispatchQueue.main.async {
                self.setupAllUserInterface()
            }
        }
        
        
        //MARK: - Passing Value Delegate
        
        
    }
    //MARK: - Call API

    func getFiveDayWeatherData(completion:@escaping () -> Void)
    {
        WebServices.loadData(type: Weather.self) { [self] (data) in
            if let data = data
            {
                var futureWeatherList: [List] = []
                var dateArray: [String] = []
                for i in data.list
                {
                    //MARK:- Decide whether the future time.
                    if ConvertAPIData.stringToTimeInterval(dateStr: i.timeStampString) >= Date().timeIntervalSince1970
                    {
                        //MARK: - Get Date
                        let dateStringCapture = ConvertAPIData.dateStringCapture(dateStr: i.timeStampString)
                        
                        futureWeatherList.append(i)
                        
                        if dateArray.last != dateStringCapture
                        {
                            dateArray.append(dateStringCapture)
                        }
                        
                    }
                }
                for date in dateArray
                {
                    var weatherDict: [String:[List]] = [:]
                    var weatherList: [List] = []
                    for weather in futureWeatherList
                    {
                        if date == ConvertAPIData.dateStringCapture(dateStr: weather.timeStampString)
                        {
                            weatherList.append(weather)
                        }
                    }
                    weatherDict[date] = weatherList
                    usableData.append(weatherDict)
                }
                self.dateArray = dateArray
                completion()

            }
        }

    }
    //MARK:- Custom Func For Setup UI
    private lazy var collectionViewLayout: UICollectionViewFlowLayout =
        {
            var layout = UICollectionViewFlowLayout()
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            // cell與cell的間距
            layout.minimumLineSpacing = CGFloat(integerLiteral: Int(screenWidth * 0.03))
            
            // 滑動方向預設為垂直。注意若設為垂直，則cell的加入方式為由左至右，滿了才會換行；若是水平則由上往下，滿了才會換列
            layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
            return layout
        }()
    private func setupAllUserInterface()
    {
        
        setupMenuBarCVC()
        setupPageVC()

    }
    private func setupMenuBarCVC()
    {
        menuBarCollectionController = MenuBarCollectionController(collectionViewLayout: collectionViewLayout,menuBarText: dateArray)
        addChildController(child: menuBarCollectionController)
        menuBarCollectionController.passingMenuIndexDelegate = self

        menuBarCollectionController.collectionView.snp.makeConstraints { (make) in
            make.left.equalTo(mainView.snp.leftMargin)
            make.right.equalTo(mainView.snp.rightMargin)
            make.top.equalTo(mainView.logoView.snp.bottom)
            make.height.equalTo(mainView.logoView.snp.height)
        }
    }
    private func setupPageVC()
    {
        self.pageController = ShowDataPageController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil, usableData: usableData)
        addChildController(child: pageController)
        pageController.view.backgroundColor = .defaultTheme
        pageController.passingPageIndexDelegate = self

        pageController.view.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(menuBarCollectionController.collectionView.snp.bottom)
        }
        
    }
    
    //MARK: - Delegate Func For Passing PageController's currentPageIndex To MenuController
    func currentPageIndex(index: Int) {
        menuBarCollectionController.scrollToIndexPath = IndexPath(item: index, section: 0)
    }
    //MARK: - Delegate Func For Passing MenuController's Index To PageController
    func passingMenuIndexToPage(index: Int) {
        print("傳給page = ",index)
        print("pageController", pageController)
        print("menuController", menuBarCollectionController)
        pageController.currentVCIndex = index
        
    }
    
    
}

