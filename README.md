# browserify-smith

[![Dependency status](https://david-dm.org/alexgorbatchev/browserify-smith.svg)](https://david-dm.org/alexgorbatchev/browserify-smith)
[![devDependency Status](https://david-dm.org/alexgorbatchev/browserify-smith/dev-status.svg)](https://david-dm.org/alexgorbatchev/browserify-smith#info=devDependencies)
[![Build Status](https://secure.travis-ci.org/alexgorbatchev/browserify-smith.svg?branch=master)](https://travis-ci.org/alexgorbatchev/browserify-smith)

[![NPM](https://nodei.co/npm/browserify-smith.svg?downloads=true)](https://npmjs.org/package/browserify-smith)

Agent Smith for [Browserify] includes transforms for [LESS] [Jade] and [CoffeeScript] transforms.

## Installation

    npm install browserify-smith

## Usage Example

In you `package.json` add the following:

```
{
  "browserify": {
    "transform": ["browserify-smith"]
  }
}
```

And now in that module you can `require()` the following files:

* `.coffee`
* `.js`
* `.jade` (exports HTML string)
* `.less` (exports CSS string)

In order for `browserify-smith` not to bloat your `node_modules` it doesn't bundle any dependencies. You have to install them yourself.

* `coffee-compiler` for CoffeScript
* `less-compiler` for LESS
* `jade-compiler` for Jade

## Testing

    npm test

## License

The MIT License (MIT)

Copyright 2014 Alex Gorbatchev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


[Browserify]: http://browserify.org/
[LESS]: http://lesscss.org/
[Jade]: http://jade-lang.com/
[CoffeeScript]: http://coffeescript.org/
