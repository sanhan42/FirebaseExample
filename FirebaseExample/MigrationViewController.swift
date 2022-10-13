//
//  MigrationViewController.swift
//  FirebaseExample
//
//  Created by 한상민 on 2022/10/13.
//

import UIKit
import RealmSwift

class MigrationViewController: UIViewController {

    let localRealm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 1. fileURL
        print("FileURL: \(localRealm.configuration.fileURL)")
        
        // 2. Schema Version
        do {
            let version = try schemaVersionAtURL(localRealm.configuration.fileURL!)
            print("Schema Version: \(version)")
        } catch {
            print(error)
        }
        
        // 3. test를 위한 데이터 생성
        for i in 1...100 {
            let task = Todo(title: "고래밥의 할일 \(i)", importance: Int.random(in: 1...5))
            
            try! localRealm.write {
                localRealm.add(task)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
