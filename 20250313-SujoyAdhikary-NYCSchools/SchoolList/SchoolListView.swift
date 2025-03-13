//
//  SchoolListView.swift
//  20250313-SujoyAdhikary-NYCSchools
//
//  Created by Sujoy Adhikary on 13/03/25.
//

import SwiftUI




struct SchoolListView: View {
    @StateObject var viewModel = SchoolListViewModel()
    
    var body: some View {
        NavigationStack{
            CustomLoadingView(loadingState: viewModel.loadingState){
                ZStack{
                    List {
                        ForEach(viewModel.schools){ school in
                            NavigationLink(value: school) {
                                Text(school.school_name ?? "-")
                                    .font(.headline)
                            }
                        }
                    }
                }
                .navigationDestination(for: SchoolListModel.self) { school in
                    SchoolDetailsView(viewModel: .init(school: school))
                }
            }

        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}

#Preview {
    SchoolListView()
}
