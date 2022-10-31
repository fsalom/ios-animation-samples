//
//  UserCell.swift
//  RudoApp
//
//  Created by Ramón Puchades on 17/6/22.
//  Copyright © 2022 Rudo. All rights reserved.
//

import UIKit
import AlamofireImage

class UserCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userFullName: UILabel!
    @IBOutlet weak var userDepartmentImage: UIImageView!
    // MARK: - Life Cycle
    var character: CharacterDTO!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    // MARK: - Functions
    func setupUI(for character: CharacterDTO) {
        self.character = character
        userFullName.text = character.name

        if let url = URL(string: character.image){
            userImage.af.setImage(withURL: url)
        }
    }
}
