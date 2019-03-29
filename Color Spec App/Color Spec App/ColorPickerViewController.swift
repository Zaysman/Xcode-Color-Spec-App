//
//  ColorPickerViewController.swift
//  Color Spec App
//
//  Created by Isaiah X Smith on 3/28/19.
//  Copyright © 2019 Isaiah X Smith. All rights reserved.
//

import UIKit

class ColorPickerViewController: UIViewController {

    @IBOutlet weak var colorview: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    static func present(over presenter: UIViewController, completionHandler: ((UIColor?) -> Void)?) {
        let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "colorPickerNavigation") as! UINavigationController
        
        let colorController = navigation.childViewControllers.first as! ColorPickerViewController
        colorController.completion = completionHandler
        
        presenter.present(navigation, animated: true, completion: nil)
        
        
    }
    
    var completion: ((UIColor?) -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    private var currentColor: UIColor {
        let red = CGFloat(redSlider.value) / 255
        let green = CGFloat(greenSlider.value) / 255
        let blue = CGFloat(blueSlider.value) / 255
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func updateColor(_ sender: Any) {
        colorview.backgroundColor = currentColor
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        completion?(nil)
    }
    
    @IBAction func savePressed(_ sender: Any) {
            completion?(currentColor)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
