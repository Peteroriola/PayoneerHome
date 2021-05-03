//
//  PaymentMethodList.swift
//  PayoneerHome
//
//  Created by UNION on 02/05/2021.
//

import Foundation


struct PaymentMethodNetworks : Decodable {
    var networks : PaymentMethodListArray
 
}


struct PaymentMethodListArray : Decodable {
    var applicable : [PaymentMethodListDetails]
 
}


struct PaymentMethodListDetails : Decodable {
    var label : String?
    var links : PaymentMethodListLogo
}



struct PaymentMethodListLogo : Decodable {
    var logo : String?
  
}
