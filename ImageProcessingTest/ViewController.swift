//
//  ViewController.swift
//  ImageProcessingTest
//
//  Created by 田中舜一 on 2017/05/14.
//  Copyright © 2017年 田中舜一. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named:"neko.jpg")?.mask(image: UIImage(named: "mask.jpg"))
        let outputView = UIImageView(image: image)
        outputView.resize(view: self.view)
        
        //self.scrollView.addSubview(outputView)
        
        let drowView = drawImage(self.scrollView.frame)
        self.scrollView.addSubview(drowView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawImage(_ frame: CGRect)->UIImageView{
        
        let r = 0
        let g = 125
        let b = 255
        let alphaValue:Float = 1.0
        
        let imgView = UIImageView(frame: frame)
        //self.view.addSubview(imgView)
        
        let text = "Emmy's shopping in \nLondon."
        
        let image = UIImage(named:"neko.jpg")!.mask(image: UIImage(named: "mask.jpg"))
        
        let imageWidth = image.size.width
        let imageHeight = image.size.height
        
        // UIImageを自前で準備
        UIGraphicsBeginImageContextWithOptions(imgView.frame.size, false, 0)
        // context生成
        let contextImg:CGContext = UIGraphicsGetCurrentContext()!
        // この塗りつぶす領域の大きさを指定
        let rect:CGRect = CGRect(x:250,y:250,width: imgView.frame.size.width - 100,height: 250)
        //　色をRGBAで指定
        contextImg.setFillColor(red: CGFloat(r) / 255,green: CGFloat(g) / 255,blue: CGFloat(b) / 255,alpha: CGFloat(alphaValue))
        // 指定された領域を塗りつぶす
        contextImg.fill(rect)
        
        let nekoRect = CGRect(x: 0,y: 0,width: imageWidth / 5,height: imageHeight/5)
        image.draw(in: nekoRect)
        
        drawtext(text)
        
        //　現在のcontextの情報取得
        let img = UIGraphicsGetImageFromCurrentImageContext()
        //　contextを終了
        UIGraphicsEndImageContext()
        
        // imgをUIImageViewで表示
        imgView.image = img
        //imgView.image?.draw(CGRectMake(0, 0, imgView.frame.size.width, imgView.frame.size.height))
        imgView.image?.draw(in: self.view.frame)
        
        return imgView
        
    }
    
    func drawtext(_ text:String){
        
        let font = UIFont.boldSystemFont(ofSize: 20)
        
        // テキストの描画領域
        let textRect  = CGRect(x:100, y:40, width:250, height:120)
        
        let textStyle = NSMutableParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        
        let textFontAttributes = [
            NSFontAttributeName: font,
            NSForegroundColorAttributeName: UIColor.yellow,
            NSParagraphStyleAttributeName: textStyle
        ]
        
        // テキストをdrawInRectメソッドでレンダリング
        text.draw(in: textRect, withAttributes: textFontAttributes)
        
    }
    
    func test(){
        
    }
    
}

