# Docker-V2ray

This is a docker image for v2ray.

## What's V2ray

[Official Website](https://www.v2ray.com/)

[Github Repository](https://github.com/v2ray/v2ray-core)

V2ray is a platform for building proxies to bypass network restrictions.

## Info

- Travis-ci will build this image automatically everyday, and it will always try to download the latest version of v2ray-core.
- Travis-ci will build on multi-arch and label the images with different tags. You can use `docker pull yousiki/v2ray:$(uname -i)` to pull the one you want.

## Usage

``` bash
❯ docker run yousiki/v2ray -h
Usage of v2ray:
  -config string
    	Config file for V2Ray.
  -format string
    	Format of input file. (default "json")
  -test
    	Test config file only, without launching V2Ray server.
  -version
    	Show current version of V2Ray.
```

``` bash
docker run --network=host yousiki/v2ray -config=http://your.v2ray/config_file
```

``` bash
docker run --network=host -v $(pwd)/v2ray_config.json:/etc/v2ray/config.json yousiki/v2ray -config=/etc/v2ray/config.json
```

## Supported Architectures

- amd64
- arm64
- s390x
- ppc64le

## License

Apache License 2.0
