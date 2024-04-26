//
//  PostModal.swift
//  AssessmentTask
//
import Foundation

// MARK: - PostModal
struct PostModal: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
