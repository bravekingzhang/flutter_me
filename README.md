# douban_me

这不是flutter已经是bate2了，马上就release了，所以我就开始搞了

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

## 目前就做了一个豆瓣电影列表的功能，代码量是相当少啊。

### 你将会学到
1. 怎么样使用列表控件，Row控件，Column控件
2. 怎么使用网络加载，异步操作怎么处理
3. 实现加载更多
4. 如何使用flutter布局，个人感觉相当好理解，Row控件，Column控件，ListView控件就能做出这个效果，我这是一个卡片
5. 使用buildDefaultTabController容易的实现viewpager类似的东东
6. 实现自定义控件 Ratingbar
7. tab
8. bottomNavigationBar
9. 页面间的跳转。

### 我这里遇到了一些坑
1. 在ListView的item中使用横向ListView，导致运行不出来，因此那个换成了Row。
2. 在使用column和row控件的时候，界面刷步出来，定位原因是因为里面存在不确定的rect的子控件导致，
因此解决的办法就是使用expande,或者flexable包裹，或者其他的方式能够明确子控件怎么占位，占多少位置。
3. 切换代缓存的图片控件`cacheImage`出现问题，刷步出图片，解决办法，卸载安装包，重装，原因没有定位出

### 以下是运行截图了

![2018-04-13 16_10_08](https://user-images.githubusercontent.com/4476322/38723932-3ec1b49c-3f35-11e8-9f6b-671d365437bf.gif)

### 安装包

安装包有8M。因为用原生的写会不至于有这么大，所以要看看究竟，其实很容易发现，flutter库占了很大部分，实际dex文件较小。
![image](https://user-images.githubusercontent.com/4476322/38778622-e107db04-40ee-11e8-817f-9b0fa1eeb180.png)

上传的源码中已经打好了apk，可以直接下载安装，ipa包没有打，打了没有越狱一般也安装不了的，苹果这套对开发者不是很友好。
![image](https://user-images.githubusercontent.com/4476322/38778902-09d5774a-40f3-11e8-90b7-b509ceb5e3e2.png)


### 注意事项

如果你想自己下载源码玩玩的话：

1. config.dart 是需要你在showApi平台上自己申请appid和secretkey的
2. android工程中的key.properties文件中的value需要你自己配置你的秘钥，具体打包方式参考dart.io文档中 Build and release for Android 这一节。





