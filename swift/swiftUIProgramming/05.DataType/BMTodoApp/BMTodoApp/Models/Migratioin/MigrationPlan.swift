//
//  MigrationPlan.swift
//  BMTodoApp
//
//  Created by 정보경 on 1/21/25.
//

import Foundation
import SwiftData
enum MigrationPlan: SchemaMigrationPlan {
    static var schemas: [any VersionedSchema.Type] {
        [SchemaV1.self, SchemaV2.self]
    }
    
    static var stages: [MigrationStage] {
        [
            MigrationStage.lightweight(fromVersion: SchemaV1.self, toVersion: SchemaV2.self)
        ]
    }
}
