//
//  JDTableViewCell.swift
//  Jarus Demo
//
//  Created by Vinay Nation on 04/01/21.
//

import UIKit

class JDTableViewCell : UITableViewCell {
    
   // MARK: Variables
    
    static let cellId = "JDTableViewCell"
    
    var title: String {
        set {
            self.titleLbl.text = newValue
        }
        get { return self.titleLbl.text ?? "" }
    }
    
    var subTitle: String {
        set {
            self.subTitleLbl.text = newValue
        }
        get { return self.subTitleLbl.text ?? "" }
    }
    
    private var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        //lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private var subTitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "12wwww"
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    // MARK: Initialiser
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    /// Configure the layout for cell
    
    func setup() {
        addSubview(titleLbl)
        addSubview(subTitleLbl)
        
        let const: CGFloat = 10.0
        
        titleLbl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: const).isActive = true
        titleLbl.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: const).isActive = true
        titleLbl.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -const).isActive = true
        titleLbl.trailingAnchor.constraint(equalTo: subTitleLbl.leadingAnchor, constant: -const).isActive = true
        titleLbl.widthAnchor.constraint(equalToConstant: 55).isActive = true
        
        subTitleLbl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: const).isActive = true
        subTitleLbl.leadingAnchor.constraint(equalTo: titleLbl.trailingAnchor, constant: const).isActive = true
        subTitleLbl.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -const).isActive = true
        subTitleLbl.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -const).isActive = true
                
    }
}

