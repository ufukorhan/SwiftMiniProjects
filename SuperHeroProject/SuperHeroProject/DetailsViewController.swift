//
//  DetailsViewController.swift
//  SuperHeroProject
//
//  Created by Ufuk Orhan on 17.05.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var chosenHeroName = ""
    var chosenHeroPictureName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: chosenHeroPictureName)
        label.text = chosenHeroName
    }
    


}
