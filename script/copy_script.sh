#!/bin/bash

# Kiểm tra xem có truyền tham số vào script không
if [ "$#" -ne 1 ]; then
    echo "Vui lòng cung cấp một tham số là tên thư mục chứa path.txt."
    exit 1
fi

# Đường dẫn tới tệp path.txt
PATH_FILE="./apps/$1/path.txt"

# Kiểm tra xem tệp path.txt có tồn tại không
if [[ ! -f "$PATH_FILE" ]]; then
    echo "Tệp không tồn tại: $PATH_FILE"
    exit 1
fi

# Đọc đường dẫn đích từ tệp path.txt
read -r DESTINATION < "$PATH_FILE"

# Xác định đường dẫn nguồn
SOURCE_DIR="./apps/$1/src"

# Kiểm tra xem thư mục nguồn có tồn tại không
if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "Thư mục nguồn không tồn tại: $SOURCE_DIR"
    exit 1
fi

# Xác định đường dẫn đích src
DESTINATION_SRC="$DESTINATION/src"

# Nếu thư mục src đã tồn tại, xóa nó
if [[ -d "$DESTINATION_SRC" ]]; then
    rm -rf "$DESTINATION_SRC"
    echo "Đã xóa thư mục tồn tại: $DESTINATION_SRC"
fi

# Tạo thư mục đích src mới
mkdir -p "$DESTINATION_SRC"

# Sao chép tất cả các tệp và thư mục từ thư mục nguồn vào thư mục đích src
cp -r "$SOURCE_DIR/"* "$DESTINATION_SRC/"
echo "Đã sao chép tất cả từ $SOURCE_DIR tới $DESTINATION_SRC"
