# MochiMemo User Guide

This is a packing checklist that is useful for trips and events. You can edit it freely.

Use it for travel or business trips. By totaling the weight, you can pack according to your strength. It is also helpful for managing hobby equipment.

We aimed to minimize the effort required to operate the app. There is no common "Confirm" button, nor is there a "Save" button after editing. The "Delete" button removes items immediately without confirmation. If you make a mistake, you can return to the previous state with the "Undo" button.

You can now ask Chappy (AI) to create or modify a pack (in-app purchase). Because the results are not guaranteed, please treat them as templates, adjust them, and use them.

Records are kept in the following three-layer structure. Items are the smallest unit of belongings.
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

Please try the features below.

## Features

    - Check each item and review the overall completion status.
    - Record the required quantity and the inventory quantity.
    - Register item weights (g) and check the total weight.

    - Rearrange items by drag-and-drop.
    - Move items to other groups or packs.

    - Ask Chappy (AI) to create or modify packs (in-app purchase).

<br>

### [End User License Agreement](https://info.engineer.co.jp/EULA.html)

### [Privacy Policy](https://info.engineer.co.jp/PrivacyPolicy.html)

### [Source Code: GitHub](https://github.com/SumPositive/RackList/)

<br>

## About the Author: sumpo
It all started in 2009 when the iPhone 3 launched in Japan and I decided to try developing an app, so I bought a used Mac mini.

To get accustomed to Xcode 3 / Objective-C / Cocoa, I enthusiastically built an app that I personally wanted.

Next, I planned an app to become familiar with Core Data. I figured even a self-serving app would captivate about a hundred people worldwide, so I started releasing it on the App Store.

    - February 16, 2010 2:23 — MochiMemo 0.2 released: manage items for work, travel, and camping (Total: 109,000 downloads)
    - April 2, 2010 4:19 — KureMemo 0.1 released: record credit card usage and compile totals (Total: 81,000 downloads)

During development, I realized that the picker, which is meant for input (selection), might also be usable for output. Imagining a calculator that prints receipts like the roll paper from a store register, I built a drum-style calculator.

    - August 7, 2010 9:19 — DraTaku 0.1 released; later renamed CalcRoll after gaining popularity overseas (Total: 55,000 downloads)

As realistic 3D designs emerged, I recreated classic dial controls and built an app to use them.

    - October 4, 2011 8:29 — Warikan 1.0 released: split bills with dial input for people and amounts (Total: 4,000 downloads)
    - January 14, 2012 5:45 — BodyMemo 0.8 released: dial input for weight, blood pressure, etc., with compiled tracking (Total: 29,000 downloads)

With Expo 2025 approaching, I began porting CalcRoll to Swift 6 / SwiftUI.
On August 24, 2025, I submitted it as a new app, but Apple rejected it, saying “There is a similar app with no novelty.” Fair enough! I reluctantly resubmitted it as an update to the old app, and it passed review.

    - September 4, 2025 8:58 — KaruMemo / CalcRoll 2.0 released

After launching KaruMemo in September 2025, I started migrating MochiMemo to SwiftUI. In about a month, I had an alpha version that resolved longstanding issues. The sample data displayed on the initial screen turned out surprisingly well thanks to AI! That sparked the idea to add the new “Ask Chappy (AI)” feature, which led to the massive task of developing a globally scalable API server and managing it securely.

    - November 30, 2025 x:xx — MochiMemo / Packlin 3.0 released


<br><br>

## Version History

| Version  | Release Date | Development Environment
|----------|--------------|
| 0.2      | 2010/2/16    | MochiMemo / PackList, Xcode 3, Objective-C, Core Data
| 0.5.5    | 2010/6/27    |
| 1.0      | 2011/4/23    | Xcode 4, Objective-C, Core Data
| 1.1      | 2011/9/22    |
| 1.2      | 2012/3/31    |
| 2.0      | 2012/3/28    |
| 2.1.3    | 2017/9/28    |
|----------|--------------|
| 3.0      | 2025/11/30   | MochiMemo / Packlin, Xcode 26, SwiftUI, SwiftData


