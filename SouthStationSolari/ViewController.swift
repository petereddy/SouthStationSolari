//
//  ViewController.swift
//  SouthStationSolari
//
//  Created by Peter Eddy on 12/20/22.
//

import UIKit
import Splitflap

class ViewController: UIViewController, SplitflapDataSource, SplitflapDelegate {
  
  static let CharacterSet = " ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".map { String($0) }

  @IBOutlet weak var splitflap: Splitflap!
  @IBOutlet weak var actionButton: UIButton!

  private let words        = ["TRAIN", "BOAT", "12h15", "ARRIVAL"]
  private var currentIndex = 0

  override func viewDidLoad() {
    super.viewDidLoad()

    splitflap.datasource = self
    splitflap.delegate   = self
    splitflap.reload()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    updateSplitFlapAction()
  }

  // MARK: - Action Methods

  @IBAction func updateSplitFlapAction() {
    splitflap.setText(words[currentIndex], animated: true, completionBlock: {
      print("Display finished!")
    })

    currentIndex = (currentIndex + 1) % words.count
//    updateButtonWithTitle(words[currentIndex])
  }

  private func updateButtonWithTitle(_ title: String) {
    actionButton.setTitle("Say \(words[currentIndex])!", for: .normal)
  }

  // MARK: - Splitflap DataSource Methods

  func numberOfFlapsInSplitflap(_ splitflap: Splitflap) -> Int {
    return 10
  }

  func tokensInSplitflap(_ splitflap: Splitflap) -> [String] {
    return ViewController.CharacterSet
  }

  // MARK: - Splitflap Delegate Methods

  func splitflap(_ splitflap: Splitflap, rotationDurationForFlapAtIndex index: Int) -> Double {
    return 0.15
  }
  
  func splitflap(_ splitflap: Splitflap, builderForFlapAtIndex index: Int) -> FlapViewBuilder {
    return FlapViewBuilder { builder in
      builder.backgroundColor = UIColor.black
      builder.cornerRadius    = 5
      builder.font            = UIFont(name: "Menlo", size: 70)
      builder.textAlignment   = .center
      builder.textColor       = UIColor.white
      builder.lineColor       = UIColor.darkGray
    }
  }
}

