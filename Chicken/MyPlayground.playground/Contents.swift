import UIKit

let url = URL(string: "http://127.0.0.1:3000/jobs")!
var request = URLRequest(url: url)
request.httpMethod = "get"
request.setValue("application/json", forHTTPHeaderField: "Content-Type")

Task{
    do {
        let (data, _) = try await URLSession.shared.data(for: request)
        if let jobs = try? JSONDecoder().decode(FindJobData.self, from: data) {
            print(jobs)
        } else {
            print("invalid response")
        }
    } catch {
        print("failed to send GET request")
    }
}

