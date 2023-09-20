# SwiftUI NavigationDismiss bug demo
## Rapidly calling removeLast on system/custom navigation path causes NavigationStack and navigation path states to become desynced.

## Overview: 
This demo app shows how programmatically dismissing views on a `NavigationStack` by manipuating its `navigationPath` can cause the stack (UI state) and path (data state) to become "de-synced".

When using the environment dismiss action, the navigationPath's last value is removed **after** the "pop" animation completes.
When using programmatic dismissal (i.e. manually manipulating the navigationPath), the navigationPath's last value is removed **before** the "pop" animation begins.
The latter's behaviour causes the issues described below.  

## Steps to Reproduce:
(You can switch between `SystemNavigationPathView` and `CustomNavigationPathView` in `ContentView`)
1. Add 10 or more detail views onto navigation stack using the on-screen button.
2. Rapidly tap (more than 10 times) the "Navigate Back (\(path.count))" overlay button so that `navigationPath.count == 0`.
3. NavigationPath now reports `count == 0`, but NavigationStack still shows one or more detail views.
4. At this point, performing any of the following steps results in unexpected behaviour:
    a. Navigate back using a custom back button no longer works because navigationPath is already empty!
    b. Using the system back button causes stack to go back to an empty view with animation.
    c. Attempting to push a new detail view using on-screen button causes stack to perform a "pop" action instead (or some other unexpected action).

## Expected Behaviour:
Either
    a: If user rapidly taps custom back button, say, 7 times, navigation stack should go back 7 pages.
    b: NavigationPath should ignore programmatic manipulation while animation is in-flight. There should be a way to coordinate programmatic manipulation of a navigation path with its associated animation.

## Workaround:
- The custom back button (e.g. a persistent overlay or tab button not associated with any detail view) would have to gain access to each view's environment dismiss action, and use that to navigate back.
- We'll likely use this workaround, but it's a lot more cumbersome than being able to just manipulate a navigationPath in a root view.
- [Link to PR that uses this workaround](https://github.com/mlemgroup/mlem/pull/615)

## Additional Notes:
- This happens on iOS 16.5, 16.6 and iOS 17 (RC)
- This can be reproduced on device and in simulator.
