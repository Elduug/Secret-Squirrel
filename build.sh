#!/bin/zsh
set -euo pipefail
SCRIPT_DIR=${0:A:h}
OUTPUT_DIR=${1:-"$SCRIPT_DIR/dist"}
APP="$OUTPUT_DIR/Secret Squirrel.app"
MODULE_CACHE="$SCRIPT_DIR/.build-cache/module-cache"
mkdir -p "$APP/Contents/MacOS" "$APP/Contents/Resources"
mkdir -p "$MODULE_CACHE"
ANIMAL_LIST="$SCRIPT_DIR/.build-cache/animals.txt"
awk '/static let animals = """/{inside=1; next} /"""\.split/{inside=0} inside{gsub(/^[[:space:]]+/, ""); for(i=1;i<=split($0,a,",");i++) print tolower(a[i])}' "$SCRIPT_DIR/SecretSquirrel.swift" > "$ANIMAL_LIST"
ANIMAL_COUNT=$(wc -l < "$ANIMAL_LIST" | tr -d ' ')
UNIQUE_COUNT=$(sort -u "$ANIMAL_LIST" | wc -l | tr -d ' ')
[[ "$ANIMAL_COUNT" -ge 250 && "$ANIMAL_COUNT" -eq "$UNIQUE_COUNT" ]] || { print -u2 "Vocabulary check failed: $ANIMAL_COUNT animals, $UNIQUE_COUNT unique"; exit 1; }
ADJECTIVE_CHECK=$(awk '/static let adjectives:/{inside=1; next} inside && /^    ]/{inside=0} inside && /: \[/{n=gsub(/\", \"/, "&")+1; keys++; if(n!=10) bad=1} END{print keys ":" bad}' "$SCRIPT_DIR/SecretSquirrel.swift")
[[ "$ADJECTIVE_CHECK" == "26:" ]] || { print -u2 "Vocabulary check failed: expected exactly 10 adjectives for each of 26 letters"; exit 1; }
cp "$SCRIPT_DIR/Assets/AppIcon.png" "$APP/Contents/Resources/AppIcon.png"
cp "$SCRIPT_DIR/Assets/Credits.rtf" "$APP/Contents/Resources/Credits.rtf"
swiftc -target arm64-apple-macosx13.0 -module-cache-path "$MODULE_CACHE" \
  "$SCRIPT_DIR/SecretSquirrel.swift" -O -framework Cocoa -o "$APP/Contents/MacOS/SecretSquirrel"
cp "$SCRIPT_DIR/Info.plist" "$APP/Contents/Info.plist"
SIGNING_IDENTITY=${SIGNING_IDENTITY:--}
if [[ "$SIGNING_IDENTITY" == "-" ]]; then
  codesign --force --deep --sign - "$APP"
else
  codesign --force --deep --options runtime --timestamp --sign "$SIGNING_IDENTITY" "$APP"
fi
ditto -c -k --sequesterRsrc --keepParent "$APP" "$OUTPUT_DIR/Secret-Squirrel-macOS.zip"
print "Built: $APP"
print "Archive: $OUTPUT_DIR/Secret-Squirrel-macOS.zip"
