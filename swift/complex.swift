// complex.swift
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

struct Complex {
    var real: Double = 0
    var imag: Double = 0
}

extension Complex: Printable {
    var description: String {
        let opr = self.imag >= 0 ? "+" : "-"
        let imag = abs(self.imag)
        return "\(self.real) \(opr) i * \(imag)"
    }
}

func + (left: Complex, right: Complex) -> Complex {
    return Complex(real: left.real + right.real, imag: left.imag + right.imag)
}

func - (left: Complex, right: Complex) -> Complex {
    return Complex(real: left.real - right.real, imag: left.imag - right.imag)
}

func * (left: Complex, right: Complex) -> Complex {
    return Complex(real: left.real * right.real - left.imag * right.imag,
                   imag: left.real * right.imag + left.imag * right.real)
}

func * (factor: Double, complex: Complex) -> Complex {
    return Complex(real: factor * complex.real, imag: factor * complex.imag)
}

func / (complex: Complex, divisor: Double) -> Complex {
    return Complex(real: complex.real / divisor, imag: complex.imag / divisor)
}

prefix operator * {}
prefix func * (complex: Complex) -> Complex {
    return Complex(real: -complex.imag, imag: complex.real)
}

func == (left: Complex, right: Complex) -> Bool {
    return left.real == right.real && left.imag == right.imag
}

var complex1 = Complex(real: 2, imag: -3)
var complex2 = Complex(real: -1, imag: 8)

println(complex1.description)
println(complex2.description)
println((complex1 + complex2).description)
println((complex1 - complex2).description)
println((complex1 * complex2).description)
println((3 * complex1).description)
println((*complex1 ).description)

