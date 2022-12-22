//
//  SolariBoardRow.swift
//  SouthStationSolari
//
//  Created by Peter Eddy on 12/20/22.
//

import UIKit
import Splitflap

@IBDesignable open class SolariBoardRow: UIView, SplitflapDataSource {
  
  static let CharacterSet = " ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".map { String($0) }
  
  let rowStackView = UIStackView()
  
  let carrierSplitflap = Splitflap()
  let timeSplitflap = Splitflap()
  let destinationSplitflap = Splitflap()
  let trainNumberSplitflap = Splitflap()
  let trackNumberSplitflap = Splitflap()
  let statusSplitFlap = Splitflap()
  
  override public init(frame: CGRect) {
    super.init(frame: frame)
    initComponents()
  }
  
  required public init?(coder: NSCoder) {
    super.init(coder: coder)
    initComponents()
  }
  
  private func initComponents() {
    carrierSplitflap.datasource = self
    timeSplitflap.datasource = self
    destinationSplitflap.datasource = self
    trainNumberSplitflap.datasource = self
    trackNumberSplitflap.datasource = self
    statusSplitFlap.datasource = self
  }
  
  // MARK: - Splitflap DataSource Methods
  public func numberOfFlapsInSplitflap(_ splitflap: Splitflap) -> Int {
    switch splitflap {
    case carrierSplitflap: return 8
    case timeSplitflap: return 6
    case destinationSplitflap: return 4
    case trainNumberSplitflap: return 4
    case trackNumberSplitflap: return 2
    case statusSplitFlap: return 8
    default: return 0
    }
  }
    
  public func tokensInSplitflap(_ splitflap: Splitflap) -> [String] {
    switch splitflap {
      //    case carrierSplitflap: return
      //    case timeSplitflap: return 6
      //    case destinationSplitflap: return 4
      //    case trainNumberSplitflap: return 4
      //    case trackNumberSplitflap: return 2
      //    case statusSplitFlap: return 8
    default: return SolariBoardRow.CharacterSet
    }
  }
  
  // MARK: - Splitflap Delegate Methods

  func splitflap(_ splitflap: Splitflap, rotationDurationForFlapAtIndex index: Int) -> Double {
    return 0.15
  }
  
  func splitflap(_ splitflap: Splitflap, builderForFlapAtIndex index: Int) -> FlapViewBuilder {
    return FlapViewBuilder { builder in
      builder.backgroundColor = UIColor.black
      builder.cornerRadius    = 5
      builder.font            = UIFont(name: "Menlo", size: 30)
      builder.textAlignment   = .center
      builder.textColor       = UIColor.white
      builder.lineColor       = UIColor.darkGray
    }
  }
}

struct SplitflapDataSourceData {
  let numberOfFlaps: Int
  let tokens: CharacterSet
}
