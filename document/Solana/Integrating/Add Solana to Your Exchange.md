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
``` solana-validator \
    --ledger <LEDGER_PATH> \
    --identity <VALIDATOR_IDENTITY_KEYPAIR> \
    --entrypoint <CLUSTER_ENTRYPOINT> \
    --expected-genesis-hash <EXPECTED_GENESIS_HASH> \
    --rpc-port 8899 \
    --no-voting \
    --enable-rpc-transaction-history \
    --limit-ledger-size \
    --known-validator <VALIDATOR_ADDRESS> \
    --only-known-rpc ```