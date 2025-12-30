// swift-format-ignore
/* 😭😭 adding @preconcurrency on import Glibc fixes stdin strict concurrency issue.
 And this needs to be the very first import of our code.

 What the hell? 😭😭
 */
// @preconcurrency import Glibc
import Foundation

@main
struct pwd_wsl {
    static func main() throws {

        /* Check if program is running inside terminal shell */
        // guard isatty(fileno(stdin)) == 0 else {
        //     exit(1)
        // }

        let processInfo: ProcessInfo = ProcessInfo.processInfo

        // This works for me in Ubuntu-24.04 WSL.
        let distroName: String? = processInfo.environment["WSL_DISTRO_NAME"]

        var output: String = FileManager.default.currentDirectoryPath

        output = output.replacingOccurrences(of: "/", with: "\\")
        output =
            if let distroName {
                "\\\\wsl.localhost\\" + distroName.appending(output)
            } else { output }

        print("\(output)")

    }
}
