### Solana Clusters
- Cluster là một tập hợp các máy tính đang làm việc cùng nhau. Chúng có thể được nhìn từ bên ngoài như một hệ thống số ít
- Solana Cluster là tập hợp các máy tính sở hữu độc lập thường hoạt động cùng nhau (cũng có thể chống lại nhau). Máy tính giúp xác minh kết quả đầu ra của các chương trình không đáng tin cậy, do người dùng gửi
- Solana Cluster là một tập hợp các trình xác thực làm việc cùng nhau để phục vụ các giao dịch của khách hàng và duy trì tính toán vẹn của cửa số cái, nhiều cụm có thể cùng tồn tại song song. Các giao dịch được gửi đến không đúng nơi sẽ bị từ chối một cách lặng lẽ
- Solana duy trì một số cụm khác nhau với các mục đích khác nhau 
- Hơn nữa ta có thể sử dụng cụm bất cứ lúc nào mà người dùng hy vọng sẽ lưu trữ một bản ghi bất biến về các sự kiện hoặc diễn giải theo chương trình của các sự kiện

### Tính năng của Solana Clusters
- Xác minh đầu ra của các chương trình không đáng tin cậy, do người dùng gửi
- Ghi và lưu lại bất kỳ giao dịch hoặc sự kiện nào mà người dùng thực hiện
- Theo dõi những máy tính nào đã làm công việc có ý nghĩa để duy trì cho mạng lưới hoạt động
- Theo dõi việc sở hữu các tài sản trong thế giới thực

### Mainnet - Blockchain main network
- Mainnet được hiểu là giao thức chính, trực tiếp
- Đó là một chuỗi khối thực hiện chức năng chuyển tiền kỹ thuật số từ người gửi sang người nhận
- Các giao dịch diễn ra trên mainnet sử dụng tiền điện tử gốc của mạng và được ghi lại trên sổ cái phân tán
- Các giao thức blockchain mã nguồn mở như Ethereum và Bitcoin được thiết kế để có thể xác minh công khai và thực hiện các giao dịch xác thực
- Mainnet trong tiền điện tử cung cấp một cách đáng tin cậy và hiệu quả để đánh giá mức độ thành công của bất kỳ dự án blockchain mới nổi nào

### Devnet - Mạng lưới phát triển blockchain
- Giao thức solana khẳng định rằng devnet hoạt động như một "sân chơi" cho những người trải nghiệm giao thức với tư cách là người dùng blockchain, chủ sở hữu token, nhà phát triển ứng dụng hoặc trình xác thực mạng.
- Tiền điện tử devnet thường không có giá trị thực và các giao dịch devnet yêu cầu ít nỗ lực tính toán hơn so với mạng mainnet của chúng 
- Đối với blockchain devnet người dùng cũng có thể khai thác tiền điện tử hoặc truy cập các dịch vụ vòi để lấy tiền 

### Testnet - Mạng thử nghiệm blockchain
- Testnet đại diện cho các nút đã đồng ý làm việc cộng tác, độc lập với mạng chính
- VD Ethereum có 5 Testnet, mỗi Testnet có mục đích và thông số lập trình riêng - Kovan, Rinkeby, Sokol, Gorli, Ropsten
- Các Testnet hoạt động như bản sao chính xác của giao thức gốc, sử dụng cùng một công nghệ và phần mềm để cung cấp chức năng tương tự
- Các giao dịch trên Testnet chỉ là mô phỏng - tiền điện tử không có giá trị thực bên ngoài môi trường Testnet
- Động lực này cung cấp môi trường lý tưởng để kiểm tra các Smart Constract và các ứng dụng phi tập trung (dApps)
- Hơn nữa Testnet cung cấp một môi trường "đồng hồ cát" để các dev có thể liên tục điều chỉnh và cải thiện phiên bản trực tiếp về dự án trước khi khởi chạy trên mạng chính 
### Creating a Cluster
- Trước khi bắt đầu bất kì trình xác thực nào, trước tiên người ta cần tạo một cấu hình generis. Cấu hình tham chiếu đến hai khoá công khai, một khoá cơ bản và một trình xác thực bootstrap. Trình xác thực giữ khoá riêng của trình xác thực bootstrap chịu trách nhiệm bổ sung các mục nhập đầu tiên vào cửa sổ cái. Nó khởi tạo trạng thái bên trong bằng tài khoản của người đúc tiền. Tài khoản đó sẽ giữ số lượng mã thông báo gốc được cấu hình genesis xác định. Sau đó, trình xác thực thứ hai liên hệ với trình xác nhận bootstrap để đăng ký làm trình xác nhận. Các trình xác thực bổ sung sau đó đăng ký với bất kỳ thành viên đã đăng ký nào của cụm.
- Người xác nhận sẽ nhận tất cả các bài dự thi từ người đứng đầu và gửi phiếu xác nhận các bài dự thi đó là hợp lệ. Sau khi bỏ phiếu, người xác nhận sẽ lưu trữ các mục nhập đó. Khi trình xác thực nhận thấy có đủ số lượng bản sao tồn tại, nó sẽ xóa bản sao của nó.
### Joining a Cluster
- Người xác nhận nhập vào cụm thông qua thông báo đăng ký được gửi đến mặt phẳng điều khiển của nó. Mặt phẳng điều khiển được thực hiện bằng cách sử dụng giao thức gossip, có nghĩa là một nút có thể đăng ký với bất kỳ nút nào hiện có và mong đợi đăng ký của nó sẽ truyền đến tất cả các nút trong cụm. Thời gian để tất cả các nút đồng bộ hóa tỷ lệ với bình phương của số lượng nút tham gia vào cụm. Về mặt thuật toán, điều đó được coi là rất chậm, nhưng đổi lại thời gian đó, một nút được đảm bảo rằng cuối cùng nó có tất cả thông tin giống như mọi nút khác và thông tin đó không thể bị kiểm duyệt bởi bất kỳ một nút nào.
