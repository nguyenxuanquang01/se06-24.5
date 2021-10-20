// Solidity.
// Thư Viện Azure Blockchain Workbench

# Hợp đồng thông minh

### Hợp đồng thông minh là gì

Smart Contract (Hợp Đồng Thông Minh) là một thuật ngữ mô tả một bộ giao thức đặc biệt có khả năng tự động thực hiện các điều khoản, các thoả thuận giữa các bên trong hợp đồng (ở trường hợp này là các hệ thống máy tính) nhờ sự hỗ trợ của công nghệ Blockchain.

Toàn bộ hoạt động của Smart Contract được thực hiện một cách tự động và không có sự can thiệp từ bên ngoài, hay thông qua một bên thứ ba trung gian. Những giao dịch được thực hiện bằng các hợp đồng thông minh rất minh bạch, có thể dễ dàng truy xuất được và không thể bị can thiệp hoặc đảo chiều. Các điều khoản trong Smart Contract tương đương với một hợp đồng có pháp lý và được ghi lại dưới ngôn ngữ của lập trình.

### Hợp đồng hoạt động như thế nào

Hợp đồng thông minh hoạt động như một chương trình tất định. Nó thực thi một tác vụ cụ thể trong trường hợp thỏa mãn các điều kiện nhất định. Do đó hợp đồng thông minh tuân theo các câu lệnh "nếu... thì...". Trên mạng Ethereum, hợp đồng thông minh chịu trách nhiệm thực thi và quả lí các hoạt động diễn ra trên blockchain. Về cơ bản, hợp đồng thông minh Ethereum bao gồm một mã hợp đồng và hai khóa công khai. Khóa công khai thứ nhất là khóa do người tạo hợp đồng cung cấp. Khóa còn lại đại diện cho chính hợp đồng, khóa này có vài trò như một mã định danh kỹ thuật số duy nhất cho mỗi hợp đồng thông minh.

### Ví dụ về hợp đồng thông minh

Giả dụ bạn muốn thuê một căn hộ từ tôi. Bạn có thể trả tiền thuê nhà bằng tiền điện tử qua Blockchain. Sau đó biên nhận sẽ được đưa vào một bản hợp đồng thông minh của chúng tôi; Tôi sẽ đưa bạn mật mã vào căn hộ vào một ngày nhất định. Nếu mật mã đó không đến đúng thời hạn giữa 2 bên thống nhất, hợp đồng thông minh sẽ trả lại tiền. Nếu nó đến trước hạn, hệ thống sẽ giữ lại cả tiền và mật mã cho đến kì hạn. Hệ thống hoạt động dựa trên mệnh đề “If – Then” và được giám sát bởi hàng trăm người, vì vậy sẽ không thể có lỗi sai xảy ra trong việc giao nhận.

### Lợi ích của smartcontract

- **Tự do** : Không bị một cơ quan nào quả lí
- **Phân tán** : Hợp đồng thông minh được sao chép và phân phối trong tất cả các nút của mạng Ethereum. Đây là một điểm khác biệt so với các giải pháp khác dựa trên các máy chủ tập trung.
- **Tất định** : Hợp đồng thông minh chỉ thực hiện các hành động mà chúng được thiết kế để thực hiện trong trường hợp các điều kiện được thỏa mãn. Bên cạnh đó, các kết quả của hợp đồng thông minh không đổi dù người thực hiện là ai.
- **Tự động** : Hợp đồng thông minh có thể tự động hóa tất cả các loại tác vụ, nó hoạt động như một chương trình tự thực hiện. Tuy nhiên, trong hầu hết các trường hợp, nếu hợp đồng thông minh không được kích hoạt, nó sẽ duy trì trạng thái “không hoạt động” và sẽ không thực hiện bất kỳ hành động nào.
- **Không thể thay đổi** : Không thể sửa đổi hợp đồng thông minh sau khi triển khai. Chỉ có thể “xóa” chúng nếu chức năng này đã được thêm vào từ trước. Do đó, có thể nói rằng hợp đồng thông minh giống như một mã chống giả mạo.
- **Có thể tùy chỉnh** : Trước khi triển khai, hợp đồng thông minh có thể được mã hóa theo nhiều cách khác nhau. Vì vậy, chúng có thể được sử dụng để tạo ra nhiều loại ứng dụng phi tập trung (Dapp). Điều này là bởi Ethereum là một blockchain có thể được sử dụng để giải quyết bất kỳ vấn đề tính toán nào (Turing complete).
- **Không cần dựa trên sự tin cậy** : Hai hoặc nhiều bên của hợp đồng có thể tương tác thông qua hợp đồng thông minh mà không cần biết hoặc tin tưởng lẫn nhau. Ngoài ra, công nghệ blockchain đảm bảo tính chính xác của dữ liệu.
- **Minh bạch** : Vì các hợp đồng thông minh dựa trên một blockchain công khai, không ai có thể thay đổi mã nguồn của chúng, mặc dù bất kỳ ai cũng có thể xem được.

