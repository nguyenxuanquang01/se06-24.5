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

-Ủy quyền cổ phần
-Hủy kích hoạt ủy quyền giáo khu
-Tách tài khoản tiền cược, tạo tài khoản tiền cược mới với một phần tiền trong tài khoản đầu tiên
-Hợp nhất hai tài khoản cổ phần thành một
-Đặt cơ quan quyền lực cổ phần mới
