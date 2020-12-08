//
//  ListVC+Delegate.swift
//  WeatherAPI
//
//  Created by Jimmy on 2020/12/7.
//

import UIKit
extension ListViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let mainController = MainController()
        mainController.cityName = counties[indexPath.row]
        navigationController?.pushViewController(mainController, animated: true)
    }
}
