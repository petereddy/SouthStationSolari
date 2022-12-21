//
//  ArrivalOrDeparture.swift
//  SouthStationSolari
//
//  Created by Peter Eddy on 12/20/22.
//

import Foundation

struct TrainInfo {
  // MBTA | AMTRAK
  let carrier: String
  let time: Date
  let destination: String
  // Max 4 numbers
  let trainNumber: String
  // Max 3 numbers
  let trackNumber: String
  // Max 14 (?) chars
  let status: String
}
