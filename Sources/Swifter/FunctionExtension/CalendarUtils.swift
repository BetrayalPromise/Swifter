#if os(iOS)

import UIKit

public extension Calendar {
    /// Return the number of days in the month for a specified 'Date'.
    ///
    /// - Parameter date: the date form which the number of days in month is calculated.
    /// - Returns: the number of days in the month of 'Date'.
    func daysOfMonth(for date: Date) -> Int {
        return range(of: .day, in: .month, for: date)?.count ?? 0
    }
}

#endif
