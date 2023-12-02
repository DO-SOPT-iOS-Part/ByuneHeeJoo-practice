//
//  Observable.swift
//  DO_SOPT_Seminar_Practice
//
//  Created by 변희주 on 2023/12/02.
//

import Foundation

final class Observable<T> {
  typealias Listener = (T) -> Void
  var listener: Listener?
  
    var value: T {
    didSet {
      listener?(value)
    }
  }
    
  init(_ value: T) {
    self.value = value
  }
    
  func bind(listener: Listener?) {
    self.listener = listener
    listener?(value)
  }
    
}
