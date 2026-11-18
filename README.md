# onnxruntime-mirror

ONNX Runtime 1.19.2 release archives, published here so our apps can keep provisioning the library
they already depend on.

On or about 2026-11-17, `github.com/microsoft/onnxruntime` stopped existing. Not the release, not the
asset, the whole repository: the URL returns 404, authenticated API calls return 404, and there is no
redirect. Microsoft has published no statement about it. Several other repositories went at the same
time, according to reporting we have not independently confirmed.

Two of our projects fetch an archive from that repository at build time.
[matte](https://github.com/artisan-build/matte) downloads one in its `matte:provision-binary`
command, which Laravel Cloud runs as a build step, and
[bg-remover](https://github.com/artisan-build/bg-remover) downloads one inside its Docker build. Both
broke the moment the repository went away. This repository is where they fetch it from now.

## What is in the release

[`v1.19.2`](https://github.com/artisan-build/onnxruntime-mirror/releases/tag/v1.19.2) carries three
archives and a `checksums.txt`, with the same names the upstream release used:

| asset | library it carries | sha256 of the archive |
|---|---|---|
| `onnxruntime-linux-x64-1.19.2.tgz` | `lib/libonnxruntime.so.1` | `995e5fd95f6ad6435440b9dac642420b8222dbc8bfec20cbc3a8a0bd45527b39` |
| `onnxruntime-linux-aarch64-1.19.2.tgz` | `lib/libonnxruntime.so.1` | `2845df751d11cc1afc03e37ccc7ecd8033b08da72a85900390aac5b57663e466` |
| `onnxruntime-osx-arm64-1.19.2.tgz` | `lib/libonnxruntime.1.19.2.dylib` | `f387ed8a9e8475df4b9a0d582ef096fbc7148430702f1f058fff4abea522c6b4` |

Each archive unpacks to a single directory named after the asset, holding `include/`, `lib/`,
`LICENSE`, `ThirdPartyNotices.txt`, `Privacy.md`, `README.md`, `VERSION_NUMBER` and a `PROVENANCE.md`
of its own. That is the upstream layout, so a consumer that read `include/` and `lib/` out of the old
archive needs nothing but a new base URL. The one upstream file we left out is `GIT_COMMIT_ID`: the
commit it named is not recoverable now, and a made-up value would be worse than an absent one.

In `lib/`, the versioned name and the `SONAME` are both present as real files with identical bytes
(`libonnxruntime.so.1.19.2` and `libonnxruntime.so.1`), and `libonnxruntime.so` is a relative symlink.
Microsoft's own `onnxruntime-node` package ships those two names the same way. The macOS archive has
`libonnxruntime.1.19.2.dylib` as the real file, which is also what the dylib's install name says, with
`libonnxruntime.dylib` as a symlink beside it.

## Where the binaries came from

**These archives are not the original files.** No copy of any original `.tgz` was found on a machine
we control, nothing in the composer, npm, uv or system caches held one, and the Wayback Machine has no
snapshot of the asset URL. Byte-equality with what Microsoft published is not claimed anywhere in this
repository.

What we did instead was take the 1.19.2 binaries from the package channels Microsoft still publishes,
and confirm each one against a second, independent Microsoft channel before packaging it. Every binary
here came from NuGet. Every binary here was also found, byte for byte, somewhere else Microsoft
publishes it:

| library | sha256 | from | confirmed against |
|---|---|---|---|
| linux x64 | `9c8139e1856568f068f1cad78fc9798084941db50be7c201a1dbdcfd18105433` | NuGet `Microsoft.ML.OnnxRuntime` 1.19.2, `runtimes/linux-x64/native/libonnxruntime.so` | Maven Central `com.microsoft.onnxruntime:onnxruntime:1.19.2` — identical sha256, identical ELF build-id `38739264209f84cc3fbe7eb4a88f37cbcc5bbdd3` |
| linux aarch64 | `d9abfb42ddd120855f93ccb3c97a0918ac5bef209485db0dc3a36a3d188671ab` | NuGet 1.19.2, `runtimes/linux-arm64/native/libonnxruntime.so` | Maven Central 1.19.2 and npm `onnxruntime-node` 1.19.2 — all three identical in sha256 and in build-id `e092d7cba2e8c461e82b0860fea01a06751cb2b4` |
| osx arm64 | `183dca3132c8f0e2f0a1a30da3bcf7dee634cd6a7d5bf99b47f3d7ffe2791799` | NuGet 1.19.2, `runtimes/osx-arm64/native/libonnxruntime.dylib` | npm `onnxruntime-node` 1.19.2 — identical sha256. Maven Central's copy carries the same Mach-O `LC_UUID` `07CEB81D-1A28-3B95-8660-249D462A450C` and the same byte count, unstripped, so it confirms the build without matching the hash |

Every source package was checked against the hash its own registry publishes: the NuGet
flat-container digest, Maven's `.jar.sha1`, npm's `dist.integrity`. The per-asset `PROVENANCE.md`
inside each archive repeats all of this with the source URLs, and records the candidates we rejected.

A word on the rejected ones, because the absence is informative. PyPI's `onnxruntime==1.19.2` wheels
contain a Linux library with a different build-id and a different size from the one the release
channels ship, so they are a different build of the same version rather than another copy of the same
build; the macOS wheel contains no standalone dylib at all. The npm package's linux x64 binary is
19.2 MB against NuGet's 16.1 MB, a larger build with more execution providers compiled in, so it
confirms aarch64 and macOS but not x64. No third-party re-upload was used or opened. A native shared
library that our own binary loads at runtime is the thing a supply-chain attack goes for, and a
stranger's copy of it is not evidence of anything.

## If you are reading this because your build broke too

You are welcome to fetch these archives, and the hashes above are there so you can check them against
whatever you have. We make no promise to keep this repository around, to add versions, or to answer
issues. It exists for two of our apps. If Microsoft restores the originals, prefer them.

## Rules for this repository

Do not modify a published asset in place. A release that has been downloaded once is a hash somebody
may have written down; correcting it means publishing a new release, not replacing bytes under the
same tag.

Adding a version means doing the same work again: pull the binaries from at least two Microsoft
channels, confirm the hashes agree, record them in a `PROVENANCE.md`, and publish `checksums.txt`
beside the assets.

## Licence

ONNX Runtime is MIT licensed, Copyright (c) Microsoft Corporation. The upstream `LICENSE` and
`ThirdPartyNotices.txt` travel unmodified inside every archive and are copied into this repository as
`LICENSE` and `ThirdPartyNotices.txt`. The packaging work in this repository is MIT too, Copyright (c)
Artisan Build, Inc. We are not affiliated with Microsoft and this is not an official distribution.
