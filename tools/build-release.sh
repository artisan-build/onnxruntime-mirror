#!/bin/bash
set -euo pipefail
W=/private/tmp/claude-501/-Users-edgrosvenor-Herd-brain/8cc233f8-86d2-408a-ac0e-40e807f536ad/scratchpad/onnx
NU="$W/nuget/x"
B="$W/build"; OUT="$W/out"
rm -rf "$B" "$OUT"; mkdir -p "$B" "$OUT"
V=1.19.2
NUPKG_SHA=$(shasum -a 256 "$W/nuget/mlort.nupkg" | awk '{print $1}')

mk () {
  local name="$1" srclib="$2" realname="$3" linkname="$4" extra="$5"
  local d="$B/$name"
  mkdir -p "$d/lib" "$d/include"
  cp "$NU/build/native/include/"*.h "$d/include/"
  cp "$NU/LICENSE" "$NU/ThirdPartyNotices.txt" "$NU/Privacy.md" "$NU/README.md" "$d/"
  printf '%s\n' "$V" > "$d/VERSION_NUMBER"
  cp "$srclib" "$d/lib/$realname"
  chmod 0755 "$d/lib/$realname"
  if [ -n "$linkname" ]; then cp "$srclib" "$d/lib/$linkname"; chmod 0755 "$d/lib/$linkname"; fi
  if [ -n "$extra" ]; then cp "$extra" "$d/lib/"; fi
  echo "$d"
}

# linux x64: real files libonnxruntime.so.1 AND libonnxruntime.so.1.19.2, plus providers_shared
mk "onnxruntime-linux-x64-$V" "$NU/runtimes/linux-x64/native/libonnxruntime.so" \
   "libonnxruntime.so.1" "libonnxruntime.so.$V" "$NU/runtimes/linux-x64/native/libonnxruntime_providers_shared.so" >/dev/null
ln -s "libonnxruntime.so.1" "$B/onnxruntime-linux-x64-$V/lib/libonnxruntime.so"

mk "onnxruntime-linux-aarch64-$V" "$NU/runtimes/linux-arm64/native/libonnxruntime.so" \
   "libonnxruntime.so.1" "libonnxruntime.so.$V" "$NU/runtimes/linux-arm64/native/libonnxruntime_providers_shared.so" >/dev/null
ln -s "libonnxruntime.so.1" "$B/onnxruntime-linux-aarch64-$V/lib/libonnxruntime.so"

mk "onnxruntime-osx-arm64-$V" "$NU/runtimes/osx-arm64/native/libonnxruntime.dylib" \
   "libonnxruntime.$V.dylib" "" "" >/dev/null
ln -s "libonnxruntime.$V.dylib" "$B/onnxruntime-osx-arm64-$V/lib/libonnxruntime.dylib"

echo "NUPKG_SHA=$NUPKG_SHA"
ls -R "$B" | head -60
