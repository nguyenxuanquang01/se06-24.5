- Đồng bộ hóa nhanh chóng, đáng tin cậy là lý do lớn nhất khiến Solana có thể đạt được thông lượng cao như vậy. Các chuỗi khối truyền thống đồng bộ hóa trên các khối lớn 
giao dịch được gọi là khối. Bằng cách đồng bộ hóa trên các khối, một giao dịch không thể được xử lý cho đến khi một khoảng thời gian, được gọi là "thời gian khối", đã trôi qua.
Trong sự đồng thuận của Proof of Work, thời gian khối này cần rất lớn ( ~ 10 phút ) để giảm thiểu tỷ lệ cược của nhiều trình xác thực tạo ra một khối hợp lệ mới cùng một lúc.
Không có ràng buộc nào như vậy trong sự đồng thuận Proof of Stake, nhưng nếu không có dấu thời gian đáng tin cậy, trình xác thực không thể xác định thứ tự của các khối đến.
Cách giải quyết phổ biến là gắn thẻ từng khối bằng dấu thời gian của đồng hồ treo tường. Do độ trễ của đồng hồ và sự khác biệt về độ trễ mạng, dấu thời gian chỉ chính xác trong 
vòng một hoặc hai giờ. Để giải quyết cách giải quyết, các hệ thống này kéo dài thời gian khối để cung cấp sự chắc chắn hợp lý rằng dấu thời gian trung bình trên mỗi khối luôn tăng.

- Solana có một cách tiếp cận rất khác, được gọi là Proof of History hoặc PoH . Các khối "dấu thời gian" của các nút lãnh đạo với các bằng chứng mật mã mà một khoảng thời gian 
nào đó đã trôi qua kể từ lần chứng minh cuối cùng. Tất cả dữ liệu được băm thành bằng chứng chắc chắn nhất đã xảy ra trước khi bằng chứng được tạo. Sau đó, nút chia sẻ khối mới
với các nút trình xác thực, có thể xác minh các bằng chứng đó. Các khối có thể đến trình xác thực theo bất kỳ thứ tự nào hoặc thậm chí có thể được phát lại nhiều năm sau đó.
Với các đảm bảo đồng bộ hóa đáng tin cậy như vậy, Solana có thể chia khối thành các lô giao dịch nhỏ hơn được gọi là các mục nhập. Các mục nhập được truyền trực tuyến tới trình
xác thực trong thời gian thực, trước bất kỳ khái niệm nào về sự đồng thuận của khối.

- Về mặt kỹ thuật, Solana không bao giờ gửi một khối , nhưng sử dụng thuật ngữ này để mô tả chuỗi các mục nhập mà người xác nhận bỏ phiếu để đạt được xác nhận . Bằng cách đó, 
thời gian xác nhận của Solana có thể được so sánh giữa quả táo với quả táo với các hệ thống dựa trên khối. Việc triển khai hiện tại đặt thời gian khối thành 800ms.

### Relationship to VDFs

- Kỹ thuật Proof of History lần đầu tiên được Solana mô tả để sử dụng trong blockchain vào tháng 11 năm 2017. Vào tháng 6 năm sau, một kỹ thuật tương tự đã được mô tả tại 
Stanford và được gọi là hàm trì hoãn có thể xác minh hoặc VDF.

- Đặc tính mong muốn của VDF là thời gian xác minh rất nhanh. Cách tiếp cận của Solana để xác minh chức năng trì hoãn của nó tỷ lệ thuận với thời gian tạo ra nó, cách tiếp cận của
Solana chậm về mặt thuật toán và nó không nên được gọi là VDF. Thuật ngữ VDF nên đại diện cho danh mục các hàm trễ có thể xác minh được và không chỉ là tập hợp con với các đặc 
tính hiệu suất nhất định. Cho đến khi điều đó được giải quyết, Solana có thể sẽ tiếp tục sử dụng thuật ngữ PoH cho VDF dành riêng cho ứng dụng của nó.

- Một sự khác biệt khác giữa PoH và VDF là VDF chỉ được sử dụng cho thời lượng theo dõi. Mặt khác, chuỗi băm của PoH bao gồm các hàm băm của bất kỳ dữ liệu nào mà ứng dụng quan 
sát được. Dữ liệu đó là một con dao hai lưỡi. Một mặt, dữ liệu "Proof of History" - rằng dữ liệu chắc chắn tồn tại trước các hàm băm sau nó. Mặt khác, nó có nghĩa là ứng dụng có 
thể thao tác chuỗi băm bằng cách thay đổi khi dữ liệu được băm. Do đó, chuỗi PoH không đóng vai trò là một nguồn ngẫu nhiên tốt trong khi VDF không có dữ liệu đó có thể.

- Proof of History không phải là một cơ chế đồng thuận, nhưng nó được sử dụng để cải thiện hiệu suất của sự đồng thuận Proof of Stake của Solana. Nó cũng được sử dụng để cải thiện 
hiệu suất của các giao thức mặt phẳng dữ liệu.
