//
//  ViewController.swift
//  SlideshowApp
//
//  Created by WEBSYSTEM-MAC8 on 2023/09/16.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    /// 表示している画像の番号
    var dispImageNo = 0
    
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
        // 画像の名前の配列
        let imageNameArray = [
            "number_1",
            "number_2",
            "number_3",
        ]
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }
    
    @IBAction func onNext(_ sender: Any) {
        dispImageNo += 1
        if (dispImageNo == 3) {
            dispImageNo = 0
        }
        displayImage()
    }
    @IBAction func onPrev(_ sender: Any) {
        dispImageNo -= 1
        if (dispImageNo == -1) {
            dispImageNo = 2
        }
        displayImage()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let image = UIImage(named: "number_1")
        imageView.image = image
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let zoomViewController:ZoomViewController = segue.destination as! ZoomViewController
        zoomViewController.imageNo = dispImageNo
    }
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

