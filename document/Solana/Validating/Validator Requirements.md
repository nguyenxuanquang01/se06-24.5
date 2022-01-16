# Validator Requirements

## Minumum SOL requirement

Không có yêu cầu số lượng SOL tối thiểu nghiêm ngặt để chạy trình xác thực trên Solana

Tuy nhiên, để tham gia vào sự đồng thuận, cần có tài khoản bỏ phiếu có dự trữ miễn tiền thuế là 0.02685864 SOL. Bỏ phiếu cũng yêu cầu gửi một giao dịch biểu quyết cho mỗi khối mà trình xác thực đồng ý, có thể tốn tới 1,1 SOL mỗi ngày.

## Hardware Recommendations

- CPU
    - 12 cores / 24 threads, hoặc nhiều hơn
    - 2.8GHz, hoặc nhanh hơn
    - Hỗ trợ hướng dẫn AVX2 (để sử dụng các tệp nhị phân phát hành chính thức, nếu không thì tự biên dịch)
    - Hỗ trợ hướng dẫn AVX512f và / hoặc SHA-NI rất hữu ích
    - Dòng AMD Zen3 rất phổ biến với cộng đồng validator
- RAM
    - 128GB, hoặc nhiều hơn
    - Bo mạch chủ có dung lượng 256GB
- Disk
    - PCIe Gen3 x4 NVME SSD, hoặc tốt hơn
    - Accounts: 500GB, hoặc lớn hơn. High TBW (Total Bytes Written)
    - Sổ cái: 1TB hoặc lớn hơn. TBW cao
    - OS:  500GB, hoặc lớn hơn. SATA OK
    - Hệ điều hành có thể được cài đặt trên đĩa sổ cái, mặc dù thử nghiệm đã cho thấy hiệu suất tốt hơn với sổ cái trên đĩa của chính nó.
    - Tài khoản và sổ cái có thể được lưu trữ trên cùng một đĩa, tuy nhiên do IOPS cao, điều này không được khuyến nghị
    - Dòng SSD Samsung 970 và 980 Pro rất phổ biến với cộng đồng validator
- GPUs
    - Không hoàn toàn cần thiết vào lúc này
    - Bo mạch chủ và bộ nguồn được chỉ định để thêm một hoặc nhiều GPU cao cấp trong đề suất tương lai.

## RPC Node Recommendations

Các khuyến nghị phần cứng ở trên nên được coi là mức tối thiểu nếu trình xác thực được sử dụng như một nút RPC. Để cung cấp đầy đủ chức năng và cải thiện độ tin cậy, cần thực hiện các điều chỉnh sau.

- CPU 
    - 16 cores/ 32 threads, hoặc nhiều hơn
- RAM
    - 256 GB, hoặc nhiều hơn
- Disk
    - Xem xét một đĩa sổ cái lớn hơn nếu cần có lịch sử giao dịch dài hơn
    - Tài khoản và sổ cái không được lưu trữ trên cùng một đĩa

## Virtual machines on Cloud Platforms

Mặc dù bạn có thể chạy trình xác thực trên nền tảng điện toán đám mây, nhưng nó có thể không tiết kiệm chi phí về lâu dài.

Tuy nhiên, Nó có thể thuận tiện khi chạy các nút api không bỏ phiếu trên các phiên bản VM để sử dụng nội bộ của riêng bạn. Trường hợp sử dụng này bao gồm các sàn giao dịch và dịch vụ được xây dựng trên Solana

Trên thực tế, trình xác thực mainnet-beta do nhóm vận hành hiện đang chạy trên phiên bản GCE n2-standard-32 với SSD 2048 GB để thuật tiện cho việc vận hành.

Đối với nên tảng đám mây khác, hãy chọn các loại phiên bản có thông số kỹ thuật tương tự.

Cũng lưu ý rằng việc sử dụng lưu lượng truy cập internet đầu ra có thể cao, đặc biệt là đối với trường hợp chạy trình xác thực cố định.

### Docker

Việc chạy trình xác thực cho các cụm trực tiếp (bao gồm cả mainnet-beta) bên trong Docker không được khuyến nghị và thường không dược hỗ trợ. Điều này là do lo ngại về chi phí lưu trữ chung của Docker và sự suy giảm hiệu suất dẫn đến trừ khi được định cấu hình đặc biệt.

Chúng ta chỉ sử dụng Docker cho mục đích phát triển. Docker Hub chứa hình ảnh cho tất cả các bản phát hành tại solanalabs / solana

### Networking

Dịch vụ Internet tối thiểu phải là 300Mbit / s đối xứng, thương mại. Ưu tiên 1GBit/s

#### Port Forwarding

Các cổng sau cần được mở cho internet cho cả đầu vào và đầu ra

Bạn không nên chạy trình xác nhận sau NAT. Các nhà khai thác chọn làm như vậy nên cảm thấy thoải mái khi định cấu hình thiết bị mạng của họ và tự gỡ lỗi bất kỳ sự cố truyền tải nào.
##### Required
- 8000-10000 TCP/UDP - P2P protocols (gossip, turbine, repair, etc). This can be limited to any free 12 port range with `--dynamic-port-range`
##### Optional

Vì mục đích bảo mật, không nên mở các cổng sau vào internet trên trình xác thực mainnet-beta được đặt cọc.

- 8899 TCP - JSONRPC qua HTTP. Thay đổi bằng `--rpc-port RPC_PORT ''
- 8900 TCP - JSONRPC qua Websockets. Nguồn gốc. Sử dụng RPC_PORT + 1