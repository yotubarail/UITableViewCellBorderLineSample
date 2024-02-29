//
//  DataTableViewCell.swift
//  UITableViewCellBorderLineSample
//
//  Created by 滝浪翔太 on 2024/02/02.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logicNameView: UIView!
    @IBOutlet weak var valueView: UIView!
    @IBOutlet weak var logicNameLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    let borderColor: UIColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 153/255)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 余白として設けた10を考慮しながら、4:6の比率でlogicNameとvalueを表示させる
        logicNameView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4, constant: -10.0).isActive = true
        valueView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6, constant: -10.0).isActive = true
        
        // UILabelで複数行表示可能にする
        logicNameLabel.numberOfLines = 0
        valueLabel.numberOfLines = 0
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        
        let size = super.systemLayoutSizeFitting(
            targetSize,
            withHorizontalFittingPriority: horizontalFittingPriority,
            verticalFittingPriority: verticalFittingPriority)
        
        self.layoutIfNeeded()
        
        logicNameView.frame.size.height = size.height
        valueView.frame.size.height = size.height
        
        // ボーダーラインを追加
        logicNameView.addBorder(width: 1.0, position: .bottom, color: borderColor)
        logicNameView.addBorder(width: 1.0, position: .right, color: borderColor)
        logicNameView.addBorder(width: 1.0, position: .left, color: borderColor)
        valueView.addBorder(width: 1.0, position: .bottom, color: borderColor)
        valueView.addBorder(width: 1.0, position: .right, color: borderColor)
        
        return size
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
