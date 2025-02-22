#!/busybox/sh

set -o errexit
set -o xtrace

cosign version

# Sign all images from 'images' file

cosign sign "$@" $(cat images)

# Sign 'latest' images with cosign
for distro_suffix in "" -debian10 -debian11; do
  cosign sign "$@" gcr.io/$PROJECT_ID/static${distro_suffix}:nonroot
  cosign sign "$@" gcr.io/$PROJECT_ID/static${distro_suffix}:latest
  cosign sign "$@" gcr.io/$PROJECT_ID/static${distro_suffix}:debug-nonroot
  cosign sign "$@" gcr.io/$PROJECT_ID/static${distro_suffix}:debug

  cosign sign "$@" gcr.io/$PROJECT_ID/base${distro_suffix}:nonroot
  cosign sign "$@" gcr.io/$PROJECT_ID/base${distro_suffix}:latest
  cosign sign "$@" gcr.io/$PROJECT_ID/base${distro_suffix}:debug-nonroot
  cosign sign "$@" gcr.io/$PROJECT_ID/base${distro_suffix}:debug

  cosign sign "$@" gcr.io/$PROJECT_ID/cc${distro_suffix}:nonroot
  cosign sign "$@" gcr.io/$PROJECT_ID/cc${distro_suffix}:latest
  cosign sign "$@" gcr.io/$PROJECT_ID/cc${distro_suffix}:debug-nonroot
  cosign sign "$@" gcr.io/$PROJECT_ID/cc${distro_suffix}:debug
done

# python, java and nodejs are debian11 only
cosign sign "$@" gcr.io/$PROJECT_ID/python3-debian11:nonroot
cosign sign "$@" gcr.io/$PROJECT_ID/python3-debian11:latest
cosign sign "$@" gcr.io/$PROJECT_ID/python3-debian11:debug-nonroot
cosign sign "$@" gcr.io/$PROJECT_ID/python3-debian11:debug

for distro_suffix in "" -debian11; do
  cosign sign "$@" gcr.io/$PROJECT_ID/nodejs${distro_suffix}:latest
  cosign sign "$@" gcr.io/$PROJECT_ID/nodejs${distro_suffix}:debug
  cosign sign "$@" gcr.io/$PROJECT_ID/nodejs${distro_suffix}:16
  cosign sign "$@" gcr.io/$PROJECT_ID/nodejs${distro_suffix}:16-debug
done

for java_version in -base 11 17; do
  cosign sign "$@" gcr.io/$PROJECT_ID/java${java_version}-debian11:latest
  cosign sign "$@" gcr.io/$PROJECT_ID/java${java_version}-debian11:nonroot
  cosign sign "$@" gcr.io/$PROJECT_ID/java${java_version}-debian11:debug
  cosign sign "$@" gcr.io/$PROJECT_ID/java${java_version}-debian11:debug-nonroot
done

# these java images tags are deprecated (remove march 31st 2022)
cosign sign "$@" gcr.io/$PROJECT_ID/java-debian11:nonroot
cosign sign "$@" gcr.io/$PROJECT_ID/java-debian11:latest
cosign sign "$@" gcr.io/$PROJECT_ID/java-debian11:debug-nonroot
cosign sign "$@" gcr.io/$PROJECT_ID/java-debian11:debug
