//
//  JDVehicleViewModel.swift
//  Jarus Demo
//
//  Created by Vinay Nation on 04/01/21.
//

import Foundation

class JDVehicleViewModel: NSObject {
    
    // MARK: Variables
    
    var reloadSections: ((_ section: Int) -> Void)?
    var reloadTableToController : (() -> ()) = {}
    
    var items = [Vehicle]()
    
    // MARK: Initialiser
    
    override init() {
        super.init()
        self.getDataForVehicle()
    }
    
    func getDataForVehicle() {
        
        guard let url = Bundle.main.url(forResource: "assignment", withExtension: "json") else { return  }
        ApiClient<[Vehicle]>.makeRequest(url: url) { [weak self] response, error in
            guard let response = response else {
                return
            }
            self?.items = response
            self?.reloadTableToController()
        }
    }
}





