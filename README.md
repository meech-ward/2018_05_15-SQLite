# SQLite in Swift

## SQLite

* The database is on a file within your application.
* The SQLite code runs within your application. 
* Created in 2000, it's newish but also well established. 
* Really well tested / reliable
* To use an SQL database on embedded devices.

## The C Programming Language

* it has primitive data types.
* it was created to replace assembly when writing Operating systems and kernels. 
* It's the last layer of code before you hit hardware. 
* It's initial release was in 1972
* Unix was released in 1969, written in assembly. re written in C and released in 1973
* It had to be fast.
* It's a high level language to build an OS in.
* It's a low level language to build applications in.
* It's very compatible.
* You as the developer have a lot of control.
* It's a very simple minimal language.

## C Libraries APIs

* SQLite's C library is what we use to communicate with an SQLite database.

```objc
NSError *error;
[NSFile openFileWithName:@"fileName" error:&error];

if (error) {

}
```


* In a c API, there will be structs, and pointers to the structs.
* C structs, not swift structs.

## C APIs in Swift

[Pointers](https://developer.apple.com/library/content/documentation/Swift/Conceptual/BuildingCocoaApps/InteractingWithCAPIs.html#//apple_ref/doc/uid/TP40014216-CH8-ID17)

## SQLite in Swift

* Opening a database connection with a database file
* Closing a connection
* executing a create table query using sqlite3_exec()
* executing an insert query sqlite3_exec()
* Monetery values
* Dates
* executing SELECT commands using Prepared Queries.

## Links

* [SQLite3 C API](https://www.sqlite.org/capi3ref.html)
* [NSUserDefaults](https://developer.apple.com/documentation/foundation/userdefaults)
* [Swift: Interacting with C APIs](https://developer.apple.com/library/content/documentation/Swift/Conceptual/BuildingCocoaApps/InteractingWithCAPIs.html#//apple_ref/doc/uid/TP40014216-CH8-ID17)
* [SQLite.swift](https://github.com/stephencelis/SQLite.swift)

## Snippets

```swift
let fileURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(name)
```

```sqlite
.mode column
.headers on
```