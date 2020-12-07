//
//  +PageViewControllerDataDelegate.swift
//  RedSoRefactor
//
//  Created by Jimmy on 2020/11/25.
//

import UIKit
extension ShowDataPageController: UIPageViewControllerDelegate
{
    //MARK: - Decide currentVCIndex when turning pages
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        // 更新 currentVCIndex
        guard let displayedViewController = viewControllers?.first else {
            return
        }
        guard let index = allControllers.firstIndex(of: displayedViewController) else {
            return
        }
        print("索引",index)
        passingPageIndexDelegate.currentPageIndex(index: index)
        currentVCIndex = index
    }
}
