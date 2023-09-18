//
//  ViewController.swift
//  SlideshowApp
//
//  Created by WEBSYSTEM-MAC8 on 2023/09/16.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    /// 表示している画像の番号
    var dispImageNo = 0
    
    // タイマー
    var timer: Timer!
    var timer_sec: Float = 0
    // 画像の名前の配列
    let imageNameArray = [
        "number_1",
        "number_2",
        "number_3",
    ]
    
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        // 画像を読み込み
        let image = UIImage(named: name)
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }
    
    @IBAction func onNext(_ sender: Any) {
        // スライドショー実行時は動かない
        if (timer == nil) {
            dispImageNo += 1
            if (dispImageNo == 3) {
                dispImageNo = 0
            }
            displayImage()
        }
    }
    
    @IBAction func onPrev(_ sender: Any) {
        // スライドショー実行時は動かない
        if (timer == nil) {
            dispImageNo -= 1
            if (dispImageNo == -1) {
                dispImageNo = 2
            }
            displayImage()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let image = UIImage(named: "number_1")
        imageView.image = image
    }
    
    // selector: #selector(updatetimer(_:)) で指定された関数
    // timeInterval: 0.1, repeats: true で指定された通り、0.1秒毎に呼び出され続ける
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 0.1
    }
    
    // 再生ボタン IBAction
    @IBAction func startTimer(_ sender: Any) {
        // 再生中か停止しているかを判定
        if (timer == nil) {
            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            prevButton.isEnabled = false
            nextButton.isEnabled = false
            // ボタンの名前を停止に変える
            startButton.setTitle("停止", for: .normal)
        } else {
            // タイマーを停止する
            timer.invalidate()
            // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil
            prevButton.isEnabled = true
            nextButton.isEnabled = true
            // ボタンの名前を再生に直しておく
            startButton.setTitle("再生", for: .normal)
        }
    }
    
    @objc func changeImage() {
        // indexを増やして表示する画像を切り替える
        dispImageNo += 1
        
        // indexが表示予定の画像の数と同じ場合
        if (dispImageNo == imageNameArray.count) {
            // indexを一番最初の数字に戻す
            dispImageNo = 0
        }
        // indexの画像をstoryboardの画像にセットする
        let name = imageNameArray[dispImageNo]
        // 画像を読み込み
        let image = UIImage(named: name)
        imageView.image = image
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let zoomViewController:ZoomViewController = segue.destination as! ZoomViewController
        if self.timer != nil {
            self.timer.invalidate()   // タイマーを停止する
            self.timer = nil          // startTimer() の self.timer == nil で判断するために、 self.timer = nil としておく
            // ボタンの名前を再生に直しておく
            startButton.setTitle("再生", for: .normal)
            prevButton.isEnabled = true
            nextButton.isEnabled = true
        }
        zoomViewController.imageNo = dispImageNo
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

