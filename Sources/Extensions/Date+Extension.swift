// 


import Foundation

public extension Date {
    var yesterday: Date {
        Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }

    var tomorrow: Date {
        Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
    
    /**
        UnixTime up to 1/100th of a second
     */
    func toHundredthsOfUnixTime() -> Double {
        let timeInterval = self.timeIntervalSince1970
        return floor(timeInterval * 100) / 100
    }
    
    func toString(
        _ format: String,
        _ locale: Locale = .japan,
        _ timezone: TimeZone = .japan
    ) -> String {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.timeZone = timezone
        formatter.dateFormat = format
        formatter.calendar = Calendar.current

        return formatter.string(from: self)
    }
}


public extension Date {
    func yearInt(
        _ locale: Locale = .japan,
        _ timezone: TimeZone = .japan
    ) -> Int {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateFormat = "yyyy"
        formatter.timeZone = timezone
        return Int(formatter.string(from: self)) ?? 0
    }
    
    func monthInt(
        _ locale: Locale = .japan,
        _ timezone: TimeZone = .japan
    ) -> Int {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateFormat = "MM"
        formatter.timeZone = timezone
        return Int(formatter.string(from: self)) ?? 0
    }
    
    func dateInt(
        _ locale: Locale = .japan,
        _ timezone: TimeZone = .japan
    ) -> Int {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateFormat = "dd"
        formatter.timeZone = timezone
        return Int(formatter.string(from: self)) ?? 0
    }
    
    func newYearsDate(
        _ locale: Locale = .japan,
        _ timezone: TimeZone = .japan
    ) -> Date {
        let year = self.yearInt(locale, timezone)
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(from: DateComponents(year: year, month: 1, day: 1))!
    }
}
