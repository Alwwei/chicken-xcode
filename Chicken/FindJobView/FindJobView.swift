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
                    ForEach($findHeadJobs.filter({ text in
                            if searchText.isEmpty {
                                return true
                            } else {
                                return text.title.wrappedValue?.contains(searchText) ?? false
                            }
                        })) { job in
                            NavigationLink(destination: FindJobDetailView(findJob: job)) {
                                FindJobCellView(findJob: job)
                            }
                            Divider()
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
                }
            }
            .background(Color.gray.opacity(0.1))
        }
    }
}

struct FindJobView_Previews: PreviewProvider {
//    static var findHeadJobs = .constant([Datum(id: 1, createdAt: "", updatedAt: "", tags: [["tag":"tag"]], wages: "160", area: "city")])
//    static var findBodyJobs = FindJob.sampleBodyData
    static var previews: some View {
        FindJobView(findHeadJobs: .constant([Datum(id: 1, title: "job1", detail: "content1", createdAt: "", updatedAt: "", tags: [["tag":"tag"]], wages: "160", area: "city")]), findBodyJobs: .constant([Datum(id: 2, createdAt: "", updatedAt: "", tags: [["tag":"tag"]], wages: "160", area: "city")]), barContent: "o")
    }
}
