## Mely iOS App 结构说明（Feature-First）

本文档简要说明当前 SwiftUI 工程的项目结构和设计思路，方便后续迭代时保持风格一致。

---

### 1. 顶层结构

- **App 入口**
  - `MelyApp.swift`：标准 `@main` 入口，保持 HotSwiftUI 注入逻辑。
  - `ContentView.swift`：仅作为调试入口的代理视图，内部直接展示 `AppRootView`。

- **根视图与导航**
  - `AppRootView.swift`：
    - 持有一个简单的枚举路由 `MainRoute`（`home / community / chat / profile`）。
    - 使用 `@State private var currentRoute` 管理当前主页面。
    - 通过 `switch currentRoute` 选择展示哪个页面。
    - 只在首页时叠加一个右下角的悬浮跳转栏 `FloatingPageSwitcher`。

- **共享组件**
  - `Shared/FloatingPageSwitcher.swift`：
    - 悬浮式页面跳转组件。
    - 底部右下角悬浮，一个主按钮 + 若干展开的目标页面按钮。
    - 通过闭包把路由变更回传给 `AppRootView`，不引入复杂的全局状态。

---

### 2. Feature-First 目录

在 `Mely/Mely/Mely` 下使用扁平的 feature-first 结构，每个功能模块自包含自己的 View 和就近状态。

- `Features/Home/HomeView.swift`
  - 首页，示例性放置了标题、说明文案和一个“刷新”示例逻辑。
  - 使用 `@State` 就近管理刷新状态，不额外创建 ViewModel。

- `Features/Community/CommunityView.swift`
  - 社区页，顶部为标签筛选，下面是简单的列表占位数据。
  - `@State private var selectedTag` 就近管理当前选中的标签。

- `Features/Chat/MessageView.swift`
  - 聊天页，包含消息列表 + 底部输入栏。
  - `@State private var inputText` 与 `messages`，逻辑与 UI 放在同一个文件。

- `Features/Profile/ProfileView.swift`
  - 个人中心页，包含简单的用户信息卡片和设置项（示例性的深色模式开关等）。
  - 同样采用本地 `@State` 管理示例状态。

> 约定：新功能优先在 `Features/<FeatureName>/` 下增加文件/子模块，不额外建立 `ViewModel` 目录，避免人为分层导致的样板代码。

---

### 3. 悬浮跳转栏设计

- 文件：`Shared/FloatingPageSwitcher.swift`
- 位置：在 `AppRootView` 中通过 `ZStack` + `.frame(alignment: .bottomTrailing)` 右下角悬浮。
- 交互：
  - 主按钮点击后展开/收起。
  - 展开后展示“社区 / 聊天 / 我的”等目标页面按钮（首页作为当前页，不在列表中）。
  - 点击任一按钮时：
    1. 收起菜单。
    2. 调用 `onSelect(MainRoute)` 闭包，将目标路由传回 `AppRootView`。
    3. `AppRootView` 更新 `currentRoute`，完成页面切换。
- 状态管理：
  - 悬浮栏内部只管理自身展开/收起状态 `isExpanded`。
  - 当前主页面路由 `currentRoute` 统一由 `AppRootView` 持有，避免到处散落路由状态，但又不引入复杂的全局 Store。

---

### 4. 架构原则总结

- **不使用传统 MVVM**：没有统一的 `ViewModel` 目录，也不强制每个页面配一个类。
- **Feature-First**：按功能模块划分目录，而不是 Data / Domain / Presentation 这类教科书式分层。
- **状态就近管理**：优先使用 `@State`、`@StateObject` 等就近放在 View 内；只有当跨页面共享时，再考虑上移到更高层。
- **逻辑与 UI 同文件**：简单状态和交互逻辑直接写在对应 View 文件中，命名清晰即可。
- **尽量扁平**：目录层级控制在 2–3 级之内，能少一层就少一层。
- **可渐进扩展**：
  - 如果后续某个 Feature 变复杂，再在 `Features/<FeatureName>/` 下按需补充子 View、Service 等。
  - 悬浮跳转栏的按钮数据来自一个数组，后续新增主页面时只需：
    1. 扩展 `MainRoute`。
    2. 在 `AppRootView` 的 `switch` 中增加 case。
    3. 在 `FloatingPageSwitcher` 的 `items` 中增加一项。
