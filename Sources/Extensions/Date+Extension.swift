// 


import Foundation

public extension Date {
    /**
     Yesterday at the same time as self
     */
    var yesterday: Date {
        Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }

    /**
     Tomorrow at the same time as self
     */
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
    
    /**
     Date to String with custom format
     */
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
    
    /**
     get yyyy-MM-dd 00:00:00
     */
    func onlyDate() -> Date {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: self)
        let date = Calendar.current.date(from: components)
        return date!
    }
}


public extension Date {
    /**
     yyyy to Int
     */
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
    
    /**
     MM to Int
     */
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
    
    /**
     dd to Int
     */
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
    
    /**
     first date of this year
     */
    func newYearsDate(
        _ locale: Locale = .japan,
        _ timezone: TimeZone = .japan
    ) -> Date {
        let year = self.yearInt(locale, timezone)
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(from: DateComponents(year: year, month: 1, day: 1))!
    }
}
