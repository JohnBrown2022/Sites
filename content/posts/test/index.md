---
title: "博客搭建备忘录"
date: 2023-07-12T23:58:25+08:00
lastmod: 2023-07-12T23:58:25+08:00
author: ["Me"]
keywords: 
- 
categories: # 没有分类界面可以不填写
- 
tags: # 标签
- 
description: ""
weight:
slug: ""
draft: false # 是否为草稿
comments: true # 本页面是否显示评论
reward: true # 打赏
mermaid: true #是否开启mermaid
showToc: true # 显示目录
TocOpen: true # 自动展开目录
hidemeta: false # 是否隐藏文章的元信息，如发布日期、作者等
disableShare: true # 底部不显示分享栏
showbreadcrumbs: true #顶部显示路径
cover:
    image: "" #图片路径例如：posts/tech/123/123.png
    zoom: # 图片大小，例如填写 50% 表示原图像的一半大小
    caption: "" #图片底部描述
    alt: ""
    relative: false
---
基本需求：
Win10+Macos同步；常用.md编辑器Obsidian；

本文记录了利用Github Pages+Hugo以及自定义域名搭建个人博客各个步骤。鉴于互联网上已有各路大佬有更详尽的介绍（文中已附链接），本文只针对搭建过程中踩坑做备忘以供参考。

初衷是一些个人博客持续产出高质量的内容，比如热门深度学习相关技术[Lil'Log](https://lilianweng.github.io/)，分子动力学模拟实操指南[Compchems](https://www.compchems.com/)以及一些或深入或新颖的观点[Essays · Gwern.net](https://gwern.net/index)等。这前者相较于官方Tutorial是初学者快速入门&上手更低门槛的一手材料，后者是自由程度更高的言论平台，提供不同的观察世界的角度。笔者也心向往之，趁着暑假科研任务还算轻巧，着手搭建该博客。

关键词：Hugo, PaperMod, Git, Blog

## 1.Github Pages设置
### 配置Github Pages

### 配置多个Github Pages
当我们利用Github Pages完成一个博客搭建后，或许还有多个Pages需求，或者在博客内嵌套不同Pages网页。配置多个Pages的答案是肯定的。
`据官网介绍，Github Pages共有三种类型：项目、用户和组织。前者数量没有限制，后两者同一个账户只可建立一个。`
具体操作指南见[如何拥有多个GitHub Pages - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/183977963)
## 2.Hugo配置
### 安装
Win10有不同的安装方式，这里选择[预编译二进制文件](https://github.com/gohugoio/hugo/releases/tag/v0.115.2)安装方式：直接去[hugo](https://github.com/gohugoio/hugo/releases)下载对应版本`xxxx-windows-amd64.zip`即可，解压后将hugo添加至环境变量即可。
### 配置
```
hugo new site [blog name] 
#当前目录下创建[blog name]文件夹，内包含必要文件；[blog name]下文指代根目录
```
### 配置主题
这里选择[PaperMod](https://github.com/adityatelange/hugo-PaperMod)，简洁经典，使用人数也比较多，性能以及兼容性都不错。
```
# 在./themes/下
git clone https://github.com/adityatelange/hugo-PaperMod.git 
```
这边建议按照[Sulv's](https://www.sulvblog.cn/posts/blog/build_hugo/)建议将部分包含网站组成资源的文件夹复制到根目录中，以免更新主题后替换掉原来组成，造成网页元素缺失。

上面提到的部分跟着前文提到的教程一步一步来即可，下面就是一定定制化(customized)配置，笔者认为了解这些能更方便快速的上手。

---
- 配置文件
```yaml
# 这边建议将xxx.toml重命名为xxx.yaml
# 这里只针对笔者修改部分进行注释，详细介绍详见PaperMod Wiki

baseURL: "https://examplesite.com/" # 绑定域名
title: Spectator1919's Blog
paginate: 5
theme: PaperMod

  assets: # 网站缩略图
    favicon: "icon.svg"
    favicon16x16: "icon.svg"
    favicon32x32: "icon.svg"
    apple_touch_icon: "icon.svg"
    safari_pinned_tab: "icon.svg"

  label:  # 主页头像
    text: "Home"
    icon: "icon.svg"
    iconHeight: 35

# 添加菜单
menu:
  main:
    - identifier: posts
      name: Posts # 展示出的名称
      url: /posts/ # 指向./content/下目录
      weight: 10 # 值越小位置越靠前
    - identifier: archives
      name: Archives
      url: archives/
      weight: 20
    - identifier: search # 搜索
      name: Search
      url: search/
      weight: 30

# add RSS
outputs:
  home:
    - HTML
    - RSS
    - JSON

```


## 3.内容编辑&页面发布
```
# 含有图片blog文件结构
/
├── content/
│   └── posts/
│       └── hello-world/
│           └── images/
│               └── 图片.jpg
│           └── index.md

```

```
hugo new posts/title/index.md
```
其中`hello-world`为当前文章标题，`index.md`会根据`.\archetypes\default.md`中模板自动创建，在该文件中填写博客内容即可。`default.md` 可以根据[PaperMod Front Matter配置](https://adityatelange.github.io/hugo-PaperMod/posts/papermod/papermod-variables/)进行修改。
注意`images`文件夹续手动创建，可以使用脚本自动化创建：

```new.sh
# macos
branch=$1
title=$2

hugo new $branch/$title/index.md

mkdir -p $branch/$title/images

---
./new.sh posts title
```
博客中如显示图片，使用相对地址`![figure](./images/figure.xxx)` 即可。

## 4.碎碎念
- 在模板上定制化博客网站样式，关键是配置文件`xxx.ymal` 以及 `default.md` 中相关变量的设定。这部分建议先使用默认配置，后续再慢慢探索；其实对我个人而言，还有个问题就是语言障碍，虽然大部分变量名知道大概意思，但不能很好对应到网页上来，还需反复尝试。
- 意外感觉[Notion 风格头像制作 ](https://notion-avatar.vercel.app/zh)很时候用作网页缩略图以及主页头像。
- 有关博客篇首自动集成的`Table of Contents` 模块对`md` 文件中多级标题识别的问题，一级二级标题递进一致，习惯用多级标题的需留意。
### 改进目标
- 利用ChatGPT实现全文翻译，提供中英双语选择
- 添加评论区
- 知识分享类博客添加citations/reference，技术向超链接足矣。

