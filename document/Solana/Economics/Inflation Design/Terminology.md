### Tổng nguồn cung hiện tại [SOL]
- Tổng số lượng mã thông báo (bị khóa hoặc mở khóa) đã được tạo (thông qua khối nguồn gốc hoặc lạm phát giao thức) trừ đi bất kỳ mã thông báo nào đã bị cháy (thông qua phí giao 
dịch hoặc cơ chế khác) hoặc bị cắt giảm. Khi khởi chạy mạng, 500.000.000 SOL đã được khởi tạo trong khối genesis. Kể từ đó, Tổng nguồn cung hiện tại đã được giảm xuống bằng cách 
đốt phí giao dịch và sự kiện giảm mã thông báo theo kế hoạch. 

### Tỷ lệ lạm phát [%]
- Giao thức Solana sẽ tự động tạo mã thông báo mới theo lịch trình lạm phát được xác định trước (sẽ thảo luận bên dưới). Tỷ lệ lạm phát [%] là tỷ lệ tăng trưởng hàng năm của Tổng 
cung hiện tại tại bất kỳ thời điểm nào.

### Lịch trình lạm phát

- Mô tả xác định về việc phát hành mã thông báo theo thời gian. Quỹ Solana đang đề xuất một Lịch trình lạm phát phi mã. Tức là Lạm phát bắt đầu ở giá trị cao nhất, tỷ lệ giảm dần 
theo thời gian cho đến khi ổn định ở một tỷ lệ lạm phát dài hạn được xác định trước (xem thảo luận bên dưới). Lịch trình này được tham số hóa hoàn toàn và duy nhất bởi ba con số:
  1. Tỷ lệ lạm phát ban đầu [%] : Tỷ lệ lạm phát bắt đầu cho thời điểm lạm phát lần đầu tiên được kích hoạt. Tỷ lệ phát hành token chỉ có thể giảm từ thời điểm này.
  2. Tỷ lệ giảm lạm phát [%] : Tỷ lệ tại đó Tỷ lệ lạm phát được giảm xuống.
  3. Tỷ lệ lạm phát dài hạn [%] : Tỷ lệ lạm phát ổn định, dài hạn được mong đợi.
### Tỷ lệ lạm phát hiệu quả [%]

- Tỷ lệ lạm phát thực sự quan sát được trên mạng Solana sau khi tính đến các yếu tố khác có thể làm giảm Tổng cung hiện tại . Lưu ý rằng không thể tạo mã thông báo ngoài những gì 
được mô tả trong Biểu lạm phát. 
  1. Trong khi Lịch trình lạm phát xác định cách giao thức phát hành SOL, điều này bỏ qua việc loại bỏ đồng thời các mã thông báo trong hệ sinh thái do các yếu tố khác nhau. Cơ 
  chế ghi mã thông báo chính là đốt một phần của mỗi khoản phí giao dịch.50 \%5 0 % của mỗi khoản phí giao dịch được ghi lại, với khoản phí còn lại được giữ lại bởi trình xác thực 
  xử lý giao dịch. 
  2. Các yếu tố khác như mất khóa cá nhân và các sự kiện slashing cũng cần được xem xét trong phân tích tổng thể về Tỷ lệ lạm phát hiệu quả. Ví dụ: người ta ước tính rằng 10-20% 
  trong số tất cả BTC đã bị mất và không thể khôi phục được và các mạng có thể bị tổn thất hàng năm tương tự với tỷ lệ 1-2 %.
### 
