//
//  JDTableViewHeader.swift
//  Jarus Demo
//
//  Created by Vinay Nation on 04/01/21.
//

import UIKit

protocol JDTableViewHeaderDelegate: class {
    /**
     Notify if user has tiggled tableView header
     - parameters:
          - header: Gives tableview header
          - section: Gives selected header index
     */
    func toggleSection(header: JDTableViewHeader, section: Int)
}

class JDTableViewHeader: UITableViewHeaderFooterView {
    
    // MARK: Variables
    
    static let headerId = "JDTableViewHeader"
    weak var delegate: JDTableViewHeaderDelegate?
    
     let vehicleCheckBoxButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(systemName:"checkmark.square"), for: .normal)
        btn.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        btn.tintColor = .black
        btn.imageView?.contentMode = .scaleAspectFit
        return btn
    }()
    
     let vehicleIdLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
     let vehicleMakeLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let vehicleChevronImage: UIImageView = {
        let chImg = UIImageView()
        chImg.image = UIImage(systemName: "chevron.right")
        chImg.contentMode = .scaleAspectFit
        chImg.tintColor = .black
        return chImg
    }()
    
    // MARK: - Initialisers
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    // MARK: - Methos
    
    /// This is for to setup the UI for TableviewHeader part
    func setup() {
        addSubview(vehicleCheckBoxButton)
        addSubview(vehicleIdLabel)
        addSubview(vehicleMakeLabel)
        addSubview(vehicleChevronImage)
            
        vehicleCheckBoxButton.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: leftAnchor, padding: .init(top: 3, left: 8, bottom: 0, right: 0), size: .init(width: 44, height: 44), enableInsets: false)
           
        vehicleIdLabel.anchor(top: topAnchor, left: vehicleCheckBoxButton.rightAnchor, bottom: nil, right: vehicleMakeLabel.leftAnchor, padding: .init(top: 10, left: 2, bottom: 0, right: 10), size: .init(width: frame.size.width/8, height: 30), enableInsets: false)
        
        
        vehicleMakeLabel.anchor(top: topAnchor, left: vehicleIdLabel.rightAnchor, bottom: nil, right: vehicleChevronImage.leftAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 10), size: .init(width: frame.size.width/2, height: 30), enableInsets: false)
        
        vehicleChevronImage.anchor(top: topAnchor, left: vehicleMakeLabel.rightAnchor, bottom: nil, right: rightAnchor, padding: .init(top: 15, left: 10, bottom: 0, right: 10), size: .init(width: 20, height: 20), enableInsets: false)
        
       
        vehicleCheckBoxButton.addTarget(self, action:#selector(checkBoxtSelectionTapped), for: .touchUpInside)
        let tap = UITapGestureRecognizer(target: self, action: #selector(JDTableViewHeader.sectionHeaderTaped(_:)))
        self.contentView.addGestureRecognizer(tap)
        
    }
    
    func setCollapsed(collapsed: Bool ) {
        vehicleChevronImage.rotate(!collapsed ? 0.0 : (CGFloat(Double.pi)) / 2)
    }
    
    /**
     It handes the tap envent on header view.
     
     - parameter sender: Takes tap event
     */
    
    @objc func sectionHeaderTaped(_ sender: UITapGestureRecognizer) {
        self.delegate?.toggleSection(header: self, section: self.tag)
    }
    
    /**
     It handes event  of check box event
     
     - parameter sender: Takes tap event
     */
    
    @objc func checkBoxtSelectionTapped(sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    
}