### Nhược điểm của Smart Contract

- **Tính pháp** : Bạn sẽ không được bảo vệ quyền lợi khi xảy ra lỗi phát sinh do pháp luật các nước hiện nay chưa có chính sách để khai thác, quản lý smart contract.
- **Chi phí triển khai** : Cần chi trả cho hệ thống cơ sở hạ tầng, máy tính, và các lập trình viên giỏi để họ triển khai.
- **Rủ ro từ Internet** : Bản chất của Smart Contract là rất an toàn, nhưng nếu bạn để lộ một số thông tin nhạy cảm hoặc bị các hacker khai thác các thông tin đó thì chắc chắn sẽ gặp những trường hợp rắc rối.

### Để tạo lên một Smart Contract cần những gì ?

- **Chủ thể hợp đồng** : Smart Contract phải được cấp khả năng truy cập đến sản phẩm/dịch vụ liệt kê trong hợp đồng để có thể tự động khóa hay mở khóa chúng.
- **Chữ kí điện tử** : Tất cả các bên tham gia vào Smart Contract đều phải đồng ý triển khai thỏa thuận bằng các khóa cá nhân (chữ kí điện tử) của họ.
- **Điều khoản hợp đồng** : Điều khoản trong Smart Contract có dạng là một chuỗi các hoạt động. Và các bên tham gia hợp đồng đều phải ký chấp nhận nó.
- \*_Nền tảng phần quyền_ : Smart Contract sau khi hoàn tất sẽ được tải lên Blockchain của nền tảng phân quyền tương ứng và được phân phối về cho các node của nền tảng ấy.

# Solidity

- Là ngôn ngữ lập trình cấp cao, hướng đối tượng được sử dụng để viết ra các Smart Constract dựa trên công nghệ Blockchain
- Smart Constract chạy trên máy ảo Ethereum (Ethereum Virtal Machine)
- Là một ngôn ngữ ngoặc nhọn, và Solidity bị ảnh hưởng nhiều bởi các ngôn ngữ lập trình như Python, C++ hay JavaScript
- Một số ứng dụng phổ biến của Solidity như là : Đấu giá sản phẩm, Bỏ phiếu, Huy động vốn, Tiền ảo,...
- EVM (Ethereum Virtal Machine) Là môi trường thời gian chạy các Smart Constract trong Ethereum
- Constract trong Solidity tương như class trong Java hay Python, có thể đa kế thừa sử dụng từ khóa 'is'
- Cấu trúc của một hàm trong Solidity : function function_name (parameter types) {internal | external | public | private} {pure | constant | view | payable} [returns (return types)]
  - internal : chỉ có thể truy cập từ các hàm bên trong Constract hoặc từ Constract con
  - external : có thể được truy cập từ Constract khác, bản thân Constract chứa hàm cũng có thể gọi nó thông qua 'this'
  - public : có thể được gọi từ Constract (không cần sử dụng đến this) hoặc từ constract khác
  - private : chỉ có thể truy cập từ hàm bên trong Constract
