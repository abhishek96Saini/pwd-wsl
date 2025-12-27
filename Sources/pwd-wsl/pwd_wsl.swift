// swift-format-ignore
/* 😭😭 adding @preconcurrency on import Glibc fixes stdin strict concurrency issue.
 And this needs to be the very first import of our code.

 What the hell? 😭😭
 */
@preconcurrency import Glibc
import Foundation

@main
struct pwd_wsl {
    static func main() throws {

        /* Check if program is running inside terminal shell */
        guard isatty(fileno(stdin)) == 0 else {
            exit(1)
        }

        let processInfo: ProcessInfo = ProcessInfo.processInfo

        // This works for me in Ubuntu-24.04 WSL.
        let distroName: String? = processInfo.environment["WSL_DISTRO_NAME"]

        /*
        Use '|' (pipe operator) input to parse and return WSL style path.
        The intent is to allow POSIX user to pipe `pwd` output and format via
        this utility in Windows UNC style.
        */
        let standardInput: FileHandle = FileHandle.standardInput

        let inputData: Data?
        do { inputData = try standardInput.readToEnd() } catch {
            print("ERROR! Cannot read standard input.")
            exit(1)
        }

        // output: home/abhi/Developer/my-app
        var output: String = String(data: inputData ?? Data(), encoding: .utf8) ?? "nil"

        output = output.replacingOccurrences(of: "/", with: "\\")
        output =
            if let distroName {
                "\\\\wsl.localhost\\" + distroName.appending(output)
            } else { output }

        /* output: home/abhi/Developer/my-app
         What we want: \\\\wsl.localhost\\\(distroName)\\home\\abhi\\Developer\\my-app
         */

        print("\(output)")

    }
}
