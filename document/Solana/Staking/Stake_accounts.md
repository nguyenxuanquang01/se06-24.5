# Cấu trúc tài khoản Stake
Tài khoản Stake trên Solana có thể được sử dụng để ủy quyền mã thông báo cho người xác thực trên mạng để có khả năng kiếm được phần thưởng cho chủ sở hữu của tài khoản Stake. Tài khoản tiền cọc được tạo và quản lý khác với địa chỉ ví truyền thống, được gọi là tài khoản hệ thống . Tài khoản hệ thống chỉ có thể gửi và nhận SOL từ các tài khoản khác trên mạng, trong khi tài khoản Stake hỗ trợ các hoạt động phức tạp hơn cần thiết để quản lý ủy quyền mã thông báo.
Tài khoản cổ phần trên Solana cũng hoạt động khác với tài khoản của các mạng blockchain Proof-of-Stake khác mà bạn có thể quen thuộc. Tài liệu này mô tả cấu trúc cấp cao và các chức năng của tài khoản cổ phần Solana.
# Địa chỉ tài khoản
Mỗi tài khoản stake có một địa chỉ duy nhất có thể được sử dụng để tra cứu thông tin tài khoản trong dòng lệnh hoặc trong bất kỳ công cụ khám phá mạng nào. Tuy nhiên, không giống như địa chỉ ví trong đó chủ sở hữu cặp khóa của địa chỉ kiểm soát ví, cặp khóa được liên kết với địa chỉ tài khoản Stake không nhất thiết có bất kỳ quyền kiểm soát nào đối với tài khoản. Trên thực tế, một cặp khóa hoặc khóa cá nhân thậm chí có thể không tồn tại cho địa chỉ của tài khoản Stake.

Lần duy nhất địa chỉ của tài khoản Stake có tệp cặp khóa là khi tạo tài khoản Stake bằng các công cụ dòng lệnh . Một tệp cặp khóa mới được tạo trước tiên chỉ để đảm bảo rằng địa chỉ của tài khoản Stake là mới và duy nhất.Tìm hiểu Cơ quan Quản lý Tài khoản
# Tìm hiểu Cơ quan Quản lý Tài khoản
Một số loại tài khoản nhất định có thể có một hoặc nhiều cơ quan ký kết được liên kết với một tài khoản nhất định. Cơ quan tài khoản được sử dụng để ký các giao dịch nhất định cho tài khoản mà cơ quan này kiểm soát. Điều này khác với một số mạng blockchain khác, nơi chủ sở hữu cặp khóa được liên kết với địa chỉ của tài khoản kiểm soát tất cả hoạt động của tài khoản.

Mỗi tài khoản cổ phần có hai cơ quan ký tên được chỉ định theo địa chỉ tương ứng của họ, mỗi cơ quan được ủy quyền để thực hiện các hoạt động nhất định trên tài khoản cổ phần.

Cơ quan cổ phần được sử dụng để ký kết các giao dịch cho các hoạt động sau:

- Ủy quyền cổ phần
- Hủy kích hoạt ủy quyền giáo khu
- Tách tài khoản tiền cược, tạo tài khoản tiền cược mới với một phần tiền trong tài khoản đầu tiên
- Hợp nhất hai tài khoản cổ phần thành một
- Đặt cơ quan quyền lực cổ phần mới

Cơ quan rút tiền ký các giao dịch sau:

- Rút tiền cổ phần chưa được ủy quyền vào một địa chỉ ví
- Đặt thẩm quyền rút tiền mới
- Đặt cơ quan quyền lực cổ phần mới

Quyền sở hữu cổ phần và thẩm quyền rút tiền được đặt khi tài khoản tiền cược được tạo và chúng có thể được thay đổi để cho phép địa chỉ ký mới bất kỳ lúc nào. Cơ quan đặt cược và rút tiền có thể là cùng một địa chỉ hoặc hai địa chỉ khác nhau.

Cặp khóa cơ quan rút tiền nắm quyền kiểm soát nhiều hơn đối với tài khoản vì nó cần thiết để thanh lý các mã thông báo trong tài khoản cổ phần và có thể được sử dụng để đặt lại cơ quan cổ phần nếu cặp khóa cơ quan cổ phần bị mất hoặc bị xâm phạm.

Đảm bảo quyền rút tiền chống lại mất mát hoặc trộm cắp là điều tối quan trọng khi quản lý tài khoản tiền cược.

