### Overview
- Các nút thay phiên nhau dẫn đầu và tạo ra PoH mã hóa các thay đổi trạng thái. Cụm có thể chịu đựng sự mất kết nối với bất kỳ người lãnh đạo nào bằng cách tổng hợp những gì người
lãnh đạo sẽ tạo ra nếu nó được kết nối nhưng không nhập vào bất kỳ thay đổi trạng thái nào. Do đó, số lượng nhánh có thể được giới hạn trong danh sách bỏ qua "there / not-there" 
có thể phát sinh trên các ranh giới vị trí xoay vòng của nhà lãnh đạo. Tại bất kỳ vị trí nhất định nào, chỉ giao dịch của một nhà lãnh đạo duy nhất sẽ được chấp nhận.

### Message Flow
1. Các giao dịch được nhập bởi người lãnh đạo hiện tại.
2. Lãnh đạo lọc các giao dịch hợp lệ.
3. Lãnh đạo thực hiện các giao dịch hợp lệ cập nhật trạng thái của nó.
4. Nhà lãnh đạo đóng gói các giao dịch thành các mục dựa trên khe PoH hiện tại của nó.
5. Thủ lĩnh truyền các mục nhập đến các nút trình xác thực ( trong các mẩu tin đã ký )
- Luồng PoH bao gồm ticks; các mục nhập trống cho biết khả năng sống của người lãnh đạo và thời gian trôi qua trên cụm.
- Luồng của người lãnh đạo bắt đầu với các mục đánh dấu cần thiết để hoàn thành PoH trở lại vị trí lãnh đạo trước đó được quan sát gần đây nhất của người lãnh đạo.
6. Trình xác thực truyền lại các mục nhập cho các đồng nghiệp trong tập hợp của chúng và tới các nút hạ lưu xa hơn.
7. Trình xác thực xác thực các giao dịch và thực hiện chúng trên trạng thái của chúng.
8. Trình xác thực tính toán băm của trạng thái.
9. Vào những thời điểm cụ thể, tức là số lần đánh dấu PoH cụ thể, người xác nhận sẽ truyền phiếu bầu cho người lãnh đạo.
- Phiếu bầu là chữ ký của băm của trạng thái được tính toán tại số lần đánh dấu PoH đó.
- Các phiếu bầu cũng được tuyên truyền thông qua các câu chuyện phiếm.
10. Người lãnh đạo thực hiện các phiếu bầu, giống như bất kỳ giao dịch nào khác và phát chúng đến cụm.
11. Người xác nhận quan sát các phiếu bầu của họ và tất cả các phiếu bầu từ nhóm.

### Partitions, Forks
- Forks có thể phát sinh ở số lần đánh dấu PoH tương ứng với một phiếu bầu. Người lãnh đạo tiếp theo có thể đã không quan sát vùng bỏ phiếu cuối cùng và có thể bắt đầu vùng của họ
với các mục PoH ảo đã tạo. Các tick trống này được tạo bởi tất cả các nút trong cụm với tốc độ được định cấu hình theo cụm cho các hashes/per/tick đánh dấu Z.
- Chỉ có hai phiên bản PoH khả thi trong thời gian biểu quyết: PoH có tích Tvà mục nhập do người dẫn đầu hiện tại tạo ra hoặc PoH chỉ với sticks. Phiên bản "just sticks" của 
PoH có thể được coi là một sổ cái ảo, một sổ cái mà tất cả các nút trong cụm có thể lấy được từ lần đánh dấu cuối cùng trong vị trí trước đó.
- Người xác nhận có thể bỏ qua fork ở các điểm khác ( ví dụ: từ người lãnh đạo sai ) hoặc cắt bỏ người lãnh đạo chịu trách nhiệm về đợt fork.
- Người xác nhận bỏ phiếu dựa trên sự lựa chọn tham lam để tối đa hóa phần thưởng của họ.

#### Validator's View

##### Time Progression

Sơ đồ bên dưới thể hiện chế độ xem của trình xác thực về luồng PoH với các nhánh có thể có theo thời gian. L1, L2, v.v. là các vị trí của nhà lãnh đạo và Es đại diện cho các mục nhập từ vị trí lãnh đạo đó trong vị trí của nhà lãnh đạo đó. Các xs chỉ biểu thị dấu tích và thời gian chảy xuống trong biểu đồ.

![](https://github.com/nguyenxuanquang01/se06-24.5/blob/master/document/Solana/images/image1.JPG)

Lưu ý rằng chữ E xuất hiện trên 2 ngã ba tại cùng một vị trí là một điều kiện có thể tháo rời, vì vậy người xác thực quan sát E3 và E3 'có thể gạch chéo L3 và chọn x một cách an toàn cho vị trí đó. Sau khi trình xác thực cam kết một fork, các fork khác có thể bị loại bỏ dưới số lần đánh dấu đó. Đối với bất kỳ vị trí nào, người xác nhận chỉ cần xem xét một chuỗi "có mục nhập" hoặc chuỗi "chỉ tích tắc" được đề xuất bởi người lãnh đạo. Nhưng nhiều mục nhập ảo có thể chồng chéo lên nhau khi chúng liên kết trở lại vị trí trước đó.

##### Time Division

Sẽ rất hữu ích khi coi việc xoay vòng của người lãnh đạo đối với số lần đánh dấu PoH là sự phân chia thời gian của công việc mã hóa trạng thái cho cụm. Bảng sau đây trình bày cây nĩa ở trên dưới dạng một sổ cái phân chia theo thời gian.

![](https://github.com/nguyenxuanquang01/se06-24.5/blob/master/document/Solana/images/image2.JPG)

Lưu ý rằng chỉ dữ liệu từ người dẫn đầu L3 mới được chấp nhận trong thời điểm người dẫn đầu L3. Dữ liệu từ L3 có thể bao gồm các tick "bắt kịp" quay trở lại một vị trí khác ngoài L2 nếu L3 không quan sát dữ liệu của L2. Truyền của L4 và L5 bao gồm các mục PoH "tích tắc để chiếm ưu thế".

Sự sắp xếp các luồng dữ liệu mạng này cho phép các nút lưu chính xác thông tin này vào sổ cái để phát lại, khởi động lại và các điểm kiểm tra.