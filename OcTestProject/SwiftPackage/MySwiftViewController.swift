//
//  MySwiftClass.swift
//  OcTestProject
//
//  Created by X C on 2019/12/8.
//  Copyright © 2019 X C. All rights reserved.
//

import Foundation

class MySwiftViewController: NSObject {
    @objc func swiftTest(arg: String) -> String {
        return "test"
    }

    @objc func gotoDetailPage() {

        _ = NSObject()

    }

    @objc func gotoDetailPage(controller: UIViewController) {
        let nextController: DetailPageViewController = DetailPageViewController()
        nextController.receiveText = "swift Text receiveText"
        controller.navigationController?.pushViewController(nextController, animated: true)
    }

}

