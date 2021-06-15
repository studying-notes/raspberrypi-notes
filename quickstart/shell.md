---
date: 2021-01-02T08:29:46+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "树莓派安装 ZSH 终端"  # 文章标题
# description: "文章描述"
url:  "posts/raspberrypi/shell"  # 设置网页永久链接
tags: [ "raspberrypi", "shell"]  # 标签
series: [ "树莓派学习笔记"]  # 系列
categories: [ "学习笔记"]  # 分类

# 章节
weight: 20 # 排序优先级
chapter: false  # 设置为章节

index: true  # 是否可以被索引
toc: false  # 是否自动生成目录
draft: false  # 草稿
---

```shell
sudo apt-get update && sudo apt-get upgrade
```

```shell
sudo apt-get install zsh -y
```

```shell
sh -c "$(curl -fsSL https://gitee.com/fujiawei/ohmyzsh/raw/master/tools/install.sh)"
```

```shell
chsh -s $(which zsh)
```

{{<link src="posts/ps/doc/ohmyzsh">}}

太卡，弃用

