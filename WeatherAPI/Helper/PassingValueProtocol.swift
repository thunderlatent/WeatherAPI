//
//  PassingValueProtocol.swift
//  RedSoRefactor
//
//  Created by Jimmy on 2020/11/26.
//

import Foundation
//MARK: - Menu To Page
protocol PassMenuIndexToPageDelegate
{
    func passingMenuIndexToPage(index:Int)
}

//MARK: - Page To Menu
protocol PassingPageIndexToMenuDelegate {
    func currentPageIndex(index:Int)
}
