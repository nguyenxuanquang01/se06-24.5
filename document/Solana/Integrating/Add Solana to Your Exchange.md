## Add Solana to Your Exchange

### Node Setup

Bạn nên thiết lập ít nhất là hai nút trên máy tính cao cấp / phiên bản đám mây, nâng cấp lên phiên bản mới hơn ngay lập tức và theo dõi các hoạt động dịch vụ bằng một công cụ giám sát đi kèm.

Những thiết lập này sẽ cho phép bạn có thể:
- Có một cổng tự quản lý vào cụm mainnet-beta của Solana để lấy dữ liệu và gửi các giao dịch rút tiền.
- Có toàn quyền kiểm soát lượng khối dữ liệu lịch sử được lưu giữ.
- Duy trì dịch vụ ngay cả khi có một node lỗi.

Các nút Solana yêu cầu sức mạnh tính toán tương đối cao để xử lí các khối nhanh và TPS cao.

Để chạy một node api:
1. Cài đặt công cụ Solana command-line phù hợp
2. Khởi động trình xác thực với ít nhất các thông số sau:
```
    solana-validator \
    --ledger <LEDGER_PATH> \
    --identity <VALIDATOR_IDENTITY_KEYPAIR> \
    --entrypoint <CLUSTER_ENTRYPOINT> \
    --expected-genesis-hash <EXPECTED_GENESIS_HASH> \
    --rpc-port 8899 \
    --no-voting \
    --enable-rpc-transaction-history \
    --limit-ledger-size \
    --known-validator <VALIDATOR_ADDRESS> \
    --only-known-rpc 
```
Tùy chỉnh `--ledger` cho vị trí lưu trữ số cái mong muốn của bạn, và `--rpc-port` cổng bạn muốn xuất.
Các tham số `--entrypoint` và `--expected-genesis-hash` đều là các tham số xác định cụm thể mà bạn đang tham gia.
 Tham số `--limit-ledger-size` cho phép bạn xác định có bao nhiêu sổ cái đã chia nhỏ mà nút của bạn giữ lại trên đĩa. Nếu bạn không bao gồm tham số này, trình xác thực sẽ giữ toàn bộ sổ cái cho đến khi hết dung lượng đĩa. Giá trí mặc định cố gắng duy trì mức sử dụng đĩa số cái dưới 500GB. Có thể yêu cầu mức sử dụng đĩa nhiều hơn hoặc ít hơn bằng cách thêm đối số vào `--limit-ledger-size` nếu muốn. Kiểm tra `solana- validator --help` để biết giá trị giới hạn mặc định được sử dụng bởi `--limit-ledger-size`.
 
 Việc chỉ định một hoặc nhiều tham số `--known-validator` có thể bảo vệ bạn khỏi việc khởi động từ một ảnh chụp nhanh độc hại.

 Các tham số tùy chọn cần xem xét:
 - `--private-rpc` ngăn không cho cổng RPC của bạn được sử dụng bởi các node khác/
 -  `--rpc ` cho phép bạn chỉ định một địa chỉ IP khác để liên kết cổng RPC.