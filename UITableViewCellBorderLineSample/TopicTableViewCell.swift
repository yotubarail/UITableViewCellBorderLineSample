//
//  TopicTableViewCell.swift
//  UITableViewCellBorderLineSample
//
//  Created by 滝浪翔太 on 2024/02/02.
//

import UIKit

class TopicTableViewCell: UITableViewCell {

    @IBOutlet weak var topicLabel: UILabel!
    
    let borderColor: UIColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 153/255)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        let size = super.systemLayoutSizeFitting(
            targetSize,
            withHorizontalFittingPriority: horizontalFittingPriority,
            verticalFittingPriority: verticalFittingPriority)
        
        self.layoutIfNeeded()
        
        topicLabel.frame.size.height = size.height
        
        topicLabel.addBorder(width: 1.0, position: .bottom, color: borderColor)
        
        return size
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
