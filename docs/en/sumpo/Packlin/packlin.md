# Mochi Memo / Packlin User Guide

A packing checklist useful for travel and events. Edit freely as you like.

Use it for trips and business travel. Weight totals help you pack to match your strength. It also works well for managing hobby gear.

## Undo

The goal is to minimize extra steps. There are no common "confirm" prompts, and there is no "save" button after editing. "Delete" removes items without confirmation. If you make a mistake, tap the "Undo" ![alt text](arrow.uturn.backward.png) button to revert to the previous state. You can go back up to 10 steps.

## Features

Give the following features a try:

    - Check items one by one and see overall completion
    - Record required quantity and stock quantity
    - Register item weight (g) and check total weight

    - Reorder via drag and drop
    - Move or duplicate items to other groups or packs
    - Move or duplicate groups to other packs

    - Undo: revert up to 10 steps
    - Redo: restore up to 10 steps before Undo

## Specifications

    - Database: SwiftData (sqlite3)

    - Quantity limits (maximum): functionally almost unlimited, but restricted for validation. Tell us if you have use cases needing larger limits.
        - Packs: 30
        - Groups: 30
        - Items: 100
        - Item weight: 999,999 (g)
        - Stock quantity: 999
        - Required quantity: 999
        - Name: 200 characters
        - Memo: 200 characters

    - Data structure: recorded in three layers below; Item is the smallest unit
        App
        ├─ Pack (bags, backpacks, trunks, storage, etc.)
        │   ├─ Group (pouches or boxes for subdividing)
        │   │   ├─ Item (individual objects)
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

    - Version x.y.z: build number; each value starts at 0 and increments as follows
        - x: major overhaul, full redesign
        - y: feature additions or changes
        - z: minor adjustments, bug fixes

    - Support: support identifier; an 8–12 character alphanumeric string
        - Cannot identify an individual
        - Used when server log investigation is required

<br>

### [End User License Agreement](https://info.engineer.co.jp/EULA.html)

### [Privacy Policy](https://info.engineer.co.jp/PrivacyPolicy.html)

### [Source Code: GitHub](https://github.com/SumPositive/RackList/)

### [Author Bio: sumpo](https://docs.azukid.com/sumpo/jp/index)

<br>

## Release History

| Version  | Release Date | Development Environment |
|----------|--------------|-------------------------|
| 0.2      | 2010/2/16    | Mochi Memo / PackList — Xcode 3, Objective-C, Core Data |
| 0.5.5    | 2010/6/27    | |
| 1.0      | 2011/4/23    | Xcode 4, Objective-C, Core Data |
| 1.1      | 2011/9/22    | |
| 1.2      | 2012/3/31    | |
| 2.0      | 2012/3/28    | |
| 2.1.3    | 2017/9/28    | |
|----------|--------------|-------------------------|
| 3.0      | 2025/12/xx   | Mochi Memo / Packlin — Xcode 26, SwiftUI, SwiftData |
