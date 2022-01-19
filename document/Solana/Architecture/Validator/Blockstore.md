# Blockstore

Sau khi một khối đạt đến độ chính xác, tất cả các khối từ khối đó trở xuống khối gốc tạo thành một chuỗi tuyến tính với tên gọi quen thuộc là blockchain. Tuy nhiên, cho đến thời điểm đó, trình xác thực phải duy trì tất cả các chuỗi hợp lệ tiềm năng, được gọi là fork. Quá trình mà các fork hình thành một cách tự nhiên do sự luân chuyển của người lãnh đạo được mô tả trong quá trình tạo fork. Cấu trúc dữ liệu kho khối được mô tả ở đây là cách trình xác thực đối phó với các nhánh đó cho đến khi các khối được hoàn thiện.

Kho lưu trữ khối cho phép trình xác thực ghi lại mọi mẩu tin mà nó quan sát được trên mạng, theo bất kỳ thứ tự nào, miễn là mẩu tin đó được ký bởi người lãnh đạo dự kiến ​​cho một vị trí nhất định

Các mảnh vụn được di chuyển đến một không gian khóa có thể phân nhánh `leader slot` + `shred inidex`. Điều này cho phép cấu trúc danh sách bỏ qua của giao thức Solana được lưu trữ toàn bộ, mà không cần phải lựa chọn trước cái fork nào sẽ tuân theo, Entries nào sẽ tồn tại hoặc khi nào thì duy trì chúng.

Yêu cầu sửa chữa đối với các mẩu tin vụn gần đây được cung cấp hết RAM hoặc các tệp gần đây và hết bộ nhớ sâu hơn đối với các mẩu tin nhỏ gần đây hơn, như được thực hiện bởi cửa hàng hỗ trợ Blockstore.

## Functionalities of Blockstore

1. Persistence: Blockstore nằm ở phía trước xác minh các nút đường ống dẫn, ngay sau quá trình nhận mạng và xác minh chữ ký. Nếu mảnh vụn nhận được phù hợp với lịch trình của người lãnh đạo (tức là đã được ký bởi lãnh đạo cho vị trí được chỉ định), nó được lưu trữ ngay lập tức

2. Repair: Sửa chữa giống như sửa chữa cửa sổ ở trên, nhưng có thể phục vụ bất kỳ đã được cắt nhỏ đã được nhận. Các cửa hàng Blockstore chia nhỏ với chữ ký, bảo tồn chuỗi duyên khởi.

3. Forks: Blockstore hỗ trợ truy cập ngẫu nhiên các mảnh vụn, vì vậy có thể hỗ trợ trình xác thực cần phải quay lại và phát lại từ điểm kiểm tra của Ngân hàng.

4. Restart: Với việc cắt tỉa / chọn lọc thích hợp, Blockstore có thể được phát lại bằng cách liệt kê theo thứ tự các mục nhập từ vị trí 0. Logic của giai đoạn phát lại (nghĩa là giao dịch với các nhánh) sẽ phải được sử dụng cho các mục nhập gần đây nhất trong các Blockstore.

## Blockstore Design

1. Các mục nhập trong Blockstore được lưu trữ dưới dạng các cặp khóa-giá trị, trong dó khóa là chỉ mục vị trí được ghép nối và chỉ mục cắt nhỏ cho một mục nhập và giá trị là dữ liệu mục nhập. Ghi chú các chỉ mục được cắt nhỏ dựa trên 0 cho mỗi vị trí(tức là chúng tương đối với ví trị)

2. Blockstore duy trì siêu dữ liệu cho từng vị trí, trong cấu trúc `SlotMeta` có chứa:
- `slot_index` Chỉ mục của vị trí này.
- `num_blocks` Số lượng khối trong một vị tris (được sử dụng để liên kết với một vị trí trước đó).
- `consumed` Chỉ số băn nhỏ cao nhất `n`, sao cho với mọi `m < n`, tồn tại một mục băm nhỏ trong vị trí này với chỉ số băm nhỏ bằng `n` (tức là chỉ số băm nhỏ liên tiếp cao nhất).
- `received` Chỉ số băm nhỏ nhận được cao nhất cho vị trí
- `next_slot` Danh sách các vị trí trong tương lai mà vị trí này có thể kết nối với nhau. Được sử dụng khi xây dựng lại sổ cái để tìm các điểm rẽ nhánh có thể có.
- `last_index`  Chỉ mục của mảnh vụn được gắn cờ là mảnh vụn cuối cùng cho vị trí này. Cờ này trên máy cắt nhỏ sẽ được người dẫn đầu đặt cho một vị trí khi họ đang truyền lá cờ cuối cùng cho một vị trí.
- `is_connected` True iff mọi khối từ 0 ... slot tạo thành một chuỗi đầy đủ mà không có bất kỳ lỗ nào. Chúng ta có thể lấy được is_connected cho mỗi vị trí với các quy tắc sau. Gọi slot (n) là slot có chỉ số `n` và slot (n) .is_full () là true nếu slot có chỉ số `n` có tất cả các tick được mong đợi cho slot đó. Đặt is_connected (n) là câu lệnh rằng "slot (n) .is_connected là true". Sau đó:
is_connected(0) is_connected(n+1) iff (is_connected(n) and slot(n).is_full()

3. Chaining - Khi một phần nhỏ cho một vị trí `x` mới đến, chúng tôi kiểm tra số lượng khối (`num_blocks`) cho vị trí mới đó (thông tin này được mã hóa trong phần nhỏ). Sau đó, chúng tôi biết rằng chuỗi vị trí mới này sẽ chuyển sang vị trí `x - num_blocks`.

4. Subcriptions - Blockstore ghi lại một tập hợp các vị trí đã được "đăng ký". Điều này có nghĩa là các mục nhập liên kết với các vị trí này sẽ được gửi trên kênh Blockstore để tiêu thụ bởi ReplayStage. Xem các  `Blockstore APIs` để biết thêm chi tiết.

5. Update notifications - Blockstore thông báo cho người nghe khi slot (n) .is_connected được chuyển từ false thành true cho bất kỳ `n` nào.