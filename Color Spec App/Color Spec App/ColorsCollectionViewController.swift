//
//  ColorsCollectionViewController.swift
//  Color Spec App
//
//  Created by Isaiah X Smith on 3/28/19.
//  Copyright © 2019 Isaiah X Smith. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ColorsCollectionViewController: UICollectionViewController {

    var colors: [UIColor] = [] //Array that will hold our colors
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.delegate = self

        // Do any additional setup after loading the view.
        colors = [UIColor.blue, UIColor.red, UIColor.green, UIColor.yellow]
    }

    //override func didReceiveMemoryWarning() {
      //  super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    //}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) //Self hate is self destructable
    
        // Configure the cell
        
        cell.backgroundColor = colors[indexPath.row]
        cell.layer.cornerRadius = 10.0
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ColorDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let colorVC = segue.destination as? ColorViewController {
            if let indexPath = sender as? IndexPath {
                colorVC.color = colors[indexPath.row]
            }
            
        }
    }
    
    @IBAction func createColorPressed(_ sender: Any) {
        ColorPickerViewController.present(over: self) { color in
            if let color = color {
                self.colors.append(color)
                self.collectionView?.reloadData()
            }
            self.presentedViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
