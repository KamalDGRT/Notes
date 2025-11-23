# Build faster and more efficient apps

Date: 7<sup>th</sup> November 2024

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

---

### Reduce Your App's Energy Impact
- Karthik Sarve

###### What we are gonna look into:
- Understand energy impact
- Key technologies
- Monitor energy usage

###### What is energy

- Energy = Power x Time
- Are we sending a `High Priority` push notification?
- Is it really required/relevant?

###### Direct energy usage
- Runtime
- CPU activity
- Network activity
- Location activity
- Push notifications

###### Indirect energy usage
- Crashes and stability problems
- Memory use
- Hangs
- Disk writes

###### Key Technologies
To provide best experience try to use
- Transitions to background
- Downloading assets
- App refresh tasks
- Processing & Machine Learning
- Live activities

###### Limit work into the background
- Finish in-flight work and clean up
- `beginBackgroundTask(withName:expirationHandler)`
- `endBackgroundTask(_:)`
- Let the system know when the work is complete
- Dangling tasks may result in a termination

###### Download assets efficiently
- Background `URLSession`
- Intelligently schedules downloads
- Out-of-process design
- Resumable download and upload support

_Resources:_
Build robust and resumable file transfers - WWDC23

###### Refresh app data periodically
- `BGAppRefreshTask`
    - Opportunistic time to update content
    - Considers patterns in behavior
    - Best for periodic updates
- Background Notifications
    - Low priority push notifications required
    - Best for infrequent 

###### Schedule processing work
- `BGProcessingTask`
    - suitable for time-consuming work
    - considers charging state
    - Handles interruption

###### Update Live Activities efficiently
- reduce high energy impact with low priority notifications
- reserve higher priority for urgent updates
- Minimize update frequency
- Use `Text(_:format:)` for countdowns - `New`

_Resources:_
Update Live Activities with push notifications - WWDC23

----

#### Monitorig Energy Usage

###### Profile Your app

- Before ship - Energy Gauges, Instruments, XCTest
- After ship - Xcode Organizer, App Store Connect, MetricKit

SignPosts Blocks in code can be used to identify in logs in Instruments.

###### Next Steps
- Leverage energy efficient APIs to provide updates in background
- Monitor and optimize energy usage continuously
- Improve overall performance

----

### Speed up Core ML loading and execution
- Sandhya Kundapur

###### Machine Learning Models
- how will it impact app size?
- how long will it take to run?
- 

###### Overview
- Background
- Model analysis
- App analysis

###### Background
- workflow
- compute units
- frameworks
- model loading

###### Workflow
- `Train` -> `Prepare` -> `Integrate`

_Resources:_
- Train your machine learning and AI models on Apple GPUs - WWDC24
- Explore machine learning on Apple platforms - WWDC24

###### Compute units

- the hardware stuff - cpu, gpu, neural engines

# Framewokrs

- model integrations
- Core ML, uses MPS Graph(GPUs) & BNNS Graph(CPUs)

#### Model loading

- Source Model(`MLPACKAGE`) -> Compile -> Compiled Model(`MLMODELC`) -> Instantiate..

##### Cache policy

- persists across
    - model reload
    - app relaunch
    - reboot

- purged when
    - storage pressure
    - OS update
    - model changes or is deleted

#### Model Analysis

###### Preparation

- PyTorch , CreateML, MLPAckage

- How long does it take to load?
- how large is the model on the disk?
- how long will it take to colorize an image?
- how does the performance compare across devices?
- model pruning, paletization?

#### App Analysis
- Core ML Instrument
- `TaskGroup`

###### Wrap up

- how will it impact app size?
- how long will it take to run?
- will the test change in different devices?

###### Next steps

- analyze your models with the Xcode performance report
- profile your machine learning features
- use compression to improve disk space, speed, memory
