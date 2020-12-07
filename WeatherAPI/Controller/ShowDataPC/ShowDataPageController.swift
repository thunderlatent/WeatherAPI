//
//  PageViewController.swift
//  RedSoRefactor
//
//  Created by Jimmy on 2020/11/24.
//

import UIKit

class ShowDataPageController: UIPageViewController{
    //MARK: - Properties
    var currentVCIndex:Int = 0
    {
        
        didSet
        {
            if currentVCIndex > oldValue
            {
                setViewControllers([allControllers[currentVCIndex] as UIViewController], direction: .forward, animated: true, completion: nil)
            }else
            {
                setViewControllers([allControllers[currentVCIndex] as UIViewController], direction: .reverse, animated: true, completion: nil)
                
            }
        }
    }
    
    var usableData: [[String:[List]]] = []
    
           
      
    
    //MARK: - Delegate Property
    var passingPageIndexDelegate: PassingPageIndexToMenuDelegate!
    
    //MARK:- UI Element
    
    var allControllers :[UIViewController] = []
    
    //MARK:- Override Function
    init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil, usableData: [[String:[List]]]) {
        super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options)
        self.usableData = usableData
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - Configure Delegate
        //Must configure delegate to active
        self.delegate = self
        self.dataSource = self
        DispatchQueue.main.async {
            
            self.makeControllers(controllerTypes: self.usableData)
            self.setViewControllers([self.allControllers.first! as UIViewController], direction: .forward, animated: true, completion: nil)
        }
        
    }
    
    //MARK: - Generate Controllers
    private func makeControllers(controllerTypes types: [[String:[List]]])
    {
        guard types.count != 0 else {return}
        for type in types
        {
            
            if let value = type.first?.value
            {
                let vc = ShowDataViewController(usableData: value)
                allControllers.append(vc)
            }
        }
        
    }
    
    //MARK: - Decide which controller to display when turning pages
    func getContentViewController(index: Int)
    -> UIViewController? {
        //Decide whether the index is in range
        guard allControllers.indices.contains(index) else {
            return nil
        }
        return allControllers[index]
    }
    
   
}
