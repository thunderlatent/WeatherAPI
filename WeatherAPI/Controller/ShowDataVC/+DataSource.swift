//
//  +DataSource.swift
//  RedSoRefactor
//
//  Created by Jimmy on 2020/11/24.
//

import UIKit
extension ShowDataViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                usableData.count
  
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let dataCell = tableView.dequeueReusableCell(withIdentifier: Identifier.showDataCell.rawValue, for: indexPath) as! ShowDataTableViewCell
        dataCell.configure(list: usableData[indexPath.row])
        return dataCell
        
    }
    
    
}
