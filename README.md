# Mimic Flutter Framework
*A lightweight, educational re-implementation of Flutter’s core widget system, built from scratch to deeply understand how Flutter actually works under the hood.*


## Overview

**Mimic Flutter Framework** is a simplified, minimal version of Flutter’s internal architecture that demonstrates how widgets, elements, and states interact to build and rebuild UI trees.

This project doesn’t aim to replace Flutter.  
Instead, it aims to **demystify** it by re-creating the core concepts of:
- `Widget`
- `Element`
- `StatefulWidget` / `StatelessWidget`
- `State`
- `BuildContext`
- `Rebuild lifecycle`

If you’ve ever wondered *how `setState()` really works*, or *why widgets are immutable but still rebuild*, this framework is the best hands-on way to learn it.

---

## 🧩 Key Concepts Demonstrated

| Concept | Description |
|----------|--------------|
| **Widget** | Immutable configuration — a blueprint of the UI. |
| **Element** | The living connection between widget and render tree. Manages lifecycle and rebuilds. |
| **StatefulWidget / State** | A pair of classes that separate immutable configuration from mutable UI state. |
| **StatelessWidget** | A pure widget that rebuilds entirely when configuration changes. |
| **BuildContext** | A reference to the current `Element` — used to locate ancestors in the tree. |


## 🧩 Learning Objectives

Through this mini-framework, we will get a gist idea of:

- **Understand how Flutter builds and rebuilds UI trees.**
- **See clearly why widgets are immutable but elements and states are not.**
- **Visualize the Widget → Element → RenderObject relationship.**
- **Learn how setState() triggers only the local rebuild, not the entire app.**
- **Recognize what BuildContext really represents (a reference to the current Element).**

## 🧑‍💻 Author
# **Tarikul Islam**
Learning Flutter from the inside out

Contact me on **LinkedIn** -> https://www.linkedin.com/in/tarikul-islam-a2785118a