//
//  +Delegate.swift
//  RedSoRefactor
//
//  Created by Jimmy on 2020/11/24.
//

import UIKit
extension ShowDataViewController: UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
            //滑到最下面兩個cell時觸發
//        if (usableDatas.count - indexPath.row == 1)
//        {
//            self.page += 1
//        }
    }
}
