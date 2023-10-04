//
//  Order.swift
//  CupcakeCorner
//
//  Created by Jevgeni Vakker on 30.07.2023.
//

import SwiftUI

class Order: ObservableObject, Codable {
    @Published var orderDetails = OrderDetails()
    @Published var address = Address()
    
    enum CodingKeys: CodingKey {
        case orderDetails, address
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        orderDetails = try container.decode(OrderDetails.self, forKey: .orderDetails)
        address = try container.decode(Address.self, forKey: .address)
    }
    
    init() {}
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(orderDetails, forKey: .orderDetails)
        try container.encode(address, forKey: .address)
    }
}

struct OrderDetails: Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    var extraFrosting = false
    var addSprinkles = false
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }

    var cost: Double {
        var cost = Double(quantity) * 2
        cost += (Double(type) / 2)
        
        if extraFrosting {
            cost += Double(quantity)
        }
        
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
}

struct Address: Codable {
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        
        if name.hasPrefix(" ") || name.hasSuffix(" ") || streetAddress.hasSuffix(" ") || streetAddress.hasPrefix(" ") || city.hasSuffix(" ") || city.hasPrefix(" ") || zip.hasPrefix(" ") || zip.hasSuffix(" ") {
            return false
        }
        
        return true
    }
}
