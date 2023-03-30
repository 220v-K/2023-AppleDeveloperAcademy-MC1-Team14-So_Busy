import SwiftUI

@main
struct MyApp: App {
    private let sceneManager = SceneManager()
    @State var sceneNum: Int = 1
    
    var body: some Scene {
        WindowGroup {
            TotalSceneView().environmentObject(sceneManager)
        }
    }
}
