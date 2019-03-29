//
//  ColorViewController.swift
//  Color Spec App
//
//  Created by Isaiah X Smith on 3/28/19.
//  Copyright © 2019 Isaiah X Smith. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    var color: UIColor! //implicity something something
    @IBOutlet weak var Label: UILabel!
    
    private var showColor = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = color
        Label.textColor = UIColor.white
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleTap(_ sender: Any) {
        if showColor {
            view.backgroundColor = color
            Label.textColor = UIColor.white
        } else {
            view.backgroundColor = UIColor.white
            Label.textColor = color
        }
        showColor = !showColor
    }
    
  
}
