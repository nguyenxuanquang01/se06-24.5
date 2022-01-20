### Solana Clusters
- Cluster là một tập hợp các máy tính đang làm việc cùng nhau. Chúng có thể được nhìn từ bên ngoài như một hệ thống số ít
- Solana Cluster là tập hợp các máy tính sở hữu độc lập thường hoạt động cùng nhau (cũng có thể chống lại nhau). Máy tính giúp xác minh kết quả đầu ra của các chương trình không đáng tin cậy, do người dùng gửi
- Solana Cluster là một tập hợp các trình xác thực làm việc cùng nhau để phục vụ các giao dịch của khách hàng và duy trì tính toán vẹn của số cái, nhiều cụm có thể cùng tồn tại song song. Các giao dịch được gửi đến không đúng nơi sẽ bị từ chối một cách lặng lẽ
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
- Điểm nhập cho Mainnet Beta: `entrypoint.mainnet-beta.solana.com:8001`
- Biến môi trường chỉ số cho Mainnet Beta:
```bash
export SOLANA_METRICS_CONFIG="host=https://metrics.solana.com:8086,db=mainnet-beta,u=mainnet-beta_write,p=password"
```
- URL RPC cho MainnetBeta: `https://api.mainnet-beta.solana.com`
  - Giới hạn tỉ lệ:
    - Số lượng yêu cầu tối đa trong 10 giây trên mỗi IP: 100
    - Số lượng yêu cầu tối đa mỗi 10 giây trên mỗi IP cho một RPC: 40
    - Kết nối đồng thời tối đa trên mỗi IP: 40
    - Tốc độ kết nối tối đa trên 10 giây trên mỗi IP: 40
    - Lượng dữ liệu tối đa mỗi 30 giây: 100 MB
- Ví dụ về cấu hình dòng lệnh solana:
```bash
solana config set --url https://api.mainnet-beta.solana.com
```

### Devnet - Mạng lưới phát triển blockchain
- Giao thức solana khẳng định rằng devnet hoạt động như một "sân chơi" cho những người trải nghiệm giao thức với tư cách là người dùng blockchain, chủ sở hữu token, nhà phát triển ứng dụng hoặc trình xác thực mạng.
- Tiền điện tử devnet thường không có giá trị thực và các giao dịch devnet yêu cầu ít nỗ lực tính toán hơn so với mạng mainnet của chúng 
- Đối với blockchain devnet người dùng cũng có thể khai thác tiền điện tử hoặc truy cập các dịch vụ vòi để lấy tiền 
- Điểm nhập tin đồn cho Devnet: `entrypoint.devnet.solana.com:8001`
- Biến môi trường số liệu cho Devnet:

```bash
export SOLANA_METRICS_CONFIG="host=https://metrics.solana.com:8086,db=devnet,u=scratch_writer,p=topsecret"
```
- URL RPC cho Devnet: `https://api.devnet.solana.com`
  - Giới hạn tỉ lệ:
    - Số lượng yêu cầu tối đa trong 10 giây trên mỗi IP: 100
    - Số lượng yêu cầu tối đa mỗi 10 giây trên mỗi IP cho một RPC: 40
    - Kết nối đồng thời tối đa trên mỗi IP: 40
    - Tốc độ kết nối tối đa trên 10 giây trên mỗi IP: 40
    - Lượng dữ liệu tối đa mỗi 30 giây: 100 MB

- Ví dụ về cấu hình dòng lệnh solana:

```bash
solana config set --url https://api.devnet.solana.com
```

### Testnet - Mạng thử nghiệm blockchain
- Testnet đại diện cho các nút đã đồng ý làm việc cộng tác, độc lập với mạng chính
- VD Ethereum có 5 Testnet, mỗi Testnet có mục đích và thông số lập trình riêng - Kovan, Rinkeby, Sokol, Gorli, Ropsten
- Các Testnet hoạt động như bản sao chính xác của giao thức gốc, sử dụng cùng một công nghệ và phần mềm để cung cấp chức năng tương tự
- Các giao dịch trên Testnet chỉ là mô phỏng - tiền điện tử không có giá trị thực bên ngoài môi trường Testnet
- Động lực này cung cấp môi trường lý tưởng để kiểm tra các Smart Constract và các ứng dụng phi tập trung (dApps)
- Hơn nữa Testnet cung cấp một môi trường "đồng hồ cát" để các dev có thể liên tục điều chỉnh và cải thiện phiên bản trực tiếp về dự án trước khi khởi chạy trên mạng chính 
- Điểm nhập cho Testnet: `entrypoint.devnet.solana.com:8001`
- Biến môi trường chỉ số cho Testnet:

```bash
export SOLANA_METRICS_CONFIG="host=https://metrics.solana.com:8086,db=tds,u=testnet_write,p=c4fa841aa918bf8274e3e2a44d77568d9861b3ea"
```
- URL RPC cho Testnet: `https://api.testnet.solana.com`
  - Giới hạn tỉ lệ:
    - Số lượng yêu cầu tối đa trong 10 giây trên mỗi IP: 100
    - Số lượng yêu cầu tối đa mỗi 10 giây trên mỗi IP cho một RPC: 40
    - Kết nối đồng thời tối đa trên mỗi IP: 40
    - Tốc độ kết nối tối đa trên 10 giây trên mỗi IP: 40
    - Lượng dữ liệu tối đa mỗi 30 giây: 100 MB

- Ví dụ về cấu hình dòng lệnh solana:

```bash
solana config set --url https://api.testnet.solana.com
```

