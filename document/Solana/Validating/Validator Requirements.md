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

