// hello.swift
//
// Copyright (c) 2014 Shintaro Kaneko (http://kaneshinth.com/)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

enum Lang: String {
    case en = "English"
    case ja = "Japanese"
    case es = "Spanish"
    case ca = "Catalan"
    case br = "Brazilian Portuguese"
    case fr = "French"
    case ro = "Romanian"
    case tur = "Turkish"
    var world: String {
        switch self {
        case en:
            return "Hello"
        case ja:
            return "こんにちは"
        case ca,es:
            return "Hola"
        case br:
            return "Olá"
        case fr:
            return "Bonjour"
        case ro:
            return "Salutare"
        case tur:
            return "Merhaba"
        }
    }
    static let allValues = [en, ja, es, ca, br, fr, ro, tur]
}


class Hello {

    var message: String!
    var lang: Lang = Lang.en {
        didSet {
            message = lang.world + ", 世界"
        }
    }

}

extension Hello: Printable {
    var description: String {
        return "\(self.lang.rawValue): \(self.message)"
    }
}

var hello = Hello()

for lang in Lang.allValues {
    hello.lang = lang
    println(hello.description)
}
