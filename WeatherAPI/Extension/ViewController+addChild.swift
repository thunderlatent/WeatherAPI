//
//  ViewController+addChild.swift
//  RedSoRefactor
//
//  Created by Jimmy on 2020/11/24.
//

import UIKit
extension UIViewController
{
    //MARK: - Add Child Controller And View
    func addChildController(child: UIViewController)
    {
        self.addChild(child)
        self.view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    //MARK: - Remove Child Controller And View
    func removeChild()
    {
        //Must checkout have parent.
        guard parent != nil else{return}
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
    
}
