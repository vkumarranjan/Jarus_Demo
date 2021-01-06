//
//  JDVehicleViewModel+Ext.swift
//  Jarus Demo
//
//  Created by Vinay Nation on 05/01/21.
//

import UIKit

// MARK: TableViewDatasource methods

extension JDVehicleViewModel: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        items.isEmpty ? 0 : items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard !items.isEmpty else {
            return 0
        }
        let item = items[section]
        return item.isCollapsed ? 5 : 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier:JDTableViewCell.cellId ) as! JDTableViewCell
        let item = items[indexPath.section]
        switch indexPath.row {
        case 0:
            cell.title = "VIN"
            cell.subTitle = "\(item.vin ?? "NA")"
        case 1:
            cell.title = "Year"
            cell.subTitle = item.year?.stringValue ?? "NA"
        case 2:
            cell.title = "Make"
            cell.subTitle = item.make ?? "NA"
        case 3:
            cell.title = "Value"
            cell.subTitle = "\(item.value)"
        case 4:
            cell.title = "Length"
            cell.subTitle = "\(item.length) ft"
        default:
            cell.title = "NA"
            cell.subTitle = "NA"
        }
        return cell
    }
}


// MARK: TableViewDegate methods

extension JDVehicleViewModel: UITableViewDelegate {
    
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: JDTableViewHeader.headerId) as! JDTableViewHeader
        header.tag = section
        if !items.isEmpty{
            let item = items[section]
            header.delegate = self
            header.vehicleIdLabel.text = item.id.stringValue
            header.vehicleMakeLabel.text = "\(item.make ?? "NA")"
            header.setCollapsed(collapsed: item.isCollapsed)
        }       
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         44.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }
}

// MARK: JDVehicleViewModel delegate methods

extension JDVehicleViewModel: JDTableViewHeaderDelegate {
    func toggleSection(header: JDTableViewHeader, section: Int) {
        var item = items[section]
        
        let collapsed = !item.isCollapsed
        item.isCollapsed = collapsed
        items[section] = item
        reloadSections?(section)
        header.setCollapsed(collapsed: collapsed)
    }
}

