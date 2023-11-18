//
//  AppConfigurations.swift
//  MVVMNewsApp
//
//  Created by 2B on 05/11/2023.
//

import Foundation

fileprivate var baseDomain = "https://newsapi.org/v2/"
fileprivate var endPoint = "top-headlines?country=us&apiKey="
fileprivate var apiKey = "bd80c9295d1240a5a19158284b2a1d30"

var newsApi = baseDomain + endPoint + apiKey
