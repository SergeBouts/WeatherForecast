import SwiftUI

struct CityList: Codable {

    // MARK: - Properties

    let cities: [City]

    static let jsonFileName = "cities"

    // MARK: - Methods

    static func make() -> CityList {
        
        do {
            let url = Bundle.main.url(forResource: jsonFileName, withExtension: "json")!
            let data = try Data(contentsOf: url)
            let cityList = try JSONDecoder().decode(CityList.self, from: data)
            return cityList
        } catch {
            preconditionFailure("\(jsonFileName).json is missing or corrupt.")
        }
    }
}

