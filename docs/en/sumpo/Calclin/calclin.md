# Calclin User Guide

Tap the keys like a calculator to enter an expression. Tap [=] at the end to get the answer.

That's all for basic operation.

If you're curious, the features below are tucked away—try intuitive gestures to find and use them.

## Features

    - Choose the decimal point symbol (default: [.] period)

    - Change the number of displayed decimal digits (default: 3 digits, up to 10 digits)

    - Choose how to round when truncating to the displayed decimal digits (default: round half to even)
        - Internal 60-digit precision ensures accurate round half to even (banker's rounding)

    - Choose the digit grouping symbol (default: [,] comma)

    - Choose the digit grouping style (default: every 3 digits)
        - Includes the Indian numbering style

    - Add extra calculation fields and switch between them (maximum: 3 fields)

    - Copy from the history of expressions and answers

    - Enlarge or reduce the text size of expressions and answers

    - Use multiple calculators (up to triple deck)

    - Perform unit-aware calculations

    - Lay out the keyboard to your liking

    - Switch keyboards (5 layouts)

## Specifications

    - Calculation engine: C/C++ fixed-point decimal, using 60 of over 2G significant digits
    - Calculation fields: Reverse Polish style, up to 3 fields
    - History list: up to 100 entries, circular deletion from oldest
    - Calculation style: four arithmetic operations
    - Decimal digits: 0~10 (max 15)
    - Rounding modes: 7 types
        - Round up — always toward positive infinity
        - Round toward +∞ — always increases
        - Round half away from zero [JIS Z 8401 Rule B]
        * Round half to even [JIS Z 8401 Rule A] (even rounding, JIS/ISO/banker's rounding)
        - Round half toward +∞
        - Round toward −∞ — always decreases
        - Truncate — no rounding, always toward zero
    - Decimal point symbols: 3 types
        * [.] period
        - [·] middle dot
        - [,] comma
    - Grouping styles: 4 types
        - No grouping [123456789.0]
        * Group every 3 digits [123,456,789.0]
        - Indian style [12,34,56,789.0]
        - Group every 4 digits [1,2345,6789.0]
    - Grouping symbols: 4 types
        * [,] comma
        - ['] apostrophe
        - [ ] space
        - [.] period
    - Operators:
        - ＋ ー × ÷
        - ＝ ( )
        - √ 3√
    - Editing:
        - ClearAll  ClearSection  BackSpace  -/+
    - Constants:
        - π (pi), φ (golden ratio), e (Napier's constant)
    - Percentages:
        - % ‰ 割 分 厘
    - Units:
        - mm cm [m] km 寸 尺 里 in ft yd
        - m㎡ c㎡ [㎡] a ha k㎡ 坪 畝 反 ac
        - ml dl [L] ㎥ 合 升 gallon
        - mg g [kg] t kt 匁 貫 pound

    - Version x.y.z: build number; each value starts at 0 and increments as follows
        - x: major overhaul, full redesign
        - y: feature additions or changes
        - z: minor tweaks, bug fixes

    - SupportID: support identifier; an 8–12 character alphanumeric string
        - Cannot identify an individual
        - Used when server log investigation is required

<br>

### [End User License Agreement](https://info.engineer.co.jp/EULA.html)

### [Privacy Policy](https://info.engineer.co.jp/PrivacyPolicy.html)

### [Source Code: GitHub](https://github.com/SumPositive/CalcRoll/)

### [Author Bio: sumpo](https://docs.azukid.com/sumpo/jp/index)

<br>

## Release History

| Version  | Release Date | Development Environment |
|----------|--------------|-------------------------|
| 0.1      | 2010/8/7     | Drataku — Xcode 3, Objective-C, C/C++ |
| 0.3      | 2011/3/1     | |
| 0.4.2    | 2011/3/24    | |
| 1.0      | 2011/4/21    | CalcRoll — Xcode 4, Objective-C, C/C++ |
| 1.0.9    | 2011/10/21   | |
| 1.1      | 2011/11/20   | |
| 1.1.7    | 2012/10/10   | |
| 1.2      |              | 2020/7 considered Swift migration but paused |
|          |              | 2025/7 restarted to learn Swift 6 and SwiftUI |
| 2.0      | 2025/9/4     | Cal Memo / CalcRoll — Xcode 16, Swift 6, SwiftUI, C/C++ |
| 2.1      | 2025/ /      | Cal Memo / Calclin — Xcode 26, Swift 6, SwiftUI, C/C++ |
