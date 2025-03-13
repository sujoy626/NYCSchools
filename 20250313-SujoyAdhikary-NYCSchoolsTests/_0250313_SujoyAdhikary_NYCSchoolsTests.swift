//
//  _0250313_SujoyAdhikary_NYCSchoolsTests.swift
//  20250313-SujoyAdhikary-NYCSchoolsTests
//
//  Created by Sujoy Adhikary on 13/03/25.
//

import Testing
@testable import _0250313_SujoyAdhikary_NYCSchools

struct _0250313_SujoyAdhikary_NYCSchoolsTests {
    var sut: SchoolListViewModel!
    
    init() {
        sut = SchoolListViewModel.init(service: SchoolListMockService())
    }
    
    
    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        
        #expect(sut.schools.isEmpty)
        
        sut.fetchData()
        
        #expect(sut.schools.count == 100)
        
    }

}
