//
//  GameDetailsViewController.swift
//  StoryboardTutorial
//
//  Created by ali chaudhry on 7/12/18.
//  Copyright © 2018 ali chaudhry. All rights reserved.
//

import UIKit

class GameDetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet var thisView: UIView!
    @IBOutlet weak var innerView: UIView!
    
    var name: String = "default" {
        didSet {
            nameLabel.text = name
        }
    }
    
    var game:String = "default" {
        didSet {
            gameLabel.text = game
        }
    }
    
    var image:String? = nil {
        didSet {
            ratingImage.image = UIImage(named: "1Stars")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "default"
        gameLabel.text = "default"
        ratingImage.image = UIImage(named: "2Stars")
    }

    @IBAction func onClick(_ sender: UIButton) {
        dismiss(animated: true)
    }

}
