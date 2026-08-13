# php-libdeflate
Keeping the lights on after [pmmp/ext-libdeflate](https://github.com/pmmp/ext-libdeflate) was archived.

PHP bindings for [libdeflate](https://github.com/ebiggers/libdeflate), a zlib replacement with significantly better performance.

## Installation

### Pie
With bundled libdeflate:
```
pie install pavetheway91/libdeflate
```
With system libdeflate:
```
pie install pavetheway91/libdeflate --with-system-libdeflate
```

### Binary packages
Fedora / RHEL / Rocky packages available from [Remi's RPM repository](https://rpms.remirepo.net/)

## Features
At the time of writing, only libdeflate's compression APIs are implemented.

## Performance
Compared to `zlib_encode()`, a 40% performance improvement can be observed at level 1, rising to 50-70% at level 6 (default), for approximately the same compression ratios. Also, `libdeflate_deflate_compress()` was observed to sometimes be faster at level 6 compression than `zlib_encode()` at level 1 compression.

## Compression levels
Libdeflate provides compression levels up to 12. At level 12, compression ratio is in the same league as [zopfli](https://github.com/google/zopfli), but libdeflate wins in speed.

## API
```php
<?php

/**
 * Equivalent to zlib_encode($data, ZLIB_ENCODING_RAW, $level)
 * @throws \RuntimeException
 */
function libdeflate_deflate_compress(string $data, int $level = 6) : string;

/**
 * Equivalent to zlib_encode($data, ZLIB_ENCODING_DEFLATE, $level)
 * @throws \RuntimeException
 */
function libdeflate_zlib_compress(string $data, int $level = 6) : string;

/**
 * Equivalent to zlib_encode($data, ZLIB_ENCODING_GZIP, $level)
 * @throws \RuntimeException
 */
function libdeflate_gzip_compress(string $data, int $level = 6) : string;
```
