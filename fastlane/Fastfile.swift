// Customize this file, documentation can be found here:
// https://docs.fastlane.tools/
// All available actions: https://docs.fastlane.tools/actions
// can also be listed using the `fastlane actions` command

// Change the syntax highlighting to Swift
// All lines starting with // are ignored when running `fastlane`

// If you want to automatically update fastlane if a new version is available:
// updateFastlane()

import Foundation

class Fastfile: LaneFile {
    // This is the minimum version number required.
    // Update this, if you use features of a newer version
    var fastlaneVersion: String { return "2.70.2" }

    func beforeAll() {
        // environmentVariables["SLACK_URL"] = "https://hooks.slack.com/services/..."
        cocoapods()
        // carthage()
        
    }

    func testLane() {
        desc("Runs all the tests")
        runTests()
    }

    func betaLane() {
        desc("Submit a new Beta Build to Apple TestFlight. This will also make sure the profile is up to date")

        // syncCodeSigning(gitUrl: "gitUrl", appIdentifier: [appIdentifier], username: appleID)
        buildApp() // more options available
        uploadToTestflight(username: appleID)
        // You can also use other beta testing services here (run `fastlane actions`)
    }

    func releaseLane() {
        desc("Deploy a new version to the App Store")

        // syncCodeSigning(gitUrl: "gitUrl", type: "appstore", appIdentifier: [appIdentifier], username: appleID)
        captureScreenshots()
        buildApp() // more options available
        uploadToAppStore(username: appleID, app: appIdentifier, force: true)
        // frameScreenshots()
    }

    // You can define as many lanes as you want

    func afterAll(currentLane: String) {
        // This block is called, only if the executed lane was successful
        // slack(
        //     message: "Successfully deployed new App Update.",
        //     slackUrl: "slackURL"
        // )
    }

    func onError(currentLane: String, errorInfo: String) {
        // slack(
        //     message: errorInfo,
        //     slackUrl: "slackUrl",
        //     success: false
        // )
    }

    // All available actions: https://docs.fastlane.tools/actions

    // fastlane reports which actions are used. No personal data is recorded.
    // Learn more at https://github.com/fastlane/fastlane/#metrics
}
