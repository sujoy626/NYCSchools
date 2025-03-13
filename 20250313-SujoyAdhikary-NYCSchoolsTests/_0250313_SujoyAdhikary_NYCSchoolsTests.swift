//
//  _0250313_SujoyAdhikary_NYCSchoolsTests.swift
//  20250313-SujoyAdhikary-NYCSchoolsTests
//
//  Created by Sujoy Adhikary on 13/03/25.
//

import Testing
@testable import _0250313_SujoyAdhikary_NYCSchools


//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//MARK: - Some reason I am not able to run the test cases. It is giving me the following error:
    //- after build successful, simulator not responding even restating the simulator until system restart


struct _0250313_SujoyAdhikary_NYCSchoolsTests {
    var sut: SchoolListViewModel!
    var sutSchoolDetails: SchoolDetailsViewModel!
    
    init() {
        sut = SchoolListViewModel.init(service: SchoolListMockService())
        sutSchoolDetails = SchoolDetailsViewModel.init(
            school: SchoolListModel.getDummySchool(),
            service: SchoolScoreMockService()
        )
    }
    
    
    @Test func schoolListViewModelTest() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        
        #expect(sut.schools.isEmpty)
        
        sut.fetchData()
        
        #expect(sut.schools.count == 100)
    }
    
    @Test func schoolDetailsViewModelTest() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        
        #expect(sutSchoolDetails.schoolDetails == nil)
        
        sutSchoolDetails.fetchDetails()
        
        #expect(sutSchoolDetails.schoolDetails != nil)
    }

}


