#!/bin/bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

versions=( "$@" )
if [ ${#versions[@]} -eq 0 ]; then
  versions=( */ )
fi
versions=( "${versions[@]%/}" )


for version in "${versions[@]}"; do
	repoPackage="http://mirrors.aliyun.com/ubuntu/dists/trusty/universe/binary-amd64/Packages.gz"
  fullVersion="$(curl -fsSL "$repoPackage" | gunzip | awk -F ': ' '$1 == "Package" { pkg = $2 } pkg == "apt-cacher" && $1 == "Version" { print $2 }' | grep "$version" | sort -rV | head -n1 )"
  (
    set -x
    sed '
      s/%%APTCACHE_MAJOR%%/'"$version"'/g;
      s/%%APTCACHE_VERSION%%/'"$fullVersion"'/g;
    ' Dockerfile.template > "$version/Dockerfile"
  )
done
