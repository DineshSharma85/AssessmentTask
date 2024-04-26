//
//  PostDetailVC.swift
//  AssessmentTask

import UIKit

class PostDetailVC: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var lblUserID:UILabel!
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblBody:UILabel!
    
    // MARK: - Properties
    open var tableViewData:PostModal?
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        lblUserID.text = "\(tableViewData?.id ?? 0)"
        lblTitle.text = tableViewData?.title
        lblBody.text = tableViewData?.body
      
    }
    

}
