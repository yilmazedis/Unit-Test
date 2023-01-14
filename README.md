# Unit-Test

## Stub vs Mock
- Stubs don't fail your tests, mock can.
- Unlike mocks, stubs do not have pre-programmed expectations that could fail your test.
- A stub is a simple fake object. It just makes sure test runs smoothly.
- A mock is a smarter stub. You verify your test passes through it.

## General
- Dummy objects are passed around but never actually used. Usually they are just used to fill parameter lists.
- Fake objects actually have working implementations, but usually take some shortcut which makes them not suitable for production (an InMemoryTestDatabase is a good example).
- Stubs provide canned answers to calls made during the test, usually not responding at all to anything outside what's programmed in for the test.
- Spies are stubs that also record some information based on how they were called. One form of this might be an email service that records how many messages it was sent(also called Partial Mock).
- Mocks are pre-programmed with expectations which form a specification of the calls they are expected to receive. They can throw an exception if they receive a call they don't expect and are checked during verification to ensure they got all the calls they were expecting.
