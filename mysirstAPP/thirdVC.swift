//
//  thirdVC.swift
//  mysirstAPP
//
//  Created by Wei on 2020/1/25.
//  Copyright © 2020 Wei. All rights reserved.
//

import UIKit

class thirdVC: UIViewController {
    @IBOutlet weak var image1: UIButton!
    @IBOutlet weak var image2: UIButton!
    @IBOutlet weak var image3: UIButton!
    @IBOutlet weak var image4: UIButton!
    @IBOutlet weak var image5: UIButton!
    @IBOutlet weak var image6: UIButton!
    @IBOutlet weak var image7: UIButton!
    @IBOutlet weak var image8: UIButton!
    @IBOutlet weak var image9: UIButton!
    
    @IBOutlet weak var Start_Show: UIButton!
    
          // 目前圖片順序
          var currentLocation = [0, 1, 2, 3, 4, 5, 6, 7, 8]
          
          // 設定每張圖片座標
          let imageLocationArray = [ [0,0], [0,1], [0,2], [1,0], [1,1], [1,2], [2,0], [2,1], [2,2]]
          
          // 空白處座標
          var emptyLocation = [0, 0]
          
          // 存放每個UIButton
          var imageArray: [UIButton] = [UIButton]()
          
          // 遊戲結束顯示訊息
          
    @IBOutlet weak var resultUILabel: UILabel!
    
    override func viewDidLoad() {
              super.viewDidLoad()
              self.imageArray = [
                  self.image1,
                  self.image2,
                  self.image3,
                  self.image4,
                  self.image5,
                  self.image6,
                  self.image7,
                  self.image8,
                  self.image9
              ]
          }


    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

       // 遊戲開始
       @IBAction func start(_ sender : UIButton) {
           
           sender.isHidden = true
           
//            隨機抽掉一張照片
//        let blankNum = Int.random(in: 0...8)
                let blankNum = 6

        print(blankNum )
//        let blankNum = 6
//        imageArray[6].setImage(UIImage(named: "blank.png"), for: .normal)

           imageArray[blankNum].setImage(UIImage(named: "blank.png"), for: .normal)
           print("check 1" )

           // 設定空白處座標
           emptyLocation = imageLocationArray[blankNum]

           // 拼圖打亂
        for _ in 1...20{
            print("check 2" )
               let randomNum = Int.random(in: 0...8)
               process(index : randomNum, image : imageArray[randomNum])
           }
       }
       
       // 按下圖片 ///////////////////////////////////////////////////////////
       @IBAction func clickImage(_ sender: UIButton) {
           for index in 0...imageArray.count-1{
               // 判斷使用者點選哪一張圖
               if sender == imageArray[index]{
                   process(index : index, image : sender)
                   // 是否勝利
                   if checkResult(){
                    imageArray[6].setImage(UIImage(named: "7.png"), for: .normal)

                      resultUILabel.text = "恭喜你勝利～～"
                   }
               }
           }

       }
       // 遊戲流程 ////////////////////////////////////////////////////////////////////
       func process(index : Int, image: UIButton){
           // 計算當前弄空白處座標和使用者點選座標
        print("check 3 ")
           if ableMove(xPoint : imageLocationArray[index][0], yPoint : imageLocationArray[index][1]) {
               // 交換圖片位置
                    changeImage(image : image)
               // 設定目前位置
                    setCurrentLocation(currentIndex : index)
               // 重新設定空白處座標
                    emptyLocation = [imageLocationArray[index][0], imageLocationArray[index][1]]
           }
       }
       
       // 使用畢氏定理取得距離，並判斷是否能夠移動圖片
       func ableMove(xPoint : Int, yPoint : Int) -> Bool {
           
           let distance =
               sqrt(
                   Double(
                       square(
                           val: (emptyLocation[0] - xPoint)
                       ) +
                       square(
                           val: (emptyLocation[1] - yPoint)
                       )
                   )
               )
       
           // 當距離為1，表示可以移動
           if distance == 1{
               return true;
           }
           // 當距離不為1，表示不可以移動
           else {
               return false;
           }
       }
       
       // 平方運算
       func square(val : Int) -> Int {
           return val * val
       }
       
       // 交換圖片位置
       func changeImage(image: UIButton){
           // 取得空白處位置
           for index in 0...imageLocationArray.count-1 {
               if imageLocationArray[index] == emptyLocation {
                   imageArray[index].setImage(image.image(for: .normal), for: .normal)
                   image.setImage(UIImage(named: "blank.jpeg"), for: .normal)
               }
           }
       }
       
       // 設定目前位置
       func setCurrentLocation(currentIndex : Int) {
           for index in 0...imageLocationArray.count-1 {
               if imageLocationArray[index] == emptyLocation {
                   let temp = currentLocation[index]
                   currentLocation[index] = currentLocation[currentIndex]
                   currentLocation[currentIndex] = temp
               }
           }
       }
       
       // 是否完成拼圖
       func checkResult() -> Bool {
           for index in 0...imageArray.count-1 {
               if currentLocation[index] != index {
                   return false
               }
           }
           return true;
       }
    
    
       //refresh
    
    @IBAction func Refresh(_ sender: UIButton) {
        Start_Show.isHidden=false
//        print("check refresh")
    
        for index in 1...9{
//            print("check refresh")
            let count_string=String(index)
            let fileStr = ".png"
            let filenameStr = count_string + fileStr
            imageArray[index-1].setImage(UIImage(named: filenameStr), for: .normal)

            print(filenameStr) //0~8
//            count+=1

        }
        
    }
    
}
