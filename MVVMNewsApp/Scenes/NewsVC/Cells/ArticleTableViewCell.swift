//
//  ArticleTableViewCell.swift
//  MVVMNewsApp
//
//  Created by 2B on 18/11/2023.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descreptionLbl: UILabel!
    
    //MARK: - Variables
    
    static var ID = String(describing: ArticleTableViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(_ article : ArticleViewModel){
        titleLbl.text = article.title
        descreptionLbl.text = article.description
    }
}
