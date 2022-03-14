//
//  HealthViewModel.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/14/22.
//

import Foundation
import Combine
import HealthKit

final class HealthViewModel: ObservableObject {
    
    private let userHealthProfile = UserHealthProfile()
    
    @Published var showHealthKitAuthorized = false
    
    @Published var age: String = ""
    @Published var sex: String = ""
    @Published var bloodType: String = ""
    @Published var weight: String = ""
    @Published var height: String = ""
    @Published var bmi: String = ""
    
    @Published var error: String = ""
    @Published var showError = false
    
    func authorizeHealthKit() {
        HealthKitSetupAssistant.authorizeHealthKit { [weak self] (authorized, error) in
            guard let self = self else { return }
            guard authorized else {
                
            let baseMessage = "HealthKit Authorization Failed"
                
            if let error = error {
              print("\(baseMessage). Reason: \(error.localizedDescription)")
            } else {
              print(baseMessage)
            }
                
            return
            }

            print("HealthKit Successfully Authorized.")
            DispatchQueue.main.async {
                self.showHealthKitAuthorized = true
            }
        }
    }
}

extension HealthViewModel {
    func updateHealthInfo() {
      loadAndDisplayAgeSexAndBloodType()
      loadAndDisplayMostRecentWeight()
      loadAndDisplayMostRecentHeight()
    }
    
    private func loadAndDisplayAgeSexAndBloodType() {
        do {
          let userAgeSexAndBloodType = try ProfileDataStore.getAgeSexAndBloodType()
          userHealthProfile.age = userAgeSexAndBloodType.age
          userHealthProfile.biologicalSex = userAgeSexAndBloodType.biologicalSex
          userHealthProfile.bloodType = userAgeSexAndBloodType.bloodType
          updateLabels()
        } catch let error {
          self.displayAlert(for: error)
        }
    }
    
    private func updateLabels() {
        if let age = userHealthProfile.age {
            self.age = "\(age)"
        }

        if let biologicalSex = userHealthProfile.biologicalSex {
            self.sex = biologicalSex.stringRepresentation
        }

        if let bloodType = userHealthProfile.bloodType {
            self.bloodType = bloodType.stringRepresentation
        }
        
        if let weight = userHealthProfile.weightInKilograms {
          let weightFormatter = MassFormatter()
          weightFormatter.isForPersonMassUse = true
            self.weight = weightFormatter.string(fromKilograms: weight)
        }
            
        if let height = userHealthProfile.heightInMeters {
          let heightFormatter = LengthFormatter()
          heightFormatter.isForPersonHeightUse = true
            self.height = heightFormatter.string(fromMeters: height)
        }
           
        if let bodyMassIndex = userHealthProfile.bodyMassIndex {
            self.bmi = String(format: "%.02f", bodyMassIndex)
        }
    }
    
    private func loadAndDisplayMostRecentHeight() {
        //1. Use HealthKit to create the Height Sample Type
        guard let heightSampleType = HKSampleType.quantityType(forIdentifier: .height) else {
          print("Height Sample Type is no longer available in HealthKit")
          return
        }
            
        ProfileDataStore.getMostRecentSample(for: heightSampleType) { (sample, error) in
              
          guard let sample = sample else {
              
            if let error = error {
              self.displayAlert(for: error)
            }
                
            return
          }
              
          //2. Convert the height sample to meters, save to the profile model,
          //   and update the user interface.
          let heightInMeters = sample.quantity.doubleValue(for: HKUnit.meter())
          self.userHealthProfile.heightInMeters = heightInMeters
          self.updateLabels()
        }
    }
    
    private func loadAndDisplayMostRecentWeight() {
        guard let weightSampleType = HKSampleType.quantityType(forIdentifier: .bodyMass) else {
          print("Body Mass Sample Type is no longer available in HealthKit")
          return
        }
            
        ProfileDataStore.getMostRecentSample(for: weightSampleType) { (sample, error) in
              
          guard let sample = sample else {
                
            if let error = error {
              self.displayAlert(for: error)
            }
            return
          }
              
          let weightInKilograms = sample.quantity.doubleValue(for: HKUnit.gramUnit(with: .kilo))
          self.userHealthProfile.weightInKilograms = weightInKilograms
          self.updateLabels()
        }
    }
    
    private func saveBodyMassIndexToHealthKit() {
        guard let bodyMassIndex = userHealthProfile.bodyMassIndex else {
          displayAlert(for: ProfileDataError.missingBodyMassIndex)
          return
        }
            
        ProfileDataStore.saveBodyMassIndexSample(bodyMassIndex: bodyMassIndex,
                                                 date: Date())
    }
    
    private func displayAlert(for error: Error) {
        self.error = error.localizedDescription
        self.showError = true
    }
}

private enum ProfileSection: Int {
  case ageSexBloodType
  case weightHeightBMI
  case readHealthKitData
  case saveBMI
}

private enum ProfileDataError: Error {
  
  case missingBodyMassIndex
  
  var localizedDescription: String {
    switch self {
    case .missingBodyMassIndex:
      return "Unable to calculate body mass index with available profile data."
    }
  }
}
