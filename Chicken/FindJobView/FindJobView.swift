import SwiftUI

struct FindJobView: View {
    @Binding var findHeadJobs: [Datum]
    @Binding var findBodyJobs: [Datum]
    let barContent: String
    @State private var searchText: String = ""
    @State private var searchTags: [String] = [""]
    
    
    
    var body: some View {
        let columns = [GridItem(.flexible(), alignment: .leading)]
        
        NavigationStack {
            VStack {
                SearchBarView(text: $searchText, barContent: "輸入關鍵字 ex.咖啡廳")
                    .padding(.top, 0)
                
            }
            ScrollView {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(minHeight: 100, maxHeight: 100)
                    .overlay {
                        Text("Image")
                            .bold()
                    }
                FindJobHorizontalScrollerView(searchTags: $searchTags)
                    .padding()
                    .background(Color.white)
                LazyVGrid(columns: columns) {
                    VStack {
                        Label("精選急徵", systemImage: "circle")
                            .font(.title3)
                            .bold()
                            .padding(10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.white)
                    }
//                    ForEach($findHeadJobs) { $job in
//                            NavigationLink(destination: FindJobDetailView(findJob: job)) {
//                                FindJobCellView(findJob: $job)
//                            }
//                            Divider()
//                    }
                    ForEach($findHeadJobs.filter({ text in
                            if searchText.isEmpty {
                                return true
                            } else {
                                if let t = text.title {
                                    if t.contains(searchText) == true {
                                        return true
                                    } else {
                                        return false
                                    }
                                }
                                return false
                            }
                        })) { $job in
                            NavigationLink(destination: FindJobDetailView(findJob: job)) {
                                FindJobCellView(findJob: $job)
                            }
                            Divider()
//                            searchText.isEmpty ? true : $0.title?.contains(searchText) ?? false
                    }
                }
                Spacer()
                    .frame(height: 20)
                LazyVGrid(columns: columns, alignment: .listRowSeparatorLeading) {
                    Label("全部打工", systemImage: "circle")
                        .font(.title3)
                        .bold()
                        .padding(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white)
//                    ForEach(findBodyJobs.filter({ searchText.isEmpty ? true : $0.title?.contains(searchText) ?? false })) { job in
//                        NavigationLink(destination: FindJobDetailView(findJob: job)) {
//                            FindJobCellView(findJob: job)
//                        }
//                    }
                }
            }
            .background(Color.gray.opacity(0.1))
        }
    }
}

//struct FindJobView_Previews: PreviewProvider {
//    static var findHeadJobs = FindJob.sampleHeadData
//    static var findBodyJobs = FindJob.sampleBodyData
//    static var previews: some View {
//        FindJobView(findHeadJobs: findHeadJobs, findBodyJobs: findBodyJobs)
//    }
//}
