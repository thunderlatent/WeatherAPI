//
//  +MenuBarDataSource.swift
//  RedSoRefactor
//
//  Created by Jimmy on 2020/11/25.
//

import UIKit

// MARK: UICollectionViewDataSource
extension MenuBarCollectionController
{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.menuBarText.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.menuBarItem.rawValue, for: indexPath) as! MenuBarCollectionViewCell
        
        cell.configure(text: menuBarText[indexPath.item])
        return cell
    }
}
