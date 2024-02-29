//
//  ViewController.swift
//  UITableViewCellBorderLineSample
//
//  Created by 滝浪翔太 on 2024/02/02.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    struct Item {
        var logicName : String
        var value : String
    }
    
    @IBOutlet weak var displayFavoriteTableView: UITableView!
    
    var labelTextArray : [Any] = []
    
    let usersFavorite = [
      [
        "id": "1",
        "name": "ブログ書き太郎",
        "favorite": [
          "frutes": "りんご",
          "number": 3,
          "subject": "国語"
        ]
      ],
      [
        "id": "2",
        "name": "ブログ読み次郎",
        "favorite": [
          "frutes": "みかん",
          "number": 100,
          "subject": "数学"
        ]
      ]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayFavoriteTableView.delegate = self
        displayFavoriteTableView.dataSource = self
        displayFavoriteTableView.separatorStyle = .none

        displayFavoriteTableView.register(UINib(nibName: "TopicTableViewCell", bundle: nil), forCellReuseIdentifier: "topic_cell")
        displayFavoriteTableView.register(UINib(nibName: "DataTableViewCell", bundle: nil), forCellReuseIdentifier: "data_cell")
        
        displayFavoriteTableView.estimatedRowHeight = 23
        displayFavoriteTableView.rowHeight = UITableView.automaticDimension

        self.prepareLabelArray()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labelTextArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let topicCell = displayFavoriteTableView.dequeueReusableCell(withIdentifier: "topic_cell") as! TopicTableViewCell
        let dataCell = displayFavoriteTableView.dequeueReusableCell(withIdentifier: "data_cell") as! DataTableViewCell
        
        // cellを選択不可にする
        topicCell.isUserInteractionEnabled = false
        dataCell.isUserInteractionEnabled = false
        
        // cellの再利用対策として一度ボーダーラインの設定をなくす
        topicCell.topicLabel.layer.borderWidth = 0
        removeBorder(view: topicCell.topicLabel)
        removeBorder(view: dataCell.logicNameView)
        removeBorder(view: dataCell.valueView)
        
        
        
        switch type(of: labelTextArray[indexPath.row]) {
        case is String.Type:
            topicCell.topicLabel.text = labelTextArray[indexPath.row] as? String
            return topicCell
            
        case is Item.Type:
            dataCell.logicNameLabel.text = (labelTextArray[indexPath.row] as? Item)?.logicName
            dataCell.valueLabel.text = (labelTextArray[indexPath.row] as? Item)?.value
            return dataCell
            
        default:
            return dataCell
        }
    }

    func prepareLabelArray() {
        for i in usersFavorite {
            labelTextArray.append("ユーザー情報")
            labelTextArray.append(Item(logicName: "id", value: "\(i["id"] ?? "-")"))
            labelTextArray.append(Item(logicName: "名前", value: "\(i["name"] ?? "-")"))

            if (i["favorite"] != nil) {
                labelTextArray.append("お気に入り")
                let favoriteInfoData = (i["favorite"] as? [String : Any])!
                labelTextArray.append(Item(logicName: "フルーツ", value: "\(favoriteInfoData["frutes"] ?? "-")"))
                labelTextArray.append(Item(logicName: "数字", value: "\(favoriteInfoData["number"] ?? "-")"))
                labelTextArray.append(Item(logicName: "教科", value: "\(favoriteInfoData["subject"] ?? "-")"))
                labelTextArray.append(Item(logicName: "飲み物", value: "\(favoriteInfoData["drink"] ?? "-")"))
            }
        }
    }
}

