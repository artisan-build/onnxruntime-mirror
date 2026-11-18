# Provenance — onnxruntime-osx-arm64-1.19.2

This archive is **not** the original `onnxruntime-osx-arm64-1.19.2.tgz` published by Microsoft on
GitHub. That repository (`github.com/microsoft/onnxruntime`) was removed on or about 2026-11-17 and
its release assets are no longer retrievable. No copy of the original archive was found on any machine
we control, and no Wayback Machine snapshot of the asset URL exists.

This archive was **repackaged on 2026-11-18** from ONNX Runtime 1.19.2 binaries that Microsoft still
publishes through its other official package channels, by Artisan Build, Inc., for
`artisan-build/onnxruntime-mirror`. Byte-equality with the original archive is **not** claimed. What
is claimed, and recorded below, is that every binary in it came from a Microsoft-published 1.19.2
package and was confirmed against at least one second, independent Microsoft channel.

## Library in this archive

`lib/libonnxruntime.1.19.2.dylib` (`lib/libonnxruntime.dylib` is a
relative symlink to it). The Mach-O `LC_ID_DYLIB` install name is `@rpath/libonnxruntime.1.19.2.dylib`,
which is the filename this archive uses. The slice is `arm64` only, as the original archive's was.

| | |
|---|---|
| sha256 | `183dca3132c8f0e2f0a1a30da3bcf7dee634cd6a7d5bf99b47f3d7ffe2791799` |
| size | 26,090,520 bytes |
| Mach-O LC_UUID | `07CEB81D-1A28-3B95-8660-249D462A450C` |
| primary source | NuGet `Microsoft.ML.OnnxRuntime` 1.19.2, `runtimes/osx-arm64/native/libonnxruntime.dylib` |
| cross-check | npm `onnxruntime-node` 1.19.2, `bin/napi-v3/darwin/arm64/libonnxruntime.1.19.2.dylib` — **identical sha256**. Maven Central 1.19.2 `ai/onnxruntime/native/osx-aarch64/libonnxruntime.dylib` carries the **same LC_UUID and the same byte count** but is not byte-identical (201,535 bytes differ, in the symbol table and the code signature): the jar ships that copy unstripped, alongside its `.dSYM`. Same compile, different stripping — a third channel confirming the build identity. |

The PyPI macOS wheel offers no candidate: `onnxruntime-1.19.2-cp3xx-macosx_11_0_universal2.whl`
contains no standalone `libonnxruntime` dylib at all — the runtime is linked into
`onnxruntime/capi/onnxruntime_pybind11_state.so`.

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
