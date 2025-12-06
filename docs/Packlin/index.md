# MochiMemo User Guide

This is a packing checklist that is handy for trips and events. You can edit it freely.

Please use it for travel or business trips. By totaling the weight, you can pack according to your physical strength. It is also useful for managing hobby gear.

We aimed to minimize the operating steps. There is no common "Confirm" button, and there is no "Save" button after editing. The "Delete" button removes an item immediately without confirmation. If you make a mistake, you can return to the previous state with the "↩︎ Undo" button, up to 10 steps back.

You can now ask Chappy (AI) to create or modify packs (in-app purchase). It quickly creates a draft that matches your requests, so enjoy refining it based on that.

Records are organized in the following three layers. The Item is the smallest unit of belongings.
```
App
 ├─ Pack (storage pack)
 │   ├─ Group (category group)
 │   │   ├─ Item (belonging)
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

- Check each item to see the overall progress of your checklist.
- Record the required quantity and the quantity on hand.
- Register item weights (g) and check the total weight.
- Rearrange items with drag-and-drop.
- Move or duplicate items into other groups or packs.
- Move or duplicate groups into other packs.
- Undo: revert up to 10 steps.
- Redo: go back up to 10 steps before the last Undo.
- Ask Chappy (AI) to create or modify packs (in-app purchase).

<br>

### [End User License Agreement](https://info.engineer.co.jp/EULA.html)

### [Privacy Policy](https://info.engineer.co.jp/PrivacyPolicy.html)

### [Source Code: GitHub](https://github.com/SumPositive/RackList/)

<br>

## About the Author: sumpo
It all started in 2009, when the iPhone 3 launched in Japan and I decided to try developing an app, so I bought a used Mac mini.

To get used to Xcode 3 / Objective-C / Cocoa, I enthusiastically built an app that I personally wanted.

Next, to become familiar with Core Data, I planned another app. I figured that even a self-indulgent app might hook about a hundred people worldwide, so I began releasing it on the App Store.

- February 16, 2010 2:23 — MochiMemo 0.2 released: manage belongings for work, travel, and camping (Total: 109,000 downloads)
- April 2, 2010 4:19 — KureMemo 0.1 released: record credit card use and compile totals (Total: 81,000 downloads)

During development, I realized that although the picker is for input (selection), it might also serve as output. Imagining a calculator that prints receipts like roll paper from a store register, I created a drum-style calculator.

- August 7, 2010 9:19 — DoraTaku 0.1 released; later renamed CalcRoll after becoming popular overseas (Total: 55,000 downloads)

As realistic 3D designs emerged, I faithfully recreated classic dial controls and built an app to use them.

- October 4, 2011 8:29 — Warikan 1.0 released: split bills with dial input for people and amounts (Total: 4,000 downloads)
- January 14, 2012 5:45 — BodyMemo 0.8 released: dial input for weight, blood pressure, etc., with compiled tracking (Total: 29,000 downloads)

With Expo 2025 approaching, I began porting CalcRoll to Swift 6 / SwiftUI.
On August 24, 2025, I submitted it as a new app, but Apple rejected it: "A similar app exists; no novelty." Fair enough! I resubmitted it as an update to the old app, it passed review, and was released.

- September 4, 2025 8:58 — KaruMemo / CalcRoll 2.0 released

After releasing KaruMemo in September 2025, I started migrating MochiMemo to SwiftUI. In about a month, an alpha version that solved long-standing issues was ready. The sample data shown on the initial screen was surprisingly good, thanks to AI! That sparked the idea to add the new "Ask Chappy (AI)" feature, which required developing a globally scalable API server and running it securely.

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

