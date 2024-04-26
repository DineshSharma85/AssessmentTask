//
//  DataVIewModal.swift
//  AssessmentTask
//


import Foundation
import UIKit



class PostViewModal {
    
    // MARK: - Properties
    private var page = 1
    private let limit = 10
    private var isFetching = false
    private var allDataLoaded = false
    open var tableViewData:[PostModal] = []
    
    // MARK: - Callback function
    var onDataUpdate: (() -> Void)?
    
    // MARK: - API Calling
    func fetchPosts () {
        guard !isFetching && !allDataLoaded else { return }
              isFetching = true
        
        APIManager.shared.APIReqeust(requestType: RequtesType.get, url:URL(string:  Constants.baseURL+Endpoints.posts+"?_page=\(page)&_dataLimit=\(limit)")!, parameters: [:]) {  [weak self] result in
            self?.isFetching = false
            switch result {
            case .success(let json):
                
                do {
                    let newPosts = try JSONDecoder().decode([PostModal].self, from: json)
                    if newPosts.isEmpty {
                        self?.allDataLoaded = true
                    } else {
                        self?.tableViewData.append(contentsOf: newPosts)
                        self?.page += 1
                        self?.onDataUpdate?()
                    }
                } catch {
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
                
            case .failure(_):
                print("error")
            }
        }
    }
}