### Creating a Cluster
- Trước khi bắt đầu bất kì trình xác thực nào, trước tiên người ta cần tạo một cấu hình generis. Cấu hình tham chiếu đến hai khoá công khai, một khoá cơ bản và một trình xác thực bootstrap. Trình xác thực giữ khoá riêng của trình xác thực bootstrap chịu trách nhiệm bổ sung các mục nhập đầu tiên vào cửa sổ cái. Nó khởi tạo trạng thái bên trong bằng tài khoản của người đúc tiền. Tài khoản đó sẽ giữ số lượng mã thông báo gốc được cấu hình genesis xác định. Sau đó, trình xác thực thứ hai liên hệ với trình xác nhận bootstrap để đăng ký làm trình xác nhận. Các trình xác thực bổ sung sau đó đăng ký với bất kỳ thành viên đã đăng ký nào của cụm.
- Người xác nhận sẽ nhận tất cả các bài dự thi từ người đứng đầu và gửi phiếu xác nhận các bài dự thi đó là hợp lệ. Sau khi bỏ phiếu, người xác nhận sẽ lưu trữ các mục nhập đó. Khi trình xác thực nhận thấy có đủ số lượng bản sao tồn tại, nó sẽ xóa bản sao của nó.

### Joining a Cluster
- Người xác nhận nhập vào cụm thông qua thông báo đăng ký được gửi đến mặt phẳng điều khiển của nó. Mặt phẳng điều khiển được thực hiện bằng cách sử dụng giao thức gossip, có nghĩa là một nút có thể đăng ký với bất kỳ nút nào hiện có và mong đợi đăng ký của nó sẽ truyền đến tất cả các nút trong cụm. Thời gian để tất cả các nút đồng bộ hóa tỷ lệ với bình phương của số lượng nút tham gia vào cụm. Về mặt thuật toán, điều đó được coi là rất chậm, nhưng đổi lại thời gian đó, một nút được đảm bảo rằng cuối cùng nó có tất cả thông tin giống như mọi nút khác và thông tin đó không thể bị kiểm duyệt bởi bất kỳ một nút nào.

### Sending Transactions to a Cluster
- Khách hàng gửi giao dịch đến bất kỳ cổng đơn vị xử lý giao dịch ( TPU ) của trình xác thực. Nếu nút ở vai trò trình xác thực, nó sẽ chuyển tiếp giao dịch đến người lãnh đạo được chỉ định. Nếu ở vai trò người lãnh đạo, nút sẽ nhóm các giao dịch đến, đánh dấu thời gian chúng tạo một mục nhập và đẩy chúng lên mặt phẳng dữ liệu của cụm . Khi ở trên bình diện dữ liệu, các giao dịch được xác thực bởi các nút trình xác thực, gắn chúng vào sổ cái một cách hiệu quả.

### Confirming Transactions
- Một cụm Solana có khả năng xác nhận dưới giây cho hàng nghìn nút với kế hoạch mở rộng quy mô lên đến hàng trăm nghìn nút. Thời gian xác nhận dự kiến sẽ chỉ tăng theo logarit của số lượng trình xác nhận, trong đó cơ số của logarit là rất cao. Ví dụ: nếu cơ sở là một nghìn, điều đó có nghĩa là đối với nghìn nút đầu tiên, xác nhận sẽ là khoảng thời gian của ba bước nhảy mạng cộng với thời gian để trình xác nhận chậm nhất trong đa số bỏ phiếu. Đối với một triệu nút tiếp theo, xác nhận chỉ tăng một bước mạng.
- Solana định nghĩa xác nhận là khoảng thời gian kể từ khi người lãnh đạo đánh dấu thời gian cho một mục nhập mới cho đến thời điểm nó nhận ra phần lớn các phiếu bầu trên sổ cái.
- Xác nhận có thể mở rộng có thể đạt được bằng cách sử dụng kết hợp các kỹ thuật sau:
1. Dấu thời gian giao dịch với một mẫu VDF và ký vào dấu thời gian.
2. Chia các giao dịch thành các lô, gửi từng giao dịch đến các nút riêng biệt và yêu cầu mỗi nút chia sẻ lô của mình với các đồng nghiệp của nó.
3. Lặp lại bước trước một cách đệ quy cho đến khi tất cả các nút có tất cả các lô.
- Solana luân phiên các nhà lãnh đạo theo những khoảng thời gian cố định, được gọi là thời điểm. Mỗi nhà lãnh đạo chỉ có thể tạo các mục nhập trong thời gian được phân bổ của nó. Do đó, người lãnh đạo đánh dấu thời gian các giao dịch để người xác thực có thể tra cứu khóa công khai của người lãnh đạo được chỉ định. Sau đó, người lãnh đạo ký vào dấu thời gian để người xác thực có thể xác minh chữ ký, chứng minh người ký là chủ sở hữu khóa công khai của người lãnh đạo được chỉ định.
- Tiếp theo, các giao dịch được chia thành nhiều đợt để một nút có thể gửi giao dịch cho nhiều bên mà không cần tạo nhiều bản sao. Ví dụ: nếu người lãnh đạo cần gửi 60 giao dịch đến 6 nút, nó sẽ chia bộ sưu tập 60 đó thành các lô 10 giao dịch và gửi một giao dịch đến mỗi nút. Điều này cho phép người lãnh đạo đặt 60 giao dịch trên dây, không phải 60 giao dịch cho mỗi nút. Sau đó, mỗi nút chia sẻ lô của nó với các nút khác. Khi nút đã thu thập tất cả 6 lô, nó sẽ tạo lại tập hợp ban đầu gồm 60 giao dịch.
