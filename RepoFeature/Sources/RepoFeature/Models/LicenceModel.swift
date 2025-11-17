//    
//  LicenceModel.swift
//  iostestapp
//

public struct LicenseModel: Codable, Sendable {
    let key: String
    let name: String
    let spdxID: String?
    let url: String?
    let nodeID: String

    enum CodingKeys: String, CodingKey {
        case key, name, url
        case spdxID = "spdx_id"
        case nodeID = "node_id"
    }
}
