import Foundation
import CoreLocation

let PI: Double = 3.1415926535897932384626
let a: Double = 6378245.0
let ee: Double = 0.00669342162296594323
let x_PI: Double = 3.14159265358979324 * 3000.0 / 180.0

extension CLLocationCoordinate2D {
    /**
     * 百度坐标系 (BD-09) 与 火星坐标系 (GCJ-02)的转换
     * 即 百度 转 谷歌、高德
     */
    func BD09ToGCJ02() -> CLLocationCoordinate2D {
        let x_pi = 3.14159265358979324 * 3000.0 / 180.0
        let x = self.longitude - 0.0065
        let y = self.latitude - 0.006
        let z = sqrt(x * x + y * y) - 0.00002 * sin(y * x_pi)
        let theta = atan2(y, x) - 0.000003 * cos(x * x_pi)
        let gcj_longitude = z * cos(theta)
        let gcj_latitude  = z * sin(theta)
        return CLLocationCoordinate2DMake(gcj_longitude, gcj_latitude)
    }

    /**
     * 火星坐标系 (GCJ-02) 与百度坐标系 (BD-09) 的转换
     * 即谷歌、高德 转 百度
     */
    func GCJ02ToBD09() -> CLLocationCoordinate2D {
        let z = sqrt(self.longitude * self.longitude + self.latitude * self.latitude) + 0.00002 * sin(self.latitude * x_PI)
        let theta = atan2(self.latitude, self.longitude) + 0.000003 * cos(self.longitude * x_PI)
        let bd_longitude = z * cos(theta) + 0.0065
        let bd_latitude = z * sin(theta) + 0.006
        return CLLocationCoordinate2D(latitude: bd_longitude, longitude: bd_latitude)
    }
}
