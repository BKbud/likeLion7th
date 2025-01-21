//
//  SiriDemoIntent.swift
//  SiriDemoIntent
//
//  Created by 정보경 on 1/20/25.
//

import AppIntents

struct SiriDemoIntent: AppIntent {
    static var title: LocalizedStringResource { "SiriDemoIntent" }
    
    func perform() async throws -> some IntentResult {
        return .result()
    }
}
