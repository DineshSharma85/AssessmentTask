//
//  PostViewVC.swift
//  AssessmentTask


import UIKit

class PostViewVC: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var postTableView:UITableView!

    // MARK: - Properties
    private let viewModel = PostViewModal()
    private let postsPerPage = 10
    var isLoading = false
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onDataUpdate = { [weak self] in
            DispatchQueue.main.async {
                self?.postTableView.reloadData()
            }
        }
        
        viewModel.fetchPosts()
    }
}
// MARK: - UITableviewDataSource ,UITableviewDelegate

extension PostViewVC:UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.tableViewData.count > 0 {
            return viewModel.tableViewData.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = postTableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        cell.lblUserID.text = "\(viewModel.tableViewData[indexPath.row].id ?? 0)"
        cell.lblTitle.text = viewModel.tableViewData[indexPath.row].title
        return cell
    }
    
    // MARK: - Passing data on viewDetail throught navigation

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "PostDetailVC") as? PostDetailVC {
            vc.tableViewData = viewModel.tableViewData[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            let lastRowIndex = tableView.numberOfRows(inSection: 0) - 1
            if indexPath.row == lastRowIndex {
                viewModel.fetchPosts()
            }
        }
}
