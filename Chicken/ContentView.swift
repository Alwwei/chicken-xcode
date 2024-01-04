import SwiftUI

struct ContentView: View {
    @State var findHeadJobs: [Datum] = []
    @State var findBodyJobs: [Datum] = []
    @State var findMissions: [FindMission] = FindMission.sampleData
    @State var news: [News] = News.sampledata
    @State var messages: [Message] = Message.sampleData
    
    var body: some View {
        VStack {
            TabView {
                FindJobView(findHeadJobs: $findHeadJobs, findBodyJobs: $findBodyJobs, barContent: "")
                    .tabItem {
                    NavigationLink(destination: FindJobView(findHeadJobs: $findHeadJobs, findBodyJobs: $findBodyJobs, barContent: "")) {
                        Label("找打工", systemImage: "briefcase")
                    }
                    .tag(1)
                }
                FindMissionView(findMissions: findMissions)
                    .tabItem {
                    NavigationLink(destination: FindMissionView(findMissions: findMissions)) {
                        Label("找任務",systemImage: "bolt")
                    }
                    .tag(2)
                }
                NewsView(news: news)
                    .tabItem {
                        NavigationLink(destination: NewsView(news: news)) {
                            Label("基地台", systemImage: "antenna.radiowaves.left.and.right")
                        }
                        .tag(3)
                    }
                MessageView(messages: messages)
                    .tabItem {
                        NavigationLink(destination: MessageView(messages: messages)) {
                            Label("訊息", systemImage: "ellipsis.bubble")
                        }
                        .tag(4)
                    }
                AccountView()
                    .tabItem {
                        NavigationLink(destination: AccountView()) {
                            Label("我的", systemImage: "person")
                        }
                        .tag(5)
                    }
            }
            
        }
        .task {
            let url = URL(string: "http://127.0.0.1:3000/jobs")!
            var request = URLRequest(url: url)
            request.httpMethod = "get"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                if let jobs = try? JSONDecoder().decode(FindJobData.self, from: data) {
                    print(jobs)
                    findHeadJobs = jobs.data
                    print(findHeadJobs)
                } else {
                    print("invalid response")
                }
            } catch {
                print("failed to send get request")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
