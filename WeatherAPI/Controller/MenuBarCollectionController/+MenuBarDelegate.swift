//
//  +MenuBarDelegate.swift
//  RedSoRefactor
//
//  Created by Jimmy on 2020/11/25.
//

import UIKit
extension MenuBarCollectionController
{
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("點到的",indexPath.row)
        self.scrollToIndexPath = indexPath
    }
}
