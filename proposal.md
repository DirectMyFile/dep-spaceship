# Spaceship Operator

## Contact information

**Name**: Kenneth A. Endfinger

**Email**: kaendfinger@gmail.com

**GitHub Username**: kaendfinger

[Proposal Location](https://github.com/DirectMyFile/dep-spaceship)

## Summary

Add Spaceship Operator for Comparing Values

## Motivation

Problems to solve:

- Calling compareTo() on objects is often annoying. It looks ugly often. What if we had an operator that was for comparison like this, but was syntatic sugar for compareTo() and has a clearly defined intention.

## Examples

```dart
assert((1 <=> 1) == 0);
assert((1 <=> 2) == -1);
assert((2 <=> 1) == 1);
assert(("a" <=> "z") == -1);
```

## Proposal

The spaceship operator is a binary operator. It is not allowed to be used in assignment.

### Semantics

The left side should have it's `compareTo` method called with the right side as the single argument.
The left side's type should be an instance of `Comparable`.
It is a runtime error if the `compareTo` method does not exist.
It should always return the result of the compareTo method.
It is a static warning if the left hand side's type is known, and it does not implement `Comparable`.

## Alternatives

No alternatives have been proposed yet.

## Implications and limitations

None

## Deliverables

### Language specification changes

#### 16.xx Spaceship Expression

```
spaceshipExpression:
  logicalOrExpression ‘<=>’ logicalOrExpression
```

### A working implementation

No working implementation is available, although one can experience this syntax in practice by using languages that have this feature already, such as [Groovy](http://docs.groovy-lang.org/latest/html/documentation/index.html#_spaceship_operator).

### Tests

**TODO**

## Patents rights

TC52, the Ecma technical committee working on evolving the open [Dart standard][], operates under a royalty-free patent policy, [RFPP][] (PDF). This means if the proposal graduates to being sent to TC52, you will have to sign the Ecma TC52 [external contributor form][] and submit it to Ecma.

[tex]: http://www.latex-project.org/
[language spec]: https://www.dartlang.org/docs/spec/
[dart standard]: http://www.ecma-international.org/publications/standards/Ecma-408.htm
[rfpp]: http://www.ecma-international.org/memento/TC52%20policy/Ecma%20Experimental%20TC52%20Royalty-Free%20Patent%20Policy.pdf
[external contributor form]: http://www.ecma-international.org/memento/TC52%20policy/Contribution%20form%20to%20TC52%20Royalty%20Free%20Task%20Group%20as%20a%20non-member.pdf
