# Provenance — onnxruntime-linux-aarch64-1.19.2

This archive is **not** the original `onnxruntime-linux-aarch64-1.19.2.tgz` published by Microsoft on
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

| | |
|---|---|
| sha256 | `d9abfb42ddd120855f93ccb3c97a0918ac5bef209485db0dc3a36a3d188671ab` |
| size | 13,385,888 bytes |
| ELF build-id | `e092d7cba2e8c461e82b0860fea01a06751cb2b4` |
| primary source | NuGet `Microsoft.ML.OnnxRuntime` 1.19.2, `runtimes/linux-arm64/native/libonnxruntime.so` |
| cross-check | Maven Central 1.19.2 `ai/onnxruntime/native/linux-aarch64/libonnxruntime.so` **and** npm `onnxruntime-node` 1.19.2 `bin/napi-v3/linux/arm64/libonnxruntime.so.1.19.2` — **all three identical in sha256 and build-id** |

Also examined and **not** used: PyPI `onnxruntime==1.19.2` manylinux aarch64 wheel,
`onnxruntime/capi/libonnxruntime.so.1.19.2` — sha256
`4a8b12f35d553899a064ae577dc6d9be44c47a5ba4530ac0cf2e1454e4567afc`, build-id
`58c4293c7db68be47586472ca630e8301d3d5504`, 13,516,952 bytes. A different build of the same version.

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
