//
//  DateCollectionView.swift
//  Liken
//
//  Created by Qahtan on 11/20/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class DateCollectionView: UICollectionView {
    
    var dates: [Date]!
    let cellId = "cellId"
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.register(DateCell.self, forCellWithReuseIdentifier: cellId)
        
        self.backgroundColor = .white
        self.isPagingEnabled = true
        
        self.contentInset = UIEdgeInsetsMake(5, 5, 5, 5)
        let date = Date()
        var startDate = DateComponents()
        startDate.year = 2018
        startDate.month = 11
        startDate.day = 30
        let calendar =  NSCalendar.current
        let startDateNSDate = calendar.date(from: startDate )
        dates = generateDatesArrayBetweenTwoDates(startDate: Date(), endDate: startDateNSDate!)
        self.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    func generateDatesArrayBetweenTwoDates(startDate: Date , endDate:Date) ->[Date]{
        var datesArray: [Date] =  [Date]()
        var startDate = startDate
        let calendar = Calendar.current
        
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
        
        while startDate <= endDate {
            datesArray.append(startDate)
            startDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
        }
        return datesArray
    }
}
extension DateCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DateCell
//        cell.layer.cornerRadius = 45
//        cell.layer.masksToBounds = false
        cell.date = dates[indexPath.row]
        return cell
    }
    
    
}
