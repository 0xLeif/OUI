# OUI

Object UI

## Example Code

```swift
import SwiftUI
import OUI
import Combine
import Combino

struct ContentView : View {
    @State var text = """
<html>
<body>
<h1>Hello, world!</h1>
</body>
</html
"""
    @State var task: AnyCancellable?
    
    var body: some View {
        BindableUIView(value: $text,
                       initialView: UITextView(),
                       configure: { $0.text = "?" },
                       update: { $0.text = text })
            .onAppear {
                self.task = Combino.do(withDelay: 3, work: {
                    DispatchQueue.main.async {
                        self.text = "PRe"
                    }
                }).sink(.completion {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.text = "YO"
                    }
                })
            }
    }
}
```
