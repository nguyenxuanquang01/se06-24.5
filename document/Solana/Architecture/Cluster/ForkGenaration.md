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
- 
