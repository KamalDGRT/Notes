# Build faster and more efficient apps

###### 3 phases:
- develop, test, monitor

###### Monitoring Tools:
- XCode Organizer
    - Regressions
    - notifications
    - Launch reports

Note: user has to consent to send reports.

WWDC Videos on Instruments & Templates

Disk Writes - one of th common causes of slow launch

----

tools that can be used in development phase:
- Instruments

Analyze Heap Memory - WWDC24

----

Tools that can be used in testing phase

Performance Unit Tests - good to have.

###### Add Performance Tests
- app launch time
- time elapsed
- CPU usage
- memory usage
- Disk writes
- Hitches
- OS Signpost durations

###### Customize and run tests
- configure iterations
- run tests directly in Xcode
- View measurements

###### Run performance tests in automation
- Use xcodebuild to run tests outside of Xcode
- Consume results in the xcresult bundle
- Turn on performance test diagnostics

it is always reccomended to use physical devices to test performances

---

Develop + Monitoring Phase

###### MetricKit
- Create Custom Analtyics
- receive diagnostics and aggregated metrics
- Collect Testflight analytics before release

MXMetricManagerSubscriber

###### Next Steps:
- consult Xcode Organizer to monitor performance
- turning on Regression Notifications
- Investigate runtime issues
- Add performance tests
- collect metricKit data for detailed insights

---

### Maximize SwiftUI performance by minimizing updates.
- Karthik Sarve

###### Resources:
- Introduction to SwiftUI - WWDC20
- SwiftUI Essentials - WWDC24

###### Agenda:
- Keep view initializers and bodies simple
- break down monolithic views
- structure dependencies efficiently

###### End Goal:
Reduce the _frequency and cost_ of view updates to achieve greate SwiftUI performance.

###### When does a view's body run?
- first render
- value change
- dependency change
- identity change

###### Keep view initializers and bodies simple
- initializers run often
- body runs when view value canges
- intializers should intialize
- bodies should declare heirarchy

- ❌ Avoid parsing text or other calculations
- ❌ Avoid loading data from the network or disk
- ✅ a view's body is just for laying out the view
- ❌ avoid extra work or ..

---

###### Break Down Monolithic Views

trying to localize the updates to the singular views.

- Break up large views
- keep dependencies near uses
- identify hot spots with Instruments

---

#### Structure dependencies efficiently

###### View dependencies
- Properties
- `@Environment`
- `@State` and `@Binding`
- `ObservableObject`
- `@Observable` - introduced in iOS 17


###### @Observable Macro
- Adds update tracking to model classes
- reading a property establishes a dependency
- works for computed properties
- ℹ️ all assignments trigger updates

_**Resources:**_ Discover Observation in Swiftui - WWDC23

###### Some things to watch out for
- Watch out for `GeometryReader` in `ScrollView`
- Avoid `Environment` churn
- Beware complex nested structs

###### Next Steps:
- profile your app with instruments
- break up your large views
- Migrate to `@Observable`


_**Resources:**_
- Data Essentials in SwiftUI - WWDC20
- Demystify SwiftUI performance - WWDC23
