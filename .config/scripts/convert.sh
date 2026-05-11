#!/bin/bash

# --- 設定項目 ---
THEME_NAME="marp-theme.css"
CONFIG_NAME=".marprc.yml"

# VS Codeから渡される環境変数
TARGET_FILE="${ACTIVE_FILE}"
WS_ROOT="${WORKSPACE_FOLDER}"

echo "--- Marp Export Process Started ---"

# --- 1. ターゲットファイルの選定 ---
# アクティブファイルが .md 以外の場合、最新のファイルを検索
if [[ -z "$TARGET_FILE" || "$TARGET_FILE" != *.md ]]; then
  echo "Current file is not Markdown. Searching for the latest updated .md in workspace..."

  # 隠しフォルダを除外して検索
  # 更新日時(%T@)でソートして、最新の1件を取得
  LATEST_MD=$(find "$WS_ROOT" -type f -name "*.md" \
    -not -path "*/.*" \
    -printf '%T@ %p\n' 2>/dev/null | sort -rn | head -1 | cut -f2- -d" ")

  if [ -z "$LATEST_MD" ]; then
    echo "Error: No Markdown files found in the workspace."
    exit 1
  fi

  TARGET_FILE="$LATEST_MD"
  echo "Selected latest file: $(basename "$TARGET_FILE")"
else
  echo "Selected active file: $(basename "$TARGET_FILE")"
fi

# --- 2. 各種パスの確定 ---
FILE_DIR=$(dirname "$TARGET_FILE")
FILE_NAME_NO_EXT=$(basename "$TARGET_FILE" .md)
OUTPUT_PDF="$FILE_DIR/$FILE_NAME_NO_EXT.pdf"

# .marprc.yml の決定
if [ -f "$FILE_DIR/$CONFIG_NAME" ]; then
  CONFIG_PATH="$FILE_DIR/$CONFIG_NAME"
elif [ -f "$WS_ROOT/.config/$CONFIG_NAME" ]; then
  CONFIG_PATH="$WS_ROOT/.config/$CONFIG_NAME"
else
  echo "Error: $CONFIG_NAME not found in local or .config/"
  exit 1
fi

# marp-theme.css の決定
if [ -f "$FILE_DIR/$THEME_NAME" ]; then
  CSS_PATH="$FILE_DIR/$THEME_NAME"
elif [ -f "$WS_ROOT/.config/$THEME_NAME" ]; then
  CSS_PATH="$WS_ROOT/.config/$THEME_NAME"
else
  echo "Error: $THEME_NAME not found in local or .config/"
  exit 1
fi

# --- 3. Marp CLI の実行 ---
echo "Target: $TARGET_FILE"
echo "Config: $CONFIG_PATH"
echo "Theme:  $CSS_PATH"
echo "Output: $OUTPUT_PDF"
echo "-----------------------------------"

marp "$TARGET_FILE" \
  --config "$CONFIG_PATH" \
  --theme "$CSS_PATH" \
  --allow-local-files \
  -o "$OUTPUT_PDF"

# 実行結果の判定
if [ $? -eq 0 ]; then
  echo "-----------------------------------"
  echo "Success! PDF has been generated."
else
  echo "-----------------------------------"
  echo "Error: Marp conversion failed."
  exit 1
fi
