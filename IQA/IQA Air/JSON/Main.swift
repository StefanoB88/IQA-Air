/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

struct Main : Codable {
    
	let data : [Data]?
	let city_name : String?
	let lon : Double?
	let timezone : String?
	let lat : Double?
	let country_code : String?
	let state_code : String?

	enum CodingKeys: String, CodingKey {

		case data = "data"
		case city_name = "city_name"
		case lon = "lon"
		case timezone = "timezone"
		case lat = "lat"
		case country_code = "country_code"
		case state_code = "state_code"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		data = try values.decodeIfPresent([Data].self, forKey: .data)
		city_name = try values.decodeIfPresent(String.self, forKey: .city_name)
		lon = try values.decodeIfPresent(Double.self, forKey: .lon)
		timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
		lat = try values.decodeIfPresent(Double.self, forKey: .lat)
		country_code = try values.decodeIfPresent(String.self, forKey: .country_code)
		state_code = try values.decodeIfPresent(String.self, forKey: .state_code)
	}
    
    init() {
        self.data = nil
        self.city_name = nil
        self.lon = nil
        self.timezone = nil
        self.lat = nil
        self.country_code = nil
        self.state_code = nil
    }

}
