import XCTest
@testable import IonicCapacitorTenjinPlugin

class TenjinTests: XCTestCase {
    func testPluginRegistration() {
        let plugin = TenjinPlugin()
        XCTAssertEqual(plugin.identifier, "TenjinPlugin")
        XCTAssertEqual(plugin.jsName, "Tenjin")
        XCTAssertFalse(plugin.pluginMethods.isEmpty)
    }
}
