load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repositories():
    # Node (https://nodejs.org/en/about/releases/)
    # Follow Node's maintainence schedule and support all LTS versions that are not end of life
    http_archive(
        name = "nodejs12_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "a8c284754fa7f21bfbd6d15bf94df83285bf009fd0f3e33227d768fd1f6d6593",
        strip_prefix = "node-v12.22.10-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v12.22.10/node-v12.22.10-linux-x64.tar.gz"],
    )

    http_archive(
        name = "nodejs14_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "223ca31e3440b79a3fe6828161b1843743eaa7610a88c0e1ac1d8e1d815b44cd",
        strip_prefix = "node-v14.19.0-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v14.19.0/node-v14.19.0-linux-x64.tar.gz"],
    )

    http_archive(
        name = "nodejs16_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "2c69e7b040c208b61ebf9735c63d2e5bcabfed32ef05a9b8dd5823489ea50d6b",
        strip_prefix = "node-v16.14.0-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v16.14.0/node-v16.14.0-linux-x64.tar.gz"],
    )

    http_archive(
        name = "nodejs12_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "1c2e82099a7b1e2c43327f2e5d2ced22b69738870272a2cbc8c92dea4299980a",
        strip_prefix = "node-v12.22.10-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v12.22.10/node-v12.22.10-linux-arm64.tar.gz"],
    )

    http_archive(
        name = "nodejs14_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "89c03d1c156c0161c891924d4a309df3308bbf245641413d72affae9b62e97e0",
        strip_prefix = "node-v14.19.0-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v14.19.0/node-v14.19.0-linux-arm64.tar.gz"],
    )

    http_archive(
        name = "nodejs16_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "82d71968c82eb391f463df62ba277563a3bd01ce43bba0e7e1c533991567b8fe",
        strip_prefix = "node-v16.14.0-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v16.14.0/node-v16.14.0-linux-arm64.tar.gz"],
    )
