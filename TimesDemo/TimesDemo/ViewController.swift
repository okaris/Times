//
//  ViewController.swift
//  TimesDemo
//
//  Created by Okaris 2017 on 09/10/2017.
//  Copyright © 2017 okaris. All rights reserved.
//

import UIKit
import Times

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  @IBAction func showOnce() {
    Times.shared.onceForSession(forKey: "once-alert") {
      let alertView = UIAlertView(title: "Once", message: "This will only show once until you kill and restart the app.", delegate: nil, cancelButtonTitle: "Okay")
      alertView.alertViewStyle = .default
      alertView.show()
    }
  }

  @IBAction func showTwice() {
    Times.shared.twiceForSession(forKey: "twice-alert") {
      let alertView = UIAlertView(title: "Once", message: "This will only show twice until you kill and restart the app.", delegate: nil, cancelButtonTitle: "Okay")
      alertView.alertViewStyle = .default
      alertView.show()
    }
  }

  @IBAction func showOnceForever() {
    Times.shared.once(forKey: "once-lifetime-alert") {
      let alertView = UIAlertView(title: "Once", message: "This will only show once until you delete and reinstall the app.", delegate: nil, cancelButtonTitle: "Okay")
      alertView.alertViewStyle = .default
      alertView.show()
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

