//
//  ViewController.swift
//  ClassList
//
//  Created by AHMET HAKAN YILDIRIM on 11.10.2022.
//

import UIKit

class ViewController: UIViewController {

        
    @IBOutlet var lblStudentName: UILabel!
    @IBOutlet var lblStudentNumber: UILabel!
    @IBOutlet var lblStudentImage: UIImageView!
    
    var student: Student?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let name = student?.name ?? "Bilinmiyor"
        let studentNumber = student?.studentNumber ?? "Bilinmiyor"
        let studentImage = student?.image ?? ""
        
        lblStudentName.text = name
        lblStudentNumber.text = studentNumber
        lblStudentImage.image = UIImage(named: studentImage)
    }


}

