//
//  SendOrder.swift
//  AwfarlakOriginal
//
//  Created by Mustafa on 2/23/20.
//  Copyright © 2020 amirahmed. All rights reserved.
//


import Foundation

// MARK: - SendOrder
struct SendOrder: Codable {
    let status: Int
    let idOrder: String?
    let  message: String

    enum CodingKeys: String, CodingKey {
        case status
        case idOrder = "id_order"
        case message
    }
}
