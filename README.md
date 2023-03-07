# gRPC protobuf 文件管理模板

## 1. 项目介绍

> 此处缺 8000 字，血泪史介绍

## 2. 项目结构

```bash
.
├── Makefile  # 项目构建脚本
├── README.md # 项目说明文档
└── namespace # 项目命名空间（此处仅是示例，实际可定义为项目名称）
    └── services # 服务目录
        └── sms.proto # 短信服务
```

## 3. 构建代码

> 此处针对其他需要使用到本 proto 文件项目；相关脚本的执行也是基于对应项目而生成

### 3.1. 仓库依赖

```bash
# 添加子模块
git submodule add git@github.com:flc1125/protobuf-template.git grpc/protobuf
```

> **目录说明：** `grpc/protobuf`: 仅为示例，推荐使用 `grpc/protobuf` 作为目录名

### 3.1. 环境依赖

- gRPC
- protoc
- protoc-gen-go (针对 GO 项目)
- protoc-gen-go-grpc (针对 GO 项目)
- plugin: grpc_php_plugin (针对 PHP 项目)

### 3.2. 构建

> 此处针对对

```bash
# 生成 Go 相关代码
make protoc-gen-go

# 生成 PHP 代码
make protoc-gen-php
```

## 4. QA

### 4.1. 为什么要使用子模块？

- 便于管理
- 便于版本控制
- 便于升级
- 便于回滚
- 便于迁移
- ……

> 以上是 `Github Copilot` 生成的，我觉得说的很对……

### 4.2. PHP 项目构建代码后，如何使用？

- 配置 `composer.json`，添加 `autoload` 的 `psr-4` 配置

    ```json
    {
      "autoload": {
        "psr-4": {
          "Namespace\\": "grpc/Namespace/",
          "GPBMetadata\\": "grpc/GPBMetadata/"
        }
      }
    }
    ```

- 执行 `composer dump-autoload`

### 4.3. 如何做版本控制？

- 项目根目录下，添加 `.gitmodules` 文件，内容如下：__(前面已配置的话，可忽略)__

    ```bash
    [submodule "grpc/protobuf"]
        path = grpc/protobuf
        url = git@github.com:flc1125/protobuf-template.git
    ```

- 进入目录 `grpc/protobuf`，执行 `git checkout <tag|commit-id>`，切换到对应版本