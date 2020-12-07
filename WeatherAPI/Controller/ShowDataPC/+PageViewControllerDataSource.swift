//
//  +PageViewControllerDataSource.swift
//  RedSoRefactor
//
//  Created by Jimmy on 2020/11/25.
//

import UIKit
extension ShowDataPageController: UIPageViewControllerDataSource
{
    //Decide which controller display when turn before page
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        getContentViewController(index: currentVCIndex - 1)
    }
    //Decide which controller display when turn after page
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        getContentViewController(index: currentVCIndex + 1)
    }
}
