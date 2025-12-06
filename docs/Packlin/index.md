# MochiMemo User Guide

A packing checklist that helps for trips and events. You can edit everything freely.

Use it for travel or business trips. By totaling the weight, you can pack according to your strength. It is also useful for managing hobby gear.

We aimed to minimize operation steps. There is no common "Confirm" button, and there is no "Save" button after editing. The "Delete" button removes items immediately without confirmation. If you make a mistake, press the "↩︎ Undo" button to return to the previous state, up to 10 steps back.

You can now ask Chappy (AI) to create or modify packs (in-app purchase). It quickly builds a rough draft that follows your request, so enjoy adjusting it while using it as a reference.

Records are kept in the following three layers. Item is the smallest unit of belongings.
```
App
 ├─ Pack (storage pack)
 │   ├─ Group (category group)
 │   │   ├─ Item (belongings)
 │   │   └─ Item
 │   └─ Group
 │       ├─ Item
 │       └─ Item
 └─ Pack
     ├─ Group
     │   ├─ Item
     │   └─ Item
     └─ Group
         ├─ Item
         └─ Item
```
<br>

Please try the following features.

## Features

- Check each item and see the overall progress.
- Record the required quantity and the stock on hand.
- Register item weights (g) and check the total weight.
- Rearrange items with drag-and-drop operations.
- Move or duplicate items into other groups or packs.
- Move or duplicate groups into other packs.
- Undo: revert up to 10 steps back.
- Redo: return up to 10 Undo steps forward.
- Ask Chappy (AI) to create or modify packs (in-app purchase).

<br>

### [End User License Agreement](https://info.engineer.co.jp/EULA.html)

### [Privacy Policy](https://info.engineer.co.jp/PrivacyPolicy.html)

### [Source Code: GitHub](https://github.com/SumPositive/RackList/)

<br>

## About the Author: sumpo
It began when I bought a used Mac mini in 2009, right as the iPhone 3 arrived in Japan, thinking I'd like to try app development.

To get used to Xcode 3 / Objective-C / Cocoa, I enthusiastically built apps I personally wanted.

To become familiar with Core Data as well, I planned another app. I figured even a self-indulgent app might hook about one hundred people worldwide, so I started publishing on the App Store.

- February 16, 2010 2:23 — MochiMemo 0.2 released: manage belongings for work, travel, and camping (Total: 109,000 DL)
- April 2, 2010 4:19 — KureMemo 0.1 released: record credit card use and compile totals (Total: 81,000 DL)

During development, I realized that while a picker is meant for input (selection), it might also work for output. Imagining a calculator that prints roll-paper receipts like a store register, I created a drum-style calculator.

- August 7, 2010 9:19 — DoraTaku 0.1 released; later renamed CalcRoll after becoming popular overseas (Total: 55,000 DL)

As realistic 3D designs began appearing, I faithfully recreated classic dial controls and built an app to use them.

- October 4, 2011 8:29 — Warikan 1.0 released: split bills with dial input for people and amounts (Total: 4,000 DL)
- January 14, 2012 5:45 — BodyMemo 0.8 released: dial input for weight, blood pressure, etc., with compiled tracking (Total: 29,000 DL)

In 2025, prompted by the World Expo, I began porting CalcRoll to Swift 6 / SwiftUI to get familiar with them. When I submitted it as a new app on August 24, 2025, Apple rejected it, saying, "A similar app exists; no novelty." Fair enough! I resubmitted it as an update to the old app, it passed review, and was released.

- September 4, 2025 8:58 — KaruMemo / CalcRoll 2.0 released

After releasing KaruMemo in September 2025, I started migrating MochiMemo to SwiftUI. In about a month, an alpha version that solved long-standing issues was ready. The sample data shown on the initial screen was surprisingly good thanks to AI! That inspired the new "Ask Chappy (AI)" feature, which in turn required developing a globally scalable API server and operating it securely.

- November xx, 2025 xx:xx — MochiMemo / Packlin 3.0 released

<br><br>

## Version History

| Version  | Release Date | Development Environment |
|----------|--------------|-------------------------|
| 0.2      | 2010/2/16    | MochiMemo / PackList, Xcode 3, Objective-C, Core Data |
| 0.5.5    | 2010/6/27    |                         |
| 1.0      | 2011/4/23    | Xcode 4, Objective-C, Core Data |
| 1.1      | 2011/9/22    |                         |
| 1.2      | 2012/3/31    |                         |
| 2.0      | 2012/3/28    |                         |
| 2.1.3    | 2017/9/28    |                         |
|----------|--------------|-------------------------|
| 3.0      | 2025/11/xx   | MochiMemo / Packlin, Xcode 26, SwiftUI, SwiftData |
