//
//  PostCell.swift
//  AssessmentTask


import UIKit

class PostCell: UITableViewCell {
    // MARK: - IBOutlet
    @IBOutlet weak var lblUserID:UILabel!
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var bgView:UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.addShadow()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}


extension UIView {
    func addShadow(
                   color: UIColor = .black,
                   opacity: Float = 0.5,
                   offset: CGSize = CGSize(width: 0, height: 2),
                   radius: CGFloat = 4) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.masksToBounds = false
        layer.cornerRadius = radius
                              
    }
}
