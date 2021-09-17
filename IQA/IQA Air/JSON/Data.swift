/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Data : Codable {
	let mold_level : Int?
	let aqi : Int?
	let pm10 : Double?
	let co : Double?
	let o3 : Double?
	let predominant_pollen_type : String?
	let so2 : Double?
	let pollen_level_tree : Int?
	let pollen_level_weed : Int?
	let no2 : Double?
	let pm25 : Double?
	let pollen_level_grass : Int?

	enum CodingKeys: String, CodingKey {

		case mold_level = "mold_level"
		case aqi = "aqi"
		case pm10 = "pm10"
		case co = "co"
		case o3 = "o3"
		case predominant_pollen_type = "predominant_pollen_type"
		case so2 = "so2"
		case pollen_level_tree = "pollen_level_tree"
		case pollen_level_weed = "pollen_level_weed"
		case no2 = "no2"
		case pm25 = "pm25"
		case pollen_level_grass = "pollen_level_grass"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		mold_level = try values.decodeIfPresent(Int.self, forKey: .mold_level)
		aqi = try values.decodeIfPresent(Int.self, forKey: .aqi)
		pm10 = try values.decodeIfPresent(Double.self, forKey: .pm10)
		co = try values.decodeIfPresent(Double.self, forKey: .co)
		o3 = try values.decodeIfPresent(Double.self, forKey: .o3)
		predominant_pollen_type = try values.decodeIfPresent(String.self, forKey: .predominant_pollen_type)
		so2 = try values.decodeIfPresent(Double.self, forKey: .so2)
		pollen_level_tree = try values.decodeIfPresent(Int.self, forKey: .pollen_level_tree)
		pollen_level_weed = try values.decodeIfPresent(Int.self, forKey: .pollen_level_weed)
		no2 = try values.decodeIfPresent(Double.self, forKey: .no2)
		pm25 = try values.decodeIfPresent(Double.self, forKey: .pm25)
		pollen_level_grass = try values.decodeIfPresent(Int.self, forKey: .pollen_level_grass)
	}

    init() {
        self.mold_level = nil
        self.aqi = nil
        self.pm10 = nil
        self.co = nil
        self.o3 = nil
        self.predominant_pollen_type = nil
        self.so2 = nil
        self.pollen_level_tree = nil
        self.pollen_level_weed = nil
        self.no2 = nil
        self.pm25 = nil
        self.pollen_level_grass = nil
    }
}
