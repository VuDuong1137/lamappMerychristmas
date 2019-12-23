//
//  themnhac.swift
//  12GiangSinh
//
//  Created by Dương chãng on 12/23/19.
//  Copyright © 2019 macshop. All rights reserved.
//

import UIKit
import AVFoundation

class themnhac: UIView {
    
    let imagethemnhac: UIImageView = {
        let imagethemnhac = UIImageView()
        imagethemnhac.translatesAutoresizingMaskIntoConstraints = false
        imagethemnhac.backgroundColor = .red
         imagethemnhac.loadGif(name: "12")
        imagethemnhac.layer.cornerRadius = 20
        imagethemnhac.contentMode = .scaleAspectFit
        return imagethemnhac
    }()
    
    // khai báo một biến soundPlayer
    var soundPlayer: AVAudioPlayer?
    
    
    func setupall() {
        
        self.addSubview(imagethemnhac)
        
        imagethemnhac.topAnchor.constraint(equalTo: self.topAnchor, constant: 25).isActive = true
        //        imagethemnhac.bottomAnchor.constraint(equalTo: self.topAnchor, constant: -5).isActive = true
        imagethemnhac.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        imagethemnhac.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        imagethemnhac.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 9/10).isActive = true
    }
    override init(frame: CGRect) {
        super.init(frame : frame)
        self.backgroundColor = .red
        self.layer.cornerRadius = 20
        setupall()
        playSound()
        
        
        
        // thêm ảnh từ internet
        //        let url: URL = URL(string: "https://i.pinimg.com/originals/7d/cf/da/7dcfda84c94f4077d4d8eb6bfaa63eca.gif")!
        //        do{
        //        let anhdep: Data = try Data(contentsOf: url)
        //            imagethemnhac.contentMode = .scaleAspectFit
        //            imagethemnhac.image = UIImage(data: anhdep)
        //
        //        }
        //        catch
        //        {
        //            print("không lấy được dũ liệu nhé")
        //        }
    }
    
    func playSound(){
        let path = Bundle.main.path(forResource: "We Wish You A Merry Christmas - Crazy Frog (NhacPro.net).mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: url)
            soundPlayer?.play()
            // đặt numberOfLoops = -1 để nó chạy lại khi chạy hết
            soundPlayer?.numberOfLoops = 1
        } catch {
            print("lỗi")
            // couldn't load file :(
        }
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
