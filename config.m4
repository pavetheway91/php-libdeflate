dnl config.m4 for extension libdeflate

PHP_ARG_ENABLE(libdeflate, whether to enable libdeflate support,
[  --enable-libdeflate           Enable libdeflate support])

PHP_ARG_WITH(system-libdeflate, whether to use system libdeflate library,
[  --with-system-libdeflate           Use system libdeflate library], no, no)

if test "$PHP_LIBDEFLATE" != "no"; then

  if test "$PHP_SYSTEM_LIBDEFLATE" != "no"; then
    PKG_CHECK_MODULES([LIBDEFLATE], [libdeflate])
    PHP_EVAL_LIBLINE($LIBDEFLATE_LIBS, LIBDEFLATE_SHARED_LIBADD)
    PHP_EVAL_INCLINE($LIBDEFLATE_CFLAGS)
  else
    LIBDEFLATE_SOURCES="
      libdeflate/lib/x86/cpu_features.c
      libdeflate/lib/arm/cpu_features.c
      libdeflate/lib/adler32.c
      libdeflate/lib/crc32.c
      libdeflate/lib/utils.c
      libdeflate/lib/deflate_compress.c
      libdeflate/lib/gzip_compress.c
      libdeflate/lib/zlib_compress.c
    "
    PHP_ADD_INCLUDE(PHP_EXT_SRCDIR()/libdeflate)
    PHP_ADD_BUILD_DIR(PHP_EXT_SRCDIR()/libdeflate/lib)
    AC_DEFINE(HAVE_BUNDLED_LIBDEFLATE, 1, [Bundled libdeflate])
  fi

  PHP_NEW_EXTENSION(libdeflate, libdeflate.c $LIBDEFLATE_SOURCES, $ext_shared)
  PHP_SUBST(LIBDEFLATE_SHARED_LIBADD)
fi
