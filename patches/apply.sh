#!/bin/bash
# Re-apply local framework patches after repo sync (skips patches already in history).
cd /mnt/build/evox || exit 1
for pair in frameworks_base:frameworks/base frameworks_av:frameworks/av; do
  d=${pair%%:*}; path=${pair#*:}
  for f in /mnt/build/evox/device/oneplus/astonc/patches/$d/*.patch; do
    subj=$(git mailinfo /dev/null /dev/null < "$f" | sed -n 's/^Subject: //p' | head -1)
    if [ -z "$subj" ]; then echo "NOSUBJ   $f"; break; fi
    if git -C $path log -n 400 --fixed-strings --grep="$subj" --format=%h | grep -q .; then
      echo "skip     $subj"; continue
    fi
    if git -C $path am -3 --quiet "$f"; then echo "applied  $subj"
    else git -C $path am --abort 2>/dev/null; echo "FAILED   $f  (fix by hand: git -C $path am -3 $f)"; break; fi
  done
done
