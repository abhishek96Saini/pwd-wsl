## Status: Almost done 🤓👷🏼👷🏼‍♂️👷🏼‍♀️
- [x] ~~Draft ready: Currently works via pipe `|`. e.g.: `$> pwd | ~/Downloads/pwd-wsl`~~
- [x] Need to build as static binary for interoperatability: Built using [Swift static linking SDK](https://www.swift.org/documentation/articles/static-linux-getting-started.html).
- [x] Allow ability to use the binary via `$PATH` to invoke command on current directory (just like `pwd`): e.g. `~/.local/bin`
- [ ] Update readme for installation, usage instructions. Also add `strip .build/release/pwd-wsl` as release binary size is close to 150MB 😭.
- [ ] Publish binary to Git hosting for direct download.


`NOTE:` There is another POC implementation in `Python3` in git branch `python-release`

## Reference
https://www.swifttoolkit.dev/posts/pipe

#### For `@preconcurrency import Glibc` workaround for `isatty()`
https://github.com/swiftlang/swift/issues/77866

https://www.hackingwithswift.com/example-code/strings/replacing-text-in-a-string-using-replacingoccurrencesof


#### Get current directory path in CLI
https://stackoverflow.com/questions/44193114/swift-3-read-terminal-current-working-directory

https://developer.apple.com/documentation/foundation/filemanager/currentdirectorypath