/// Copyright (c) 2021 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct Row: View {
  let todo: Todo
  let onToggleCompleted: (Todo) -> Void

  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      HStack(spacing: 10) {
        Button(action: toggleCompleted) {
          Image(systemName: todo.completed ? "checkmark.square" : "square")
            .imageScale(.large)
            .foregroundColor(todo.completed ? .pink : .primary)
        }

        Text(todo.name)
          .font(.system(size: 18, weight: .semibold))
      }

      if let description = todo.description {
        Text(description)
          .font(.system(size: 14, weight: .medium))
          .padding(.leading, 32)
          .padding(.trailing, 10)
          .foregroundColor(.gray)
      }
    }
  }
}

private extension Row {
  func toggleCompleted() {
    withAnimation {
      onToggleCompleted(todo)
    }
  }
}

struct Row_Previews: PreviewProvider {
  static var previews: some View {
    Row(
      todo: .init(
        id: UUID().uuidString,
        name: "Build this cool app",
        description: "I need to finish building this awesome todo list app!",
        completed: false
      )
    ) { _ in }
  }
}