# Nhiều ủy quyền
Mỗi tài khoản cổ phần chỉ có thể được sử dụng để ủy quyền cho một trình xác thực tại một thời điểm. Tất cả các mã thông báo trong tài khoản đều được ủy quyền hoặc không được ủy quyền, hoặc đang trong quá trình được ủy quyền hoặc không được ủy quyền. Để ủy quyền một phần nhỏ mã thông báo của bạn cho trình xác thực hoặc ủy quyền cho nhiều trình xác thực, bạn phải tạo nhiều tài khoản cổ phần.

Điều này có thể được thực hiện bằng cách tạo nhiều tài khoản tiền cược từ một địa chỉ ví có chứa một số mã thông báo hoặc bằng cách tạo một tài khoản tiền cược lớn duy nhất và sử dụng cơ quan cổ phần để chia tài khoản thành nhiều tài khoản với số dư mã thông báo mà bạn chọn.

Có thể chỉ định cùng một quyền đặt cược và rút tiền cho nhiều tài khoản tiền cược.

# Hợp nhất các tài khoản cổ phần
Hai tài khoản cổ phần có cùng quyền hạn và khóa có thể được hợp nhất thành một tài khoản cổ phần kết quả duy nhất. Có thể hợp nhất giữa hai cổ phần ở các trạng thái sau mà không có điều kiện bổ sung:

- hai cổ phần đã ngừng hoạt động
- một cổ phần không hoạt động thành một cổ phần đang kích hoạt trong thời gian kích hoạt của nó

Đối với các trường hợp sau, tín dụng pubkey và phiếu bầu của người bầu cử được quan sát phải khớp với nhau:

- hai cổ phần đã kích hoạt
- hai tài khoản kích hoạt có chung một kỷ nguyên kích hoạt, trong suốt kỷ nguyên kích hoạt

Tất cả các kết hợp khác của trạng thái cổ phần sẽ không hợp nhất, bao gồm tất cả các trạng thái "tạm thời", nơi một cổ phần đang kích hoạt hoặc hủy kích hoạt với một cổ phần có hiệu lực khác 0.

# Khởi động ủy quyền và thời gian hồi chiêu
Khi một tài khoản cổ phần được ủy quyền, hoặc một ủy quyền bị hủy kích hoạt, hoạt động sẽ không có hiệu lực ngay lập tức.

Việc ủy quyền hoặc hủy kích hoạt mất vài kỷ để hoàn thành, với một phần nhỏ ủy quyền trở nên hoạt động hoặc không hoạt động ở mỗi ranh giới kỷ nguyên sau khi giao dịch chứa các hướng dẫn đã được gửi đến cụm.

Ngoài ra còn có giới hạn về tổng số cổ phần có thể được ủy quyền hoặc ngừng hoạt động trong một kỷ nguyên duy nhất, để ngăn chặn những thay đổi đột ngột lớn về cổ phần trên toàn mạng nói chung. Vì khởi động và thời gian hồi chiêu phụ thuộc vào hành vi của những người tham gia mạng khác, nên rất khó dự đoán thời gian chính xác của chúng. Thông tin chi tiết về thời gian khởi động và thời gian hồi chiêu có thể xem tại đây.

# Khóa
Các tài khoản tiền cọc có thể bị khóa để ngăn không cho các mã thông báo họ nắm giữ bị rút ra trước khi đạt đến một ngày hoặc kỷ nguyên cụ thể. Trong khi bị khóa, tài khoản tiền cược vẫn có thể được ủy quyền, không được ủy quyền hoặc chia tách, và các quyền hạn về tiền đặt cọc và rút tiền của nó có thể được thay đổi như bình thường. Chỉ rút tiền vào địa chỉ ví là không được phép.

Khóa chỉ có thể được thêm vào khi tài khoản đặt cược được tạo lần đầu tiên, nhưng nó có thể được sửa đổi sau đó, bởi cơ quan quản lý khóa hoặc người giám sát, địa chỉ của tài khoản này cũng được đặt khi tài khoản được tạo.

# Hủy tài khoản tiền cọc
Giống như các loại tài khoản khác trên mạng Solana, tài khoản tiền cược có số dư bằng 0 SOL sẽ không còn được theo dõi. Nếu tài khoản tiền cược không được ủy quyền và tất cả các mã thông báo trong đó được rút về địa chỉ ví, tài khoản tại địa chỉ đó sẽ bị hủy một cách hiệu quả và sẽ cần được tạo lại theo cách thủ công để sử dụng lại địa chỉ đó.

# Xem tài khoản cổ phần
Bạn có thể xem chi tiết tài khoản tiền cọc trên [Solana Explorer](http://explorer.solana.com/accounts) bằng cách sao chép và dán địa chỉ tài khoản vào thanh tìm kiếm.


