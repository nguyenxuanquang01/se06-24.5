### Wallet

- Ví tiền điện tử là một thiết bị hoặc ứng dụng lưu trữ một bộ sưu tập các khóa và có thể được sử dụng để gửi/nhận và theo dõi quyền sở hữu tiền điện tử 
- Ví có thể có nhiều dạng. Ví có thể là một thư mục hoặc tệp trong hệ thống tệp máy tính, một thiết bị chuyên dụng được gọi là ví phần cứng. Ngoài ra còn có các ứng dụng điện thoại thông minh và chương trình máy tính cung cấp một các thân thiện với người dùng để tạo và quản lý ví
- Khóa riêng tư (private key) và khóa công khai (public key) được gọi là một cặp khóa. Ví chứa một bộ sưu tập của một hoặc nhiều cặp khóa và cung cấp một số phương tiện để tương tác với chúng 

#### Public Key (pubkey) 

- Được gọi là địa chỉ nhận của ví.
- Địa chỉ ví có thể được chia sẻ và hiển thị tự do.
- Khi một bên khác muốn gửi một số lượng tiền điện tử vào ví, họ cần biết địa chỉ nhận của ví 
- Tùy thuộc vào việc triển khai blockchain, địa chỉ cũng có thể được sử dụng để xem thông tin nhất định về ví, chẳng hạn như xem số dư nhưng không có khả năng thay đổi bất kỳ điều gì về ví hoặc rút bất kỳ token nào 

#### Private Key

- Được yêu cầu để ký kỹ thuật số bất kỳ giao dịch nào để gửi tiền điện tử đến một địa chỉ khác hoặc thực hiện bất kỳ thay đổi nào đối với ví
- Khóa riêng tư không bao giờ được chia sẻ
- Nếu ai đó có quyền truy cập vào khóa riêng tư của một ví thì họ có thể rút tất cả token của ví đó
- Nếu khóa cá nhân của ví bị mất, bất kỳ token nào đã được gửi đến địa chỉ của ví đó sẽ bị mất vĩnh viễn

### Solution

- Các giải pháp ví khác nhau cung cấp các cách tiếp cận khác nhau để có thể bảo mật cặp khóa, tương tác với cặp khóa và ký giao dịch để sử dụng token
- Một số lưu trữ và sao lưu khóa cá nhân an toàn hơn. Solana hỗ trợ nhiều loại ví để ta có thể chọn số dư phù hợp về bảo mật và tiện lợi

### Supported Wallets

- Solana hỗ trợ một số loại ví trong command-line Solana cũng như ví từ bên thứ 3
- Chúng ta nên sử dụng ví ứng dụng hoặc ví web trên browser điều này sẽ cung cấp trải nghiệm người dùng quen thuộc hơn thay vì phải học các công cụ dòng lệnh
- Đối với người dùng hoặc nhà phát triển nâng cao, ví dòng lệnh có thể thích hợp hơn, vì các tính năng mới trên Blockchain Solana sẽ luôn được hỗ trợ trên dòng lệnh trước khi được tích hợp vào các giải pháp bên thứ 3.
