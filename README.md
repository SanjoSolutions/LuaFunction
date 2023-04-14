# Lua Function

This work is devoted to God.

A library for functional programming. This can help other add-on creators to save some work.

**Functions included:**

* **Function.partial**: a function for partial application.
* **Function.curry**: a function for currying a function.
* **Function.noOperation**: a function that "does nothing".
* **Function.identity**: a function which returns the value passed to it.
* **Function.alwaysTrue**: a function which returns true.
* **Function.isTrue**: a function that checks if a value is "truthy".
* **Function.returnValue**: a function that returns a function which returns the given value.
* **Function.once**: a function which creates a new function which runs the given function only on the first call (once).
* **Function.alwaysFalse**: a function which returns false.

## Usage

### Embedding

#### Introduction

With this approach, the library is included as part of the add-on. A benefit to the add-on user is, that only
the add-on appears in the add-on list. So it can be easier to enable or disable an add-on and its library dependencies
compared to an approach where the libraries are included as add-ons (in this case each library shows as an add-on in the add-ons list and the user potentially is required to tick multiple checkboxes to enable or disable an add-on and its library dependencies).

#### How to do it

This library registers itself via the library "[Library](https://github.com/SanjoSolutions/LuaLibrary)". With this approach it is avoided to create another global (with its theoretical potential that other add-ons already use the same global). And "Library" also handles when multiple add-ons load the same library, potentially different versions of it.
To embed it, also include "[Library](https://github.com/SanjoSolutions/LuaLibrary)" as a dependency to your add-on.

In our example, we have installed both "Library", "Function" and the dependencies of "Function" ("Boolean", "Set", "Object", "Float" and "Array") inside the "libs" folder inside the add-on folder.

In your add-ons TOC file add (to load "Library" and "Function" and its dependencies):

```
libs/Library/Library.xml
libs/Boolean/Boolean.xml
libs/Set/Set.xml
libs/Object/Object.xml
libs/Float/Float.xml
libs/Array/Array.xml
libs/Function/Function.xml
```

It's recommended to load the library files first, so that the libraries are available in the other Lua files.

In your Lua file(s), you can access the library via:

```lua
local Function = Library.retrieve('Function', '^1.0.0')
```

### As add-on

This library can also just be put directly in the AddOns folder. In this case the library is available via the global `Function`.

If you develop an add-on and do this approach, you can just include this library in your release as a folder next to your add-ons folder.

## Support

You can support me on [Patreon](https://www.patreon.com/addons_by_sanjo).
