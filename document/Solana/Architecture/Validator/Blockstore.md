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