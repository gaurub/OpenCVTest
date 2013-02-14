OpenCVTest
==========

Simple Face detection using OpenCV for iOS. Couldn't quite find the exact tutorial, using this version of OpenCV, done in this way, so I thought I'd put it out there. I could have messed up googling, but either way, it can't hurt to have more options.

This has ONLY been tested with Xcode 4.6.

I had tried building with Xcode 4.4 and was forced to update so if you get weird objc linking errors, try upgrading.

If you get errors that point to the C++ standard library, then you probably need to tweak your build settings to the following:

Under Apple LLVM compiler 4.2- Language

1) C++ Language Dialect: Compiler Default
2) C++ Standard Library: libc++ 
