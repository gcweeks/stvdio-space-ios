// 
// Copyright 2020 Vector Creations Ltd
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation

@objcMembers
final class Section: NSObject {
    
    let tag: Int
    var rows: [Row]
    var headerTitle: String?
    
    init(withTag tag: Int) {
        self.tag = tag
        self.rows = []
        super.init()
    }
    
    static func section(withTag tag: Int) -> Section {
        return Section(withTag: tag)
    }
    
    func addRow(_ row: Row) {
        rows.append(row)
    }
    
    func addRow(withTag tag: Int) {
        addRow(Row.row(withTag: tag))
    }
    
    func addRows(withCount count: Int) {
        for i in 0..<count {
            addRow(Row.row(withTag: i))
        }
    }
    
    func indexOfRow(withTag tag: Int) -> Int? {
        return rows.firstIndex(where: { $0.tag == tag })
    }
    
    var hasAnyRows: Bool {
        return rows.isEmpty == false
    }
    
}
