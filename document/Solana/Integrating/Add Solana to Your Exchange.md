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

 ### Tự động khởi động lại và giám sát

 Bạn lên cấu hình mỗi node của mình khởi động lại mỗi khi thoát, để đảm bảo bạn bỏ lỡ các ít dữ liệu càng tốt. Chạy phần mềm Solana như một hệ thống dịch vụ là một lựa chọn tuyệt vời.

 Để giám sát, chúng tôi cung cấp `solana-watchtower`, cái mà có thể giám sát trình xác thực của bạn và phát hiện với quy trình `solana-validator` là không lành mạnh. Nó có thể được cấu hình trực tiếp để thông báo cho bạn thông qua Slack, Telegram, Discord, hoặc Twillio. Để chi tiết hơn, chạy `solana-watchtower --help`.
```
    solana-watchtower --validator-identity <YOUR VALIDATOR IDENTITY>
```
### Ledger Continuity

Theo mặc định, mỗi một nút của bạn sẽ khởi động từ một snapshot do một trong những trình xác thực đã biết của bạn cung cấp. Snapshot phản ánh trạng thái hiện tại của chuỗi, nhưng không chứa lịch sử hoàn chỉnh của sổ cái. Nếu một trong những nút của bạn thoát ra và khởi động từ một snapshot mới, đó có thể có một khoảng trống trong sổ cái trên nút đó. Để ngăn chặn vấn đề này, cần thêm tham số `--no-snapshot-fetch` vào lệnh `solana-validator` của bạn để nhận dữ liệu sổ cái lịch sử thay vì snapshot.

Không truyền truyền tham số `--no-snapshot-fetch` trong lần khởi động đầu tiên của bạn vì nó là không thể để khởi động nút từ khối gốc. Thay vào đó khởi động từ một snapshot trước và thêm tham số `--no-snapshot-fetch` để khởi động lại
### Minimizing Validator Port Exposure
Trình xác thực yêu cầu mở các cổng UDP và TCP khác nhau cho lưu lượng đến từ tất cả các trình xác thực Solana khác. Mặc dù đây là chế độ hoạt động hiệu quả nhất và rất được khuyến khích, nhưng có thể hạn chế trình xác thực chỉ yêu cầu lưu lượng đến từ một trình xác thực Solana khác.

Đầu tiên hãy thêm đối số `--restricted-repair-only-mode`. Điều này sẽ khiến trình xác thực hoạt động ở chế độ hạn chế, nơi nó sẽ không nhận được các cú hích từ phần còn lại của trình xác thực và thay vào đó sẽ cần liên tục thăm dò ý kiến của các trình xác nhận khác cho các khối. Trình xác thực sẽ chỉ truyền các gói UDP đến các trình xác thực khác bằng các cổng _Gossip_ và _ServeR_ ("phục vụ sửa chữa") và chỉ nhận các gói UDP trên các cổng _Gossip_ và _Repair_ của nó.

Cổng _Gossip_ là hai hướng và cho phép trình xác nhận của bạn tiếp tục liên lạc với phần còn lại của cụm. Trình xác thực của bạn truyền trên _ServeR_ để thực hiện các yêu cầu sửa chữa nhằm lấy các khối mới từ phần còn lại của mạng, vì Turbine hiện đã bị vô hiệu hóa. Trình xác thực của bạn sau đó sẽ nhận được phản hồi sửa chữa trên cổng _Sửa chữa_ từ các trình xác thực khác.

Để hạn chế hơn nữa trình xác thực chỉ yêu cầu khối từ một hoặc nhiều trình xác thực, trước tiên hãy xác định pubkey nhận dạng cho trình xác thực đó và thêm các đối số `--gossip-pull-validator PUBKEY --repair-validator PUBKEY` cho mỗi PUBKEY. Điều này sẽ khiến trình xác thực của bạn tiêu hao tài nguyên trên mỗi trình xác thực mà bạn thêm vào, vì vậy hãy thực hiện điều này một cách tiết kiệm và chỉ sau khi tham khảo ý kiến của trình xác thực mục tiêu.

Trình xác thực của bạn bây giờ chỉ nên giao tiếp với các trình xác thực được liệt kê rõ ràng và chỉ trên các cổng _Gossip_, _Repair_ và _ServeR_.
