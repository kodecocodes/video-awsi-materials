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

struct AddTodoView {
  @State private var name: String = ""
  @State private var description: String = ""
  @State private var showNameRequiredWarning = false

  let todoSaved: (String, String?) -> Void
}

// MARK: - View
extension AddTodoView: View {
  var body: some View {
    VStack {
      dismissIndicator
      title
      inputFields
      Spacer()
      saveButton
    }
    .padding(.vertical, 30)
    .alert(isPresented: $showNameRequiredWarning) {
      .init(
        title: .init("Name Required"),
        message: .init("A Todo should have a name"),
        dismissButton: .destructive(.init("OK"))
      )
    }
    .background(Color(UIColor.systemGroupedBackground))
    .edgesIgnoringSafeArea(.all)
  }
}

private extension AddTodoView {
  var dismissIndicator: some View {
    RoundedRectangle(cornerRadius: 3)
      .frame(width: 90, height: 6)
      .foregroundColor(Color(UIColor.lightGray))
  }

  var title: some View {
    HStack {
      Text("Add New")
        .font(.largeTitle).fontWeight(.semibold)
      Spacer()
    }
    .padding(.horizontal)
  }

  var inputFields: some View {
    List {
      Section(header: Text("Name")) {
        TextField("", text: $name)
          .frame(height: 40)
      }
      Section(header: Text("Description")) {
        TextEditor(text: $description)
          .frame(height: 200)
      }
    }
    .listStyle(GroupedListStyle())
  }

  var saveButton: some View {
    Button  {
      guard !name.isEmpty else {
        showNameRequiredWarning.toggle()
        return
      }

      todoSaved(name, description)
    } label: {
      ZStack {
        RoundedRectangle(cornerRadius: 10)
          .foregroundColor(.blue)
        Text("Add Todo")
          .font(.system(size: 22, weight: .semibold))
          .foregroundColor(.white)
      }
      .frame(height: 44)
      .padding(.horizontal, 20)
    }
  }
}

struct AddTodoView_Previews: PreviewProvider {
  static var previews: some View {
    AddTodoView { _, _ in }
  }
}
