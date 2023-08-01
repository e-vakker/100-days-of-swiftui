//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Jevgeni Vakker on 30.07.2023.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.address.name)
                TextField("Street address", text: $order.address.streetAddress)
                TextField("City", text: $order.address.city)
                TextField("Zip", text: $order.address.zip)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
            }
            
            Section {
                NavigationLink {
                    CheckOutView(order: order)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(order.address.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
