//
//  +DataSource.swift
//  WeatherAPI
//
//  Created by Jimmy on 2020/12/7.
//

import UIKit
extension ListViewController: UITableViewDataSource
{
    var counties: [String]
        {
            let countries = ["基隆市","臺北市","新北市","桃園市","新竹縣","新竹市","苗栗縣","臺中市","彰化縣","南投縣","雲林縣","嘉義縣","嘉義市","臺南市","高雄市","屏東縣","臺東縣","花蓮縣","宜蘭縣","澎湖縣","金門縣","連江縣"]
        return countries
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.counties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.listTableViewCell.rawValue, for: indexPath) as! ListTableViewCell
        cell.configure(counties: self.counties ,indexPath: indexPath)
        
        return cell
    }
    
    
}
