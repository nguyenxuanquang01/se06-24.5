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

### Setting up Deposit Accounts

Tài khoản Solana không yêu cầu bất kì khởi tạo trên chuỗi nào; một khi chúng chứa một vài SOL, chúng tồn tại. Để thiết lập một tài khoản gửi tiền cho sàn giao dịch của bạn, chỉ cần tạo cặp khóa Solana bằng bất kỳ công cụ ví nào của họ.

Chúng ta lên sử dụng một tài khoản gửi tiền duy nhất cho mỗi người dùng.

Tài khoản Solana được tính tiền thuê khi tạo và một lần cho mỗi thời kì, nhưng chúng có thể được miễn phí tiền thuê nếu chún có giá trị thuê 2 năm trong Solana. Để tìm số dư tối thiểu để được miễn thuê cho tài khoản tiền gửi của bạn. Hãy truy vấn bằng dòng này:
```
getMiniumBalanceForRentExemption

curl -X POST -H "Content-Type: application/json" -d '{"jsonrpc": "2.0","id":1,"method":"getMinimumBalanceForRentExemption","params":[0]}' localhost:8899

{"jsonrpc":"2.0","result":890880,"id":1}
```

#### Offline Accounts

Bạn có thể muốn giữ khóa của một hoặc nhiều tài khoản thu tiền ngoại tuyến để bảo mật cao hơn. Nếu vậy, bạn sẽ cần chuyển phải chuyển SOL sang các tài khoản nóng bằng các phương pháp ngoại tuyến của họ.

### Listening for Deposits

Khi người dùng muốn gửi SOL vào sàn giao dịch của bạn, hãy hướng dẫn họ gửi một khoản đến một địa chỉ gửi tiền thích hợp.

#### Poll for Blocks

Để theo dõi tất cả các tài khoản tiền gửi cho sàn giao dịch của bạn, hãy thăm dò ý kiến cho từng khối được xác nhận và kiểm tra các địa chỉ quan tâm, sử dụng dịch vụ JSON-RPC của nút Solana API của bạn.

- Để xác định khổi nào có sẵn, hãy gửi yêu cầu `getConfirmedBlocks`, chuyển khối cuối cùng mà bạn đã xử lý làm tham số vị trí bắt đầu:
```
curl -X POST -H "Content-Type: application/json" -d '{"jsonrpc": "2.0","id":1,"method":"getConfirmedBlocks","params":[5]}' localhost:8899

{"jsonrpc":"2.0","result":[5,6,8,9,11],"id":1}
```
Không phải mọi vị trí đều tạo ra một khối, vì vậy có thể có khoảng trống trong dãy số nguyên.
- Đối với mỗi khối, để yêu cầu nội dung của nó, với yêu cầu getConfirmedBlock:
```
curl -X POST -H "Content-Type: application/json" -d '{"jsonrpc": "2.0","id":1,"method":"getConfirmedBlock","params":[5, "json"]}' localhost:8899

{
  "jsonrpc": "2.0",
  "result": {
    "blockhash": "2WcrsKSVANoe6xQHKtCcqNdUpCQPQ3vb6QTgi1dcE2oL",
    "parentSlot": 4,
    "previousBlockhash": "7ZDoGW83nXgP14vnn9XhGSaGjbuLdLWkQAoUQ7pg6qDZ",
    "rewards": [],
    "transactions": [
      {
        "meta": {
          "err": null,
          "fee": 5000,
          "postBalances": [
            2033973061360,
            218099990000,
            42000000003
          ],
          "preBalances": [
            2044973066360,
            207099990000,
            42000000003
          ],
          "status": {
            "Ok": null
          }
        },
        "transaction": {
          "message": {
            "accountKeys": [
              "Bbqg1M4YVVfbhEzwA9SpC9FhsaG83YMTYoR4a8oTDLX",
              "47Sbuv6jL7CViK9F2NMW51aQGhfdpUu7WNvKyH645Rfi",
              "11111111111111111111111111111111"
            ],
            "header": {
              "numReadonlySignedAccounts": 0,
              "numReadonlyUnsignedAccounts": 1,
              "numRequiredSignatures": 1
            },
            "instructions": [
              {
                "accounts": [
                  0,
                  1
                ],
                "data": "3Bxs3zyH82bhpB8j",
                "programIdIndex": 2
              }
            ],
            "recentBlockhash": "7GytRgrWXncJWKhzovVoP9kjfLwoiuDb3cWjpXGnmxWh"
          },
          "signatures": [
            "dhjhJp2V2ybQGVfELWM1aZy98guVVsxRCB5KhNiXFjCBMK5KEyzV8smhkVvs3xwkAug31KnpzJpiNPtcD5bG1t6"
          ]
        }
      }
    ]
  },
  "id": 1
}
```
Các trường `preBalances` và `postBalance` cho phép bạn kiểm tra thay đổi số dư trong mỗi tài khoản mà không cần phân tích cú pháp toàn bộ giao dịch. Họ liệt kê số dư đầu và cuối của mỗi tài khoản trong lamports, được lập chỉ mục vào danh sách `accountKeys`. Ví dụ, địa chỉ tiền gửi nếu lãi suất là `47Sbuv6jL7CViK9F2NMW51aQGhfdpUu7WNvKyH645Rfi`, giao dịch này đại diện cho một sự chuyển nhượng của 218099990000-207099990000 = 11000000000 lamports = 11 SOL

Nếu bạn cần thêm thông tin về kiểu giao dịch hoặc các chi tiết cụ thể khác, bạn có thể yêu cầu khối từ RPC ở định dạng nhị phân, và phân tích cú pháp nó bằng cách sử dụng SDK Rust hoặc SDK Javascript của họ.
