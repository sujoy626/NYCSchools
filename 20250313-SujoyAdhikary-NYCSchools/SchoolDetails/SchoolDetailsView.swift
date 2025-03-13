//
//  SchoolDetailsView.swift
//  20250313-SujoyAdhikary-NYCSchools
//
//  Created by Sujoy Adhikary on 13/03/25.
//

import SwiftUI

struct SchoolDetailsView: View {
    
    @ObservedObject var viewModel : SchoolDetailsViewModel
    init(viewModel: SchoolDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack{
            List{
                Section("Name") {
                    Text(viewModel.school.school_name ?? "-")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                
                CustomLoadingView(loadingState: viewModel.loadingState) {
                    if let details = viewModel.schoolDetails{
                        Group{
                            Section{
                                HStack{
                                    Text("Num of sat test takers :")
                                    Spacer()
                                    Text(details.numOfSatTestTakers ?? "-")
                                }
                            }
                            
                            
                            Section("Score") {
                                VStack(spacing: 16){
                                    HStack{
                                        Text("Sat critical reading avg score :")
                                        Spacer()
                                        Text(details.satCriticalReadingAvgScore ?? "-")
                                    }
                                    
                                    HStack{
                                        Text("Sat math avg score :")
                                        Spacer()
                                        Text(details.satMathAvgScore ?? "-")
                                    }
                                    
                                    HStack{
                                        Text("Sat writing avg score :")
                                        Spacer()
                                        Text(details.satWritingAvgScore ?? "-")
                                    }
                                }
                            }
                        }
                    }else{
                        Text("No data found")
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                    }
                }
            }
                
        }
        .onAppear{
            viewModel.fetchDetails()
        }
    }
}

#Preview {
    SchoolDetailsView(viewModel: .init(school: SchoolListModel.getDummySchool()))
}
