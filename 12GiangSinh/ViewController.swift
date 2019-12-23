//
//  ViewController.swift
//  12GiangSinh
//
//  Created by Dương chãng on 12/21/19.
//  Copyright © 2019 macshop. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIScrollViewDelegate {
    
    
    
    let ScrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        view.backgroundColor = .red
        view.contentSize = CGSize(width: UIScreen.main.bounds.width * 3, height: UIScreen.main.bounds.height / 2)
        view.isPagingEnabled = true
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    let vethemView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height / 2, width: UIScreen.main.bounds.width, height: 50)
        let hypo: CGFloat = CGFloat(sqrtf(powf(Float(UIScreen.main.bounds.height / 2), 2) + powf(Float(UIScreen.main.bounds.width / 2), 2)))
        let path = UIBezierPath(
            arcCenter: CGPoint(x: UIScreen.main.bounds.width / 2, y: -UIScreen.main.bounds.height / 2),
            radius: hypo,
            startAngle: 0, endAngle: CGFloat(Float.pi * 2), clockwise: true)
        let subLayer = CAShapeLayer()
        subLayer.path = path.cgPath
        subLayer.fillColor = UIColor.red.cgColor
        view.layer.addSublayer(subLayer)
        view.layer.masksToBounds = true
        return view
    }()
    let i1View: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        let image = UIImageView(image: UIImage(named: ""))
        image.loadGif(name: "caynen")
        image.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        view.addSubview(image)
        image.center = view.center
        return view
    }()
    let i2View: UIView = {
        let view = UIView()
        view.frame = CGRect(x: UIScreen.main.bounds.width, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        let image = UIImageView(image: UIImage(named: ""))
        image.loadGif(name: "amap")
        image.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        //image.frame = CGRect(x: UIScreen.main.bounds.width / 4, y: UIScreen.main.bounds.height / 4 - 100, width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 2)
        view.addSubview(image)
        return view
    }()
    let i3View: UIView = {
        let view = UIView()
        view.frame = CGRect(x: UIScreen.main.bounds.width * 2, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        let image = UIImageView(image: UIImage(named: ""))
        image.loadGif(name: "thatcool")
        image.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        //image.frame = CGRect(x: UIScreen.main.bounds.width / 4, y: UIScreen.main.bounds.height / 4 - 100, width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 2)
        view.addSubview(image)
        return view
    }()
    let pageControl: UIPageControl = {
        let page = UIPageControl()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.center.x = UIScreen.main.bounds.maxX / 2
        page.currentPageIndicatorTintColor = .yellow
        page.pageIndicatorTintColor = .red
        page.numberOfPages = 3
        page.currentPage = 0
        return page
    }()
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Chúc mọi người một mùa Giáng sinh an lành, hạnh phúc. MERRY CHRISTMAS"
        label.textColor = .red
        label.numberOfLines = 2
        label.textAlignment = .center
        
        //label.textColor = #colorLiteral(red: 0.7633899711, green: 1, blue: 0.08576181886, alpha: 1)
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    // tạo nut buuton để chuyển màn
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 6
        button.backgroundColor = .red
        button.setTitle("Giáng Sinh An Lành", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    let bottomLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.text = "Ấp Áp Bên Người Thân, Hạnh Phúc Bên Gia Đình"
        label.numberOfLines = 2
        //label.textColor = UIColor.yellow
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15)
        //label.textColor = #colorLiteral(red: 0.7633899711, green: 1, blue: 0.08576181886, alpha: 1)
        return label
    }()
    
    var soundPlayer: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        playSound()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.7511937475, blue: 0.4843805963, alpha: 1)
        view.addSubview(ScrollView)
        ScrollView.addSubview(i1View)
        ScrollView.addSubview(i2View)
        ScrollView.addSubview(i3View)
        view.addSubview(vethemView)
        view.addSubview(pageControl)
        view.addSubview(label)
        view.addSubview(loginButton)
        view.addSubview(bottomLabel)
        setuplayout()
        
        ScrollView.delegate = self
        // cách chuyển màn bước1
        loginButton.addTarget(self, action: #selector(Màn2), for: .touchUpInside)
    }
    func setuplayout(){
        
        ScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        ScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        ScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        ScrollView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2 + 50).isActive = true
        
        vethemView.topAnchor.constraint(equalTo: ScrollView.bottomAnchor, constant: 0).isActive = true
        vethemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        vethemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        vethemView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        pageControl.topAnchor.constraint(equalTo: vethemView.topAnchor, constant: 50).isActive = true
        pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        label.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 32).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 32).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        bottomLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 32).isActive = true
        bottomLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64).isActive = true
        bottomLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64).isActive = true
        bottomLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Xác định toạ độ khung nhìn của scrollView để thay đổi số trang hiện tại của pageControl
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    // bước 2 chuyển màn 2
    @objc func Màn2() {
        let chuyenman = man2()
        let navigation = UINavigationController(rootViewController: chuyenman)
        navigation.modalPresentationStyle = .fullScreen
        present(navigation, animated: true, completion: nil)
    }
    func playSound(){
        let path = Bundle.main.path(forResource: "NhacChuongNoelHoaTau4g7pq.mp3", ofType:nil)!
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
    
    
    
}
