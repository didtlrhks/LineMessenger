//
//  AppDelegate.swift
//  LineMessenger
//
//  Created by 양시관 on 3/10/24.
//

import Foundation
import FirebaseCore
import UIKit
import GoogleSignIn
import FirebaseAuth


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
    func application(_ app: UIApplication,
                     open url : URL,
                     options : [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}
