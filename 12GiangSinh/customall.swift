//
//  customall.swift
//  12GiangSinh
//
//  Created by Dương chãng on 12/21/19.
//  Copyright © 2019 macshop. All rights reserved.
//

import UIKit

class customall: UIView {
    let imageview: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.loadGif(name: "42")
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    let bottomView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.layer.borderWidth = 3
        view.layer.borderColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 0.5735259423, blue: 0.2825310853, alpha: 1)
        return view
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.text = "MERRY CHRISTMAS"
        label.textAlignment = .center
        //label.layer.cornerRadius = 30
        
        label.backgroundColor = #colorLiteral(red: 1, green: 0.5735259423, blue: 0.2825310853, alpha: 1)
        label.textAlignment = .center
        //label.font = UIFont.boldSystemFont(ofSize: 12)
        label.font = UIFont(name: "InriaSerif-Bold", size: 12)
        //label.font = UIFont(name: "MaShanZheng-Regular", size: 12)
        //label.font = UIFont(name:"InriaSerif-Bold", size: 36)
        return label
    }()
    let favoriteImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "ct")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    func setuplayout(){
        self.addSubview(imageview)
        self.addSubview(bottomView)
        bottomView.addSubview(favoriteImageView)
        bottomView.addSubview(nameLabel)
        imageview.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        imageview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true
        imageview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        // chiều cao của imageview bằng 3/4 chiều cao của self
        imageview.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 3/4).isActive = true
        
        // tao bottomview để làm cha của lable và favoriteView
        // cái top của bottomView này cách đáy của cái imageview này = 4
        bottomView.topAnchor.constraint(equalTo: imageview.bottomAnchor, constant: 2).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        
        favoriteImageView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -30).isActive = true
        //fig cho nó chièu rông kích thước cố dịnh là 32
        favoriteImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        // dài bằng rộng vs kich thước bằng 1
        favoriteImageView.heightAnchor.constraint(equalTo: favoriteImageView.widthAnchor, multiplier: 1).isActive = true
        // mai hoie cô giáo
        favoriteImageView.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        
        nameLabel.rightAnchor.constraint(equalTo: favoriteImageView.leftAnchor, constant: -10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 10).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        
    }
    // group
    var isFavorite: Bool = false
      // tạo biến setdata, biến này có thể nil
    var setdata : CustomModel? {
           // hàm didset được gọi khi nhận thấy giữ liệu thay đổi
           didSet{
               if let data = setdata {
                   imageview.image = UIImage(named: data.nameImage)
                  // nameLabel.text = data.name
                   isFavorite = data.isFavorite
                   favoriteImageView.image = isFavorite ? UIImage(named: "ct") : UIImage(named: "ct2")
               } else {
                   print("nil")
               }
           }
       }
    // group bươc1 khai báo một closure
    var passAction: (() ->  Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.cornerRadius = 10
        setuplayout()
        // croup
        favoriteImageView.isUserInteractionEnabled = true
        favoriteImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapIcon)))
        
    }
    
       @objc func tapIcon(){
            
            // group bươc2 đăng ký closure
            passAction?()
            print("tap icon")
    //        isFavorite.toggle()
    //        favoriteImageView.image = isFavorite ? UIImage(named: "conho") : UIImage(named: "3")
    //
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
