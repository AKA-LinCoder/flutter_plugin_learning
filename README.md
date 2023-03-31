# plugin_test

插件编写学习

## 安卓端代码编写

在安卓目录下，点击其中一个文件选择在Android studio中编写即可

## iOS端代码编写

无法直接在iOS目录下选择Xcode打开，需要打开example项目中的iOS部分，然后找到Pods->Development Pods 找到对应的文件进行编写


### 三种Channel
- BasicMessageChannel:用于传递字符串和半结构化的信息
- MethodChannel: 用于传递方法调用
- EventChannel: 用于数据流的通信

### iOS端引入CocoaPods库
- 在iOS目录下的xxx.podspec文件中引入需要的插件
```
  s.dependency 'AMapLocation'
```
- 部分插件可能会报The 'Pods-Runner' target has transitive dependencies that include statically linked binaries: (/Users/estim/Desktop/Lin/my_flutter/plugin_test/example/ios/Pods/AMapLocation/AMapLocationKit.framework)
```
//解决办法
s.static_framework = true
```
- 新的method叫什么无所谓，但是都得在最开始的那个Plugin的register里面注册
- 解决 Action Required: You must set a build name and number in the pubspec.yaml file version field before submitting to the App Store.
```
在example里面的yaml文件里添加version x.x.x

```


## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

