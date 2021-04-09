# CodingTest
这是一个简单的信息展示项目，包含列表页、详情页、网页加载。


## To start
不需要在本地pod install，我连带pods文件上传到了repo

## 目录
[首页](#首页)
[详情页](#详情页)
[实现细节](#实现细节)

## 首页

<img src="https://github.com/woshiziye/CodingTest/blob/master/CodingTest/ScreenShot/1.PNG?raw=truePNG" width="300" /> <img src="https://github.com/woshiziye/CodingTest/blob/master/CodingTest/ScreenShot/2.PNG?raw=truePNG" width="300" /> <img src="https://github.com/woshiziye/CodingTest/blob/master/CodingTest/ScreenShot/3.PNG?raw=truePNG" width="300" />

- 展示了text/img/text-img/text-link 几种类型数据
- 图片在列表中展示方式:
  - 单张以3:4平铺
  - 多张以九宫格方式展开，超过9张，右下角显示图片的数量
- 可以体验无网络

### 注意：
>数据从项目中json文件取出来，然后Codable解析成Model加载，如果要其他数据，可修改[data.json](https://github.com/woshiziye/CodingTest/blob/master/CodingTest/data.json)
>但要注意，数据单元中的格式为：  
>{  
>   &nbsp;&nbsp;&nbsp;"id": 5,  
>     &nbsp;&nbsp;&nbsp;"type": "text-img",  
>     &nbsp;&nbsp;&nbsp;"content": "这是 ArcBlock ABT Node 界面截图",  
>     &nbsp;&nbsp;&nbsp;"imgUrls": [  
>     &nbsp;&nbsp;&nbsp;&nbsp;"https://www.arcblockio.cn/blog/static/e8e5ec2f2824b819380b605d6c50cc2b/92c65/blocklets.png"  
>  &nbsp;&nbsp;&nbsp;],  
>     &nbsp;&nbsp;&nbsp;"link": "https://abtwallet.io/zh/"  
>}  

## 详情页
<img src="https://github.com/woshiziye/CodingTest/blob/master/CodingTest/ScreenShot/4.PNG?raw=truePNG" width="300" /> <img src="https://github.com/woshiziye/CodingTest/blob/master/CodingTest/ScreenShot/5.PNG?raw=truePNG" width="300" /> <img src="https://github.com/woshiziye/CodingTest/blob/master/CodingTest/ScreenShot/6.PNG?raw=truePNG" width="300" />

分为带排版/无排班的详情展示
> 原始数据中的文字和图片没有排版，只能简单的显示text，然后多张展示图片
> 这里我引用了类html标签的方式，把不同的展示类型，放入了对应的标签中，参考图6
> 通过list中的content传入有排版的string，结构如下：

```
<head>ArcBlock 2021 年 3 月回顾
<date>2021-03-31
<short>3 月，ArcBlock 研发团队进行了一系列产品更新升级，并在反向换币服务、资产链迁移、实现 NFT 购买 Blocklet 及启动 ABT 节点实例等方面取得长足进展。
<title>产品更新与升级
<link href='https://www.arcblock.io/blog/zh/post/2021/03/06/abtnode-changelog-03-06-2021'>ABT 节点 1.2.3 版更新日志
<link href='https://www.arcblock.io/blog/zh/post/2021/03/22/abtnode-changelog-03-22-2021'>ABT 节点 1.2.5 版更新日志
<link href='https://www.arcblock.io/blog/zh/post/2021/03/29/abtnode-changelog-03-29-2021'>ABT 节点 1.2.6 版更新日志
<link href='https://www.arcblock.io/blog/zh/post/2021/03/05/webwallet-changelog-03-05-2021'>ABT 钱包网页端 0.2.20 版更新日志
<title>研发周报
```
> 这样就可以根据标签取出 head、date、short、link 等数据，再进行对应样式展示

## 实现细节
- 列表数据根据pageSize每次读取，可加载更多，每次加载一个page的数据
- 列表中图片展示，单张/多张，根据图片数量计算size，达到美观效果
- 多图由cell中的子控件ImagesView来管理，初始化加载9张图片，然后每次用到图片展示，不需要再次初始化，复用原来子view即可
- 使用多种cell来根据不同type展示，方便后续单独调整type样式，使代码维护性更高
- 图片加载使用Kingfisher框架，实现缓存/加载，不用担心反复加载，提高list中图片复用效率

详情页参考了ArcBlock新闻页展示风格 [链接](https://www.arcblock.io/blog/zh/post/2021/03/31/march-monthly-review)

