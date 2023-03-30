import SwiftUI

@main
struct MyApp: App {
    @State var sceneNum: Int = 5
    
    var body: some Scene {
        WindowGroup {
            
            switch(sceneNum){
//            case 0:
//
//            case 1:
                
            case 2:
                Scene2View(sceneNum: $sceneNum)
            case 3:
                SceneThreeView(sceneNum: $sceneNum)
            case 4:
                Scene4View(sceneNum: $sceneNum)
            case 5:
                Scene5View(sceneNum: $sceneNum)
//            case 6:
                
            default:
                SceneSixView()
            }
        }
    }
}

