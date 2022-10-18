//
//  CollectionViewController.swift
//  ClassList
//
//  Created by AHMET HAKAN YILDIRIM on 11.10.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    var selectedIndex = 0
    var students: [Student] = [Student]()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            
            let rowValue: CGFloat = 3
            let space : CGFloat = 4
            let totalSpace = space * (rowValue - 1)
            let itemSpace = totalSpace / rowValue
            let width = collectionView.frame.width / rowValue - itemSpace
            let height = width
            layout.itemSize = CGSize(width: width, height: height)
            layout.minimumInteritemSpacing = space
            layout.minimumLineSpacing = space
        }
        
        let student1 = Student(name: "Ahmet", studentNumber: "1",image: "manga")
        let student2 = Student(name: "Hakan", studentNumber: "2",image: "istanbul")
        let student3 = Student(name: "Emirhan", studentNumber: "3",image: "pera")
        let student4 = Student(name: "Furkan", studentNumber: "4",image: "ss")
        let student5 = Student(name: "Mert", studentNumber: "5",image: "manga")
        let student6 = Student(name: "Yılmaz", studentNumber: "6",image: "ss")
        
        students.append(student1)
        students.append(student2)
        students.append(student3)
        students.append(student4)
        students.append(student5)
        students.append(student6)
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return students.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // her bir hücre oluşturulduğu zaman burası çalışır
        // burada bir hücre oluşturmamız lazım
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        if let customCell = cell as? CollectionViewCell {
            customCell.lblStudent.text = students[indexPath.row].name
            return customCell
        }
        
        return cell 
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
       // print(selectedIndex)
        performSegue(withIdentifier: "details", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // perform segue çalışmadan burası çalışır
        // veri göndermek istediğimizde kullanırız
        
        if let vc = segue.destination as? ViewController {
            vc.student = students[selectedIndex]
        }
    }

}
