//
//  DetailController.swift
//  transition-v1
//
//  Created by Fernando Salom Carratala on 29/10/22.
//

import UIKit
import AlamofireImage

class DetailController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!

    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }

    func setupUI(){
        guard let url = URL(string: viewModel.character.image) else {
            return
        }
        self.backgroundImage.af.setImage(withURL: url)
        self.backgroundImage.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissVC))
        self.backgroundImage.addGestureRecognizer(tap)
    }

    @objc func dismissVC(){
        self.dismiss(animated: true, completion: nil)
    }
}



