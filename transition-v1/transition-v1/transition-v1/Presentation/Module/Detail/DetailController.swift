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
    @IBOutlet weak var descriptionLabel: UILabel!

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
    }

    @IBAction func onPressDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}



