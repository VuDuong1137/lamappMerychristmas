//
//  man2.swift
//  12GiangSinh
//
//  Created by Dương chãng on 12/21/19.
//  Copyright © 2019 macshop. All rights reserved.
//

import UIKit

class man2: UIViewController {
    var topview = customall(frame: .zero)
    var baihat = themnhac(frame: .zero)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.6998386582, blue: 0.4607814215, alpha: 1)
        view.addSubview(topview)
        topview.backgroundColor = .red
        topview.translatesAutoresizingMaskIntoConstraints = false
        topview.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        topview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32).isActive = true
        topview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        topview.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        view.addSubview(baihat)
        baihat.translatesAutoresizingMaskIntoConstraints = false
        baihat.topAnchor.constraint(equalTo: topview.bottomAnchor, constant: 20).isActive = true
        baihat.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        baihat.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        baihat.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -32).isActive = true
        
        // gropup 
        var data1 : CustomModel? = CustomModel(nameImage: "ct", name: "ct2", isFavorite: true)
        topview.setdata = data1
            // bươc 3 gọi Closure ở đây
            topview.passAction = {[weak self] in
                guard let strongSelf = self else{ return}
                data1?.isFavorite.toggle()
                strongSelf.topview.setdata = data1
            }
            // autumaticreversing
            
        }
    }

