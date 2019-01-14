//
//  ViewController.swift
//  Swifter
//
//  Created by Chunyang Li 李春阳 on 2018/12/25.
//  Copyright © 2018年 Chunyang Li 李春阳. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildUserInterface()
        
        guard let path: String = Bundle.main.path(forResource: "data", ofType: "json") else {
            return 
        }
        guard let loaclData: Data = NSData(contentsOfFile: path) as Data? else {
            return
        }
        
        do {
            let students: Student = try JSONDecoder().decode(Student.self, from: loaclData)
            print(students)
        } catch {
            return
        }
        
        guard let uiImage: UIImage = UIImage(named: "image") else {
            return
        }
        guard let cgImage: CGImage = uiImage.asCG() else {
            return
        }
        guard let ciImage: CIImage = uiImage.asCI() else {
            return
        }
        print(uiImage)
        print(cgImage)
        print(ciImage)
    }
    
    public func buildUserInterface() {
        view.backgroundColor = UIColor.white
        aop(with: {
            print("A")
        })
    }

}
