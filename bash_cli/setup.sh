#!/usr/bin/env bash
name=${PWD##*/}
sed -i "s/bash_cli/$name/g" flake.nix
sed -i "s/bash_cli/$name/g" bin/bash_cli
mv bin/bash_cli "bin/$name"
mv libexec/bash_cli "libexec/$name"
chmod +x "bin/$name"
for f in libexec/* ; do 
	chmod +x $f
	if [ "$(basename $f)" == "$name" ] 
	then 
		continue;
	fi
	mv $f "$(dirname $f)/$name-$(basename $f)"; 
done
rm setup.sh
