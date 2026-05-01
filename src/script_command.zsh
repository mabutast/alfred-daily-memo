TARGET_DIR="${SAVE_PATH:-$HOME/Desktop}"
mkdir -p "$TARGET_DIR"

FILENAME="$(date +%Y%m%d).md"
FILEPATH="${TARGET_DIR}/${FILENAME}"

TIMESTAMP=$(date +%H:%M:%S)
INPUT="$1"

# ファイルが存在する場合の処理
if [ -f "$FILEPATH" ]; then
    # 既存内容 + 改行×2 + タイムスタンプ + 改行 + 追記内容
    printf "\n\n$TIMESTAMP\n$INPUT" >> "$FILEPATH"
else
    # 新規作成時はタイムスタンプと内容のみ
    printf "$TIMESTAMP\n$INPUT" > "$FILEPATH"
fi

# ファイルを開く
open "$FILEPATH"

# 通知用に出力
echo "Saved and Opened: $INPUT"