import SwiftUI

struct FindJobDetailView: View {
    @Binding var findJob: Datum
    
    var body: some View {
        
        Text(findJob.title ?? "")
    }
}

//struct FindJobDetailView_Previews: PreviewProvider {
//    static var findJob = FindJob.sampleHeadData[0]
//    static var previews: some View {
//        FindJobDetailView(findJob: findJob)
//    }
//}
