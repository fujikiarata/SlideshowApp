//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by WEBSYSTEM-MAC8 on 2023/09/16.
//

import UIKit

class ZoomViewController: UIViewController {
    
    @IBOutlet weak var zoomImageView: UIImageView!
    
    var imageNo:Int = 0
    // 画像の名前の配列
    let imageNameArray = [
        "number_1",
        "number_2",
        "number_3",
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let name = imageNameArray[imageNo]
        let image = UIImage(named: name)
        zoomImageView.image = image
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
