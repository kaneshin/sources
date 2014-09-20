// animal.go
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

package main

import (
	"fmt"
)

type Behavior interface {
	Speak() string
}

type Animal struct {
	Name string
	Legs int
}

// === Dog

type Dog struct {
	*Animal
}

func NewDog(name string) *Dog {
	dog := &Dog{&Animal{name, 4}}
	return dog
}

func (self *Dog) Speak() string {
	return "Bowwow"
}

// === Cat

type Cat struct {
	*Animal
}

func NewCat(name string) *Cat {
	cat := &Cat{&Animal{name, 4}}
	return cat
}

func (self *Cat) Speak() string {
	return "Meow"
}

// === Main

func main() {
	mike := NewCat("Mike")
	fmt.Println(mike.Speak())

	pochi := NewDog("Pochi")
	fmt.Println(pochi.Speak())

	fmt.Println(Sing(mike, pochi))
}

func Sing(a1 Behavior, a2 Behavior) string {
	return a1.Speak() + "!! " + a2.Speak() + "!!"
}
