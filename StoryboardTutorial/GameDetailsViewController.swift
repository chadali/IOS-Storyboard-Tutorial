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
    
    // can't use prepare(for segue) function to change variables with didSet's apparently
    var incomingName:String?
    var incomingGame:String?
    var incomingImage:String?
    
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
            ratingImage.image = UIImage(named: image!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let x = incomingName, let y = incomingGame, let z = incomingImage {
            game = x
            name = y
            image = z
        }
    }

    @IBAction func onClick(_ sender: UIButton) {
        dismiss(animated: true)
    }

}
