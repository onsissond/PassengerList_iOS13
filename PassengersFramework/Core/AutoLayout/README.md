# AutoLayout DSL

Микро хелпер для более удобной ручной верстки.

Верстая в коде нам приходится постоянно делать одни и те же действия:

1. добавить **child view** в иерархию **parent view**
2. отключить **translatesAutoresizingMaskIntoConstraints** (иначе ололо)
3. набросить констрейнты (который часто связывают лишь **child** и **parent**)

Вдохновившись статьей [Chris Eidhof](http://chris.eidhof.nl/post/micro-autolayout-dsl/), было решено восползоваться предложенным подходом немного расширив функциональность.

## Как было раньше
Допустим нам нужно сверстать  **parent view**, вложить туда **child view** и поместить все это на **viewController.view**. Выглядит это примерно так:

```swift
let parent = UIView(frame: .zero)
let child = UIView(frame: .zero)

parent.addSubview(child)
child.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    child.topAnchor.constraint(equalTo: parent.topAnchor, constant: 16)
    child.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 16)
    child.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -16)
    child.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -16)
])

viewController.view.addSubview(parent)
parent.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    parent.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor)
    parent.centerYAnchor.constraint(equalTo: viewController.view.centerYAnchor)
])
```

## Как стало

```swift
let parent = UIView(frame: .zero)
let child = UIView(frame: .zero)

parent.addSubview(child, constraints: [
    equal(\.topAnchor, constant: 16),
    equal(\.leadingAnchor, constant: 16),
    equal(\.trailingAnchor, constant: -16),
    equal(\.bottomAnchor, constant: -16)
])

viewController.view.addSubview(parent, constraints: [
    equal(\.centerXAnchor),
    equal(\.centerYAnchor)
])
```
Кажется, такой код гораздо нагляднее и легче читается.

DSL содержит функции **equal**, **lessThanOrEqual**, **greaterThanOrEqual** для всех **axis** и **dimensions** констрейнтов.
