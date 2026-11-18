# Provenance — onnxruntime-linux-x64-1.19.2

This archive is **not** the original `onnxruntime-linux-x64-1.19.2.tgz` published by Microsoft on
GitHub. That repository (`github.com/microsoft/onnxruntime`) was removed on or about 2026-11-17 and
its release assets are no longer retrievable. No copy of the original archive was found on any machine
we control, and no Wayback Machine snapshot of the asset URL exists.

This archive was **repackaged on 2026-11-18** from ONNX Runtime 1.19.2 binaries that Microsoft still
publishes through its other official package channels, by Artisan Build, Inc., for
`artisan-build/onnxruntime-mirror`. Byte-equality with the original archive is **not** claimed. What
is claimed, and recorded below, is that every binary in it came from a Microsoft-published 1.19.2
package and was confirmed against at least one second, independent Microsoft channel.

## Library in this archive

`lib/libonnxruntime.so.1` (and the same bytes again as
`lib/libonnxruntime.so.1.19.2`; `lib/libonnxruntime.so` is a relative symlink to `libonnxruntime.so.1`).
The library's own `SONAME` is `libonnxruntime.so.1`, so that is the name a consumer's `DT_NEEDED`
resolves to.

| | |
|---|---|
| sha256 | `9c8139e1856568f068f1cad78fc9798084941db50be7c201a1dbdcfd18105433` |
| size | 16,153,912 bytes |
| ELF build-id | `38739264209f84cc3fbe7eb4a88f37cbcc5bbdd3` |
| primary source | NuGet `Microsoft.ML.OnnxRuntime` 1.19.2, `runtimes/linux-x64/native/libonnxruntime.so` |
| cross-check | Maven Central `com.microsoft.onnxruntime:onnxruntime:1.19.2`, `ai/onnxruntime/native/linux-x64/libonnxruntime.so` — **identical sha256 and identical build-id** |

Also examined and **not** used, because they are different builds of the same version rather than
different packagings of one build:

- PyPI `onnxruntime==1.19.2` manylinux x86_64 wheel, `onnxruntime/capi/libonnxruntime.so.1.19.2` —
  sha256 `4ff01702cba83d4162e87752deb6f09a8bb9297185880e2b54067ef3ffb334f1`, build-id
  `2b4e47f67849899983328619161c5048cc07de9d`, 16,313,648 bytes.
- npm `onnxruntime-node` 1.19.2, `bin/napi-v3/linux/x64/libonnxruntime.so.1.19.2` — sha256
  `b0889fdeb0759987052b28c66c6a0b170426d0d70bfee84daad020f49d594043`, build-id
  `3e11016d863cfd67a2615c0ff3d4a6d60defdbf3`, 19,243,808 bytes (a larger build, more execution
  providers compiled in).

## Source packages

| package | fetched from | sha256 |
|---|---|---|
| `Microsoft.ML.OnnxRuntime.1.19.2.nupkg` | `https://api.nuget.org/v3-flatcontainer/microsoft.ml.onnxruntime/1.19.2/microsoft.ml.onnxruntime.1.19.2.nupkg` | `fa133c8fe6238445a0dd3e8447baa5c7d16f418caa8e576c7e253ba77b27b61b` |
| `onnxruntime-1.19.2.jar` | `https://repo1.maven.org/maven2/com/microsoft/onnxruntime/onnxruntime/1.19.2/onnxruntime-1.19.2.jar` | `ddab9113a453c0200ac16caf308b76bc8e84653ddc11969983b783dff34397b2` |
| `onnxruntime-node-1.19.2.tgz` | `https://registry.npmjs.org/onnxruntime-node/-/onnxruntime-node-1.19.2.tgz` | `dbd3f1c72e91f783eea3e87b546fb064f75afffbb11a35264656f58eba4c784d` |

Each download was verified against the hash the registry itself publishes: the NuGet flat-container
digest, the Maven `.jar.sha1` (`b54699472d9ead8dc3d58d834457d03b815124a9`), and the npm
`dist.integrity` (`sha512-9eHMP/HKbbeUcqte1JYzaaRC8JPn7ojWeCeoyShO86TOR97OCyIyAIOGX3V95ErjslVhJRXY8Em/caIUc0hm1Q==`).

## Everything else in this archive

`include/`, `LICENSE`, `ThirdPartyNotices.txt`, `Privacy.md` and `README.md` are copied unmodified
from the NuGet package (`build/native/include/` and its root). `VERSION_NUMBER` reads `1.19.2`.
`GIT_COMMIT_ID`, which the original archive carried, is **omitted**: the commit it named is not
recoverable now that the repository is gone, and inventing one would be worse than leaving it out.

## Licence

MIT, Copyright (c) Microsoft Corporation. The upstream `LICENSE` and `ThirdPartyNotices.txt` are
preserved verbatim (`LICENSE` sha256
`c250d6278f0b47a6439fb7592b08b58a55eb9f535aa49a1db63211c3f982b674`).

## Third-party copies

None were used. Re-uploads of the original archives by accounts other than Microsoft's were
deliberately not consulted: a native shared library that our own binary loads at runtime is exactly
what a supply-chain attack targets.
