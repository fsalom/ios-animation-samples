//
//  UserCell.swift
//  RudoApp
//
//  Created by Ramón Puchades on 17/6/22.
//  Copyright © 2022 Rudo. All rights reserved.
//

import UIKit
import AlamofireImage

class CharacterCell: UITableViewCell {
    // MARK: - IBOutlets

    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
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
        characterName.text = character.name
        characterImage.layer.borderWidth = 1
        characterImage.layer.masksToBounds = false
        characterImage.layer.borderColor = UIColor.gray.cgColor
        characterImage.layer.cornerRadius = self.characterImage.frame.height / 2
        characterImage.clipsToBounds = true
        if let url = URL(string: character.image){
            characterImage.af.setImage(withURL: url)

        }
    }
}
